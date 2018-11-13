<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Dup\UserBundle\Entity\User;

/**
 * UtilisateurSociete
 *
 * @ORM\Table(name="utilisateur_societe")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\UtilisateurSocieteRepository")
 */
class UtilisateurSociete
{
    use SocieteTrait;
    
    public function __construct (User $user = null, Societe $societe = null)
    {
        if($user !== null){
            $this->setUser( $user);
        }
        
        if($societe !== null){
            $this->setSociete( $societe);
        }
    }
    
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;
    
    /**
     * @var User
     * @ORM\ManyToOne(targetEntity="Dup\UserBundle\Entity\User")
     */
    private $user;

    

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }
    
    /**
     * @return User
     */
    public function getUser () : User
    {
        return $this -> user;
    }
    
    /**
     * @param User $user
     */
    public function setUser ( User $user )
    {
        $this -> user = $user;
    }
    
    
}

