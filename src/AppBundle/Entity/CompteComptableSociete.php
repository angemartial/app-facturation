<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CompteComptableSociete
 *
 * @ORM\Table(name="compte_comptable_societe")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CompteComptableSocieteRepository")
 */
class CompteComptableSociete
{
    use SocieteTrait;
    
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;
    
    /**
     * @var Compte
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Compte")
     */
    private $compte;
    
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
     * @return Compte
     */
    public function getCompte () :? Compte
    {
        return $this -> compte;
    }
    
    /**
     * @param Compte $compte
     *
     * @return CompteComptableSociete
     */
    public function setCompte ( Compte $compte ) : CompteComptableSociete
    {
        $this -> compte = $compte;
        
        return $this;
    }
}
