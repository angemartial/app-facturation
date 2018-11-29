<?php
/**
 * Created by PhpStorm.
 * User: ANGEM
 * Date: 23/11/2018
 * Time: 22:13
 */

namespace AppBundle\Listener;


use AppBundle\Controller\CrmController;
use AppBundle\Entity\Societe;
use AppBundle\Entity\UtilisateurSociete;
use Doctrine\Bundle\DoctrineBundle\Registry;
use Dup\UserBundle\Entity\User;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\HttpKernel\Event\FilterControllerEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;
use Symfony\Bridge\Doctrine\RegistryInterface;
use Symfony\Component\Routing\RouterInterface;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

class CompanySubscriber implements EventSubscriberInterface
{

    private $em;
    private $router;
    private $storage;
    private $companySelectionRoute = 'dup_user_pick_or_create_company';
    protected $session;

    public function __construct(RegistryInterface $doctrine, RouterInterface $router, TokenStorageInterface $storage, SessionInterface $session)
    {
        $this->em = $doctrine->getManager();
        $this->router = $router;
        $this->storage = $storage;
        $this->session = $session;
    }

    public function onKernelController(FilterControllerEvent $event){

        $controller = $event->getController();

        if (!is_array($controller)) {
            return;
        }
        if($controller[0] instanceof CrmController){
            $user = $this->storage->getToken()->getUser();

            if(!$user instanceof User){
                return;
            }

            $userCompanies = $this->em->getRepository(UtilisateurSociete::class)->findBy(['user' => $user]);

            if(0 === count($userCompanies)){
                $error = "Vous n'etes pas encore membre d'une société. Vous pouvez en creer une nouvelle ou rejoindre une société existante.";
            }else{
                $permalink = trim(strip_tags($event->getRequest()->attributes->get('permalink')));
                $existing = $this->em->getRepository(Societe::class)->findOneBy(['permalien' => $permalink]);
                if(null === $existing){
                    $error = "L'entreprise $permalink n'existe pas dans notre systeme. Vous pouvez la créer ci dessous";
                }else{
                    $existingUserCompany = null;
                    foreach ($userCompanies as $userCompany) {
                        if($userCompany->getSociete()->getId() === $existing->getId()){
                            $existingUserCompany = $existing;
                            break;
                        }
                    }
                    if(null === $existingUserCompany){
                        $error = "Vous ne faites pas encore partie de la société $permalink. Si vous disposez d'un lien d'invitation, vous pouvez l'utiliser ci dessous pour rejoindre la société.";
                    }else{
                        $controller[0]->company = $existing;
                        return;
                    }
                }
            }

            $this->session->getFlashBag()->add('danger', $error);
            $redirectUrl = $this->router->generate($this->companySelectionRoute);
            $event->setController(function() use ($redirectUrl) {
                return new RedirectResponse($redirectUrl);
            });
        }
    }

    public static function getSubscribedEvents()
    {
        return array(
            KernelEvents::CONTROLLER => 'onKernelController',
        );
    }
}