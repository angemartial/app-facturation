<?php

namespace Dup\UserBundle\Controller;

use Dup\BackboneBundle\Service\ToArray;
use Dup\UserBundle\Entity\User;
use Dup\UserBundle\Entity\UserParameter;

use FOS\UserBundle\Model\UserInterface;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PropertyAccess\PropertyAccess;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class DefaultController extends Controller
{
    const DEFAULT_AVATAR = 'default.png';
    
    public function socialLoginAction(Request $request){
        return $this->render( "default/social-login.html.twig");
    }
    
    public function socialRegistrationAction(Request $request){
        $posts = $request->request->all();
        $error = false;
        if( false === array_key_exists( 'email', $posts) ||
            false === array_key_exists( 'confirm', $posts) ||
            false === array_key_exists( 'plainPassword', $posts)
            
        ){
            $this->addFlash( 'error', 'Merci de renseigner tous les champs requis');
            $error = true;
        }
        
        $email = trim(strip_tags( $posts['email']));
        $confirm  = trim($posts['confirm']);
        $password  = trim($posts['plainPassword']);
        
        if( empty($email) ||
           empty($confirm) ||
           empty($password) ){
            $this->addFlash( 'error', 'Merci de renseigner tous les champs requis');
            $error = true;
        }
        
        if ( false === filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $this->addFlash( 'error', 'Email est incorrecte');
            $error = true;
        }
        
        if($confirm !== $password){
            $this->addFlash( 'error', 'Les mots de passes ne sont pas identiques');
            $error = true;
        }
        
        if($error === true){
            return $this->redirectToRoute( 'dup_user_social_login');
        }
        $userManager = $this->get('fos_user.user_manager');
        /** @var User $user */
        $user = $userManager->createUser();
        
        $user->setEnabled( true);
        $user->setUsername( $email);
        $user->setPlainPassword( $password);
        $user->setEmail( $email);
        
        $userManager->updateUser( $user);
        $user->eraseCredentials();
        
        $this->sendConfirmationEmail( $user);
        
        return $this->redirectToRoute( "index");
        
    }
    
    public function sendConfirmationEmail(User $user){
        $generator = $this->get('fos_user.util.token_generator');
        $token = $generator->generateToken();
        $user->setConfirmationToken( $token);
        $userManager = $this->get('fos_user.user_manager');
        $userManager->updateUser( $user);
        $mailer = $this->get( "mailer");
        $message = 'Bonjour : '.$user->getUsername().PHP_EOL;
        $message .= 'Vous avez procédé à une inscription sur notre plateforme. .'.PHP_EOL;
        $message .= 'Cliquez sur le lien ci-dessous pour confirmer votre inscription'.PHP_EOL;
    
        $message .= $this->generateUrl('fos_user_registration_confirm', ['token' =>  $token ], UrlGeneratorInterface::ABSOLUTE_URL);
    
        $message = (new \Swift_Message('Message de contact utilisateur immobilier.ibohcompany.com'))
            ->setFrom(['info@ibohcompany.com' => 'Immobilier-Iboh'])
            ->setTo([ $user->getEmail() => $user->getUsername() ])
            ->setBody($message);
    
        $mailer->send($message);
        
    }
    
    
    public function changeActionDateAction ()
    {
        $user = $this -> getUser ();
        $user -> setLastActionDate ( new \DateTime() );
        $em = $this -> getDoctrine ()
                    -> getManager ();
        $em -> persist ( $user );
        $em -> flush ();
        
        return new Response( "ok" );
    }
    
    public function updateUserAction ( Request $request )
    {
        $validPosts = [ 'avatar', 'prenoms', 'nom', 'param-chat' /*,  'email' */, 'birthdate', 'param-chrono', 'param-battle' ];
        $posts      = $request -> request -> all ();
        /** @var User $user */
        $user        = $this -> getUser ();
        $em          = $this -> get ( 'doctrine.orm.entity_manager' );
        $params      = $em -> getRepository ( 'DupUserBundle:UserParameter' ) -> findBy ( [ 'user' => $user ] );
        $paramMapped = [];
        $result = [
            'changed' => []
        ];
        foreach ( $params as $param ) {
            $title                 = (string) $param -> getTitle ();
            $paramMapped[ $title ] = $param;
        }
        foreach ( $posts as $property => $value ) {
            if ( in_array ( $property, $validPosts, true ) === false ) {
                continue;
            }
            $validValue = trim ( strip_tags ( $value ) );
            switch ( $property ) {
                case 'birthdate' :
                    $user -> setBirthdate ( \DateTime ::createFromFormat ( ToArray::DATE_FORMAT, $validValue ) );
                    break;
                case 'prenoms' :
                    $user -> setPrenoms ( $validValue );
                    break;
                case 'nom' :
                    $user -> setNom ( $validValue );
                    break;
                case 'avatar' :
                    $avatarDir      = $this -> get ( 'kernel' ) -> getRootDir () . '/../web/uploads/medias/avatars/';
                    $previousAvatar = $user -> getAvatar ();
                    if ( $previousAvatar !== self::DEFAULT_AVATAR ) {
                        
                        @unlink ( $avatarDir . $previousAvatar );
                    }
                    $filename = sha1 ( uniqid () . 'I luv u !' );
                    $filename = $this -> base64ToImage ( $validValue, $avatarDir, $filename );
                    $user -> setAvatar ( $filename );
                    $user->setAvatarHost( 'local');
                    $result['newAvatar'] = $filename;
                    break;
                case 'param-chrono':
                case 'param-chat':
                case 'param-battle':
                    $parts = explode ( '-', $property );
                    /** @var UserParameter $parameter */
                    $parameter = $paramMapped[ $parts[ 1 ] ];
                    $parameter -> setValue ( $validValue );
                    $em -> persist ( $parameter );
                    break;
            }
            $result['changed'][] = $property;
        }
        
        $em -> persist ( $user );
        $em -> flush ();
    
        return new Response( json_encode ( $result) );
    }
    
    private function base64ToImage ( $base64String, $directory, $filename )
    {
        $data = explode ( ',', $base64String );
        $image = base64_decode ( $data[ 1 ] );
        $f = \finfo_open();
        $mime = finfo_buffer( $f, $image, FILEINFO_MIME_TYPE);
        $extension = $this->getExtensionFromMime( $mime);
        $basename = $filename . '.' . $extension;
        $file = fopen ( $directory . $basename, "wb" );
        fwrite ( $file, $image );
        fclose ( $file );
        return $basename;
    }
    
    private function getExtensionFromMime($mimeType){
        $exploded = explode( '/', $mimeType);
        return $exploded[1];
    }
    
    public function completeRegistrationAction(Request $request){
        $pass = trim(strip_tags($request->request->get('pass')) ) ;
        $confirm = trim(strip_tags( $request -> request -> get ( 'confirm' )));
        $email = trim(strip_tags( $request -> request -> get ( 'mail' )));
        $response = $this->redirectToRoute( 'dup_backbone.homepage');
        if($pass !== $confirm){
            $this->addFlash( 'warning', 'Mots de passes differents');
            return $response;
        }
        if((empty($email) && empty( $username)) || empty($password) || empty($confirm)){
            $this->addFlash( 'warning', 'Information manquante');
            return $response;
        }
        $userManager = $this->get('fos_user.user_manager');
        /** @var User $user */
        $user = $this->getUser();
        $user->setPlainPassword( $pass);
        if(!empty( $email)){
            $user->setEmail( $email);
        }
        if(!empty( $username)){
            $user->setUsername( $username);
        }
        $userManager->updateUser( $user, true);
        $this->addFlash( 'success', 'Informations enregistrées avec succes');
        return $response;
    }
    public function getInvitablesAction(Request $request){
    
    }

    
    private function getFriendsAction(){
        /** @var User $user */
        $user = $this->getUser();
        $resourceOwners = ['facebook', 'google'];
        $accessor = PropertyAccess::createPropertyAccessor();
        $results = [];
        foreach ( $resourceOwners as $owner ) {
            $propId = $accessor->getValue( $user, $owner.'Id');
            $results[$owner] = [];
            if(empty($facebookId)) {
                $results[ $owner ][ 'code' ] = 'ACCOUNT_NOT_LINKED';
            }else{
                $results[ $owner ]['code'] = 'SUCCESS';
                $friendGetter = 'get'.ucfirst( $owner).'Friends';
                $results[ $owner ]['results'] = $this->$friendGetter( $propId);
            }
        }
    }

    private function getFacebookFriends($userId){
        $result = json_decode(file_get_contents( 'graph.facebook.com/'.$userId.'/friends'), true) ;
        $nodes = $result['data'];
        $repository = $this->getDoctrine()->getManager()->getRepository( 'DupUserBundle:User');
        return $repository->findManyBy( array_map( function ($node){
            return $node['id'];
        }, $nodes), 'facebookId');
    }
    
    private function getGoogleFriends(){
    
    }
    
    public function addResourceOwnerAction(Request $request, $resourceOwner){
        $session = $request->getSession();
        $user = $this->getUser();
        $session->set('oauth_add_to_user', $user->getId());
        $session->set('oauth_add_to_user_stamp', time());
        $helper = $this->get('hwi_oauth.security.oauth_utils');
        return $this->redirect($helper->getLoginUrl( $request, $resourceOwner));
    }
}
