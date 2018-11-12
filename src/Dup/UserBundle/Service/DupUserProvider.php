<?php
/**
 * Created by PhpStorm.
 * User: Stefann
 * Date: 03/10/2017
 * Time: 19:39
 */

namespace Dup\UserBundle\Service;


use Doctrine\Common\Persistence\ObjectManager;
use Dup\UserBundle\Entity\User;
use FOS\UserBundle\Model\UserManagerInterface;
use HWI\Bundle\OAuthBundle\Security\Core\User\FOSUBUserProvider;
use HWI\Bundle\OAuthBundle\OAuth\Response\UserResponseInterface;
use HWI\Bundle\OAuthBundle\Security\Core\Exception\AccountNotLinkedException;
use Symfony\Component\HttpFoundation\Session\Session;

class DupUserProvider extends FOSUBUserProvider
{
    private $om;
    private $session;
    const DEFAULT_ENTITY_ROLE = 'ROLE_USER';
    const DEFAULT_ROLE = 'ROLE_USER';
    
    public function __construct ( UserManagerInterface $userManager, ObjectManager $om, Session $session, array $properties )
    {
        parent ::__construct ( $userManager, $properties );
        $this->om = $om;
        $this->session = $session;
    }
    
    /**
     * {@inheritdoc}
     */
    public function loadUserByOAuthUserResponse(UserResponseInterface $response)
    {
        $username = $response->getUsername();
        if (null === $username) {
            throw new AccountNotLinkedException(sprintf("User '%s' not found.", $username));
        }
        $property = $this->getProperty($response);
        $toAdd = (int) $this->session->get('oauth_add_to_user');
        $toAddTime = (int) $this->session->get('oauth_add_to_user_stamp');
        $now = time();
        $user = $this->userManager->findUserBy(array($property => $username));
        if(!empty( $toAdd) && !empty( $toAddTime) && ( ($now - $toAddTime) < 300 ) && null === $user ){
            $user = $this->userManager->findUserBy( ['id' => $toAdd]);
            $this->accessor->setValue( $user, $property, $username);
            $this->userManager->updateUser( $user);
            $this->om->flush();
        }
        $this->session->remove( 'oauth_add_to_user');
        $this->session->remove( 'oauth_add_to_user_stamp');
        
        if(null === $user){
            $user = $this->createNewUser( $response);
        }
        return $user;
    }
    
    private function createNewUser(UserResponseInterface $response){
        $property = $this->getProperty($response);
        /** @var User $newUser */
        $newUser = $this->userManager->createUser();
        $this->accessor->setValue( $newUser, $property, $response->getUsername());
        $newUser->setNom( $response->getLastName());
        $newUser->setPrenoms( $response->getFirstName());
        $newUser->setEmail( $response->getEmail());
        $newUser->setEnabled( true);
        $defaultRole = $this->om->getRepository( 'DupUserBundle:Role')->findOneBy( [ 'code' => self::DEFAULT_ENTITY_ROLE ]);
        $newUser->addRole( self::DEFAULT_ROLE);
        $newUser->addEntityRole( $defaultRole);
        $newUser->setUsername(  bin2hex(openssl_random_pseudo_bytes( 20)) );
        $newUser->setPlainPassword( bin2hex(openssl_random_pseudo_bytes( 20)));
        if(null === $newUser->getEmail()){
            $newUser->setEmail( $newUser -> getUsername () . '@artipuzzle.com');
        }
        $newUser->setComplete( false);
        $newUser->setAvatar( $this->getProfilePicture( $response));
        $newUser->setAvatarHost( $response->getResourceOwner()->getName());
        $this->userManager->updateUser( $newUser);
        $this->om->flush();
        return $newUser;
    }
    
    private function getProfilePicture(UserResponseInterface $response){
        $owner = $response->getResourceOwner()->getName();
        $profilePicture = '';
        if('facebook' === $owner){
            $profilePicture = 'https://graph.facebook.com/'.$response->getUsername().'/picture?type=large';
        }
        if('google' === $owner){
            $profilePicture = $response->getProfilePicture();
        }
        return $profilePicture;
    }
    
}