<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * AdresseSociete
 *
 * @ORM\Table(name="adresse_societe")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\AdresseSocieteRepository")
 */
class AdresseSociete
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
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=255)
     */
    private $libelle;
    
    /**
     * @var Adresse
     *
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\Adresse")
     */
    private $adresse;


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
     * Set libelle
     *
     * @param string $libelle
     *
     * @return AdresseSociete
     */
    public function setLibelle($libelle)
    {
        $this->libelle = $libelle;

        return $this;
    }

    /**
     * Get libelle
     *
     * @return string
     */
    public function getLibelle()
    {
        return $this->libelle;
    }
    
    /**
     * @return Adresse
     */
    public function getAdresse ()
    {
        return $this -> adresse;
    }
    
    /**
     * @param Adresse $adresse
     *
     * @return AdresseSociete
     */
    public function setAdresse ( Adresse $adresse ) : AdresseSociete
    {
        $this -> adresse = $adresse;
        
        return $this;
    }
    
    
    
    
    
}

