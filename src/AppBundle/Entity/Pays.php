<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Pays
 *
 * @ORM\Table(name="pays")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\PaysRepository")
 */
class Pays
{
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
     * @ORM\Column(name="iso", type="string", length=3)
     */
    private $iso;

    /**
     * @var string
     *
     * @ORM\Column(name="titre", type="string", length=255, unique=true)
     */
    private $titre;
    
    /**
     * @var SystemeComptable
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\SystemeComptable")
     */
    private $systemeComptable;

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
     * Set titre
     *
     * @param string $titre
     *
     * @return Pays
     */
    public function setTitre($titre)
    {
        $this->titre = $titre;

        return $this;
    }

    /**
     * Get titre
     *
     * @return string
     */
    public function getTitre()
    {
        return $this->titre;
    }

    public function __toString()
    {
        return $this->getTitre();
    }
    
    /**
     * @return SystemeComptable
     */
    public function getSystemeComptable ()
    {
        return $this -> systemeComptable;
    }
    
    /**
     * @param SystemeComptable $systemeComptable
     *
     * @return $this
     */
    public function setSystemeComptable ( SystemeComptable $systemeComptable )
    {
        $this -> systemeComptable = $systemeComptable;
        
        return $this;
    }
    
    /**
     * @return string
     */
    public function getIso () : string
    {
        return $this -> iso;
    }
    
    /**
     * @param string $iso
     *
     * @return Pays
     */
    public function setIso ( string $iso ) : Pays
    {
        $this -> iso = $iso;
        
        return $this;
    }
    
    
}

