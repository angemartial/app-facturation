<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Societe
 *
 * @ORM\Table(name="societe")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\SocieteRepository")
 */
class Societe
{
    
    public function __construct ()
    {
        $this->agrements = new ArrayCollection();
        $this->adresseSocietes = new ArrayCollection();
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
     * @var SystemeComptable
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\SystemeComptable")
     */
    private $systemeComptable;
    
    /**
     * @var FormeJuridique
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\FormeJuridique")
     */
    private $formeJuridique;
    
    /**
     * @var SecteurActivite
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\SecteurActivite")
     */
    private $secteurActivite;
    
    /**
     * @var Monnaie
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Monnaie")
     */
    private $monnaie;

    /**
     * @var string
     *
     * @ORM\Column(name="raisonSociale", type="string", length=255)
     */
    private $raisonSociale;
    
    /**
     * @var AdresseSociete[]|ArrayCollection
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\AdresseSociete", mappedBy="societe", cascade={"persist", "remove"})
     */
    private $adresseSocietes;

    /**
     * @var string
     *
     * @ORM\Column(name="permalien", type="string", length=255)
     */
    private $permalien;
    
    /**
     * @var int
     *
     * @ORM\Column(name="capital_social", type="integer", nullable=true)
     */
    private $capitalSocial = 0;
    
    /**
     * @var ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\Agrement", mappedBy="societe")
     */
    private $agrements;
    
    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateDeCreation", type="datetime")
     */
    private $dateDeCreation;

    /**
     * @var string
     *
     * @ORM\Column(name="activitePrincipale", type="string", length=255)
     */
    private $activitePrincipale;
    
    /**
     * @var Pays
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Pays")
     */
    private $pays;


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
     * Set raisonSociale
     *
     * @param string $raisonSociale
     *
     * @return Societe
     */
    public function setRaisonSociale($raisonSociale)
    {
        $this->raisonSociale = $raisonSociale;

        return $this;
    }

    /**
     * Get raisonSociale
     *
     * @return string
     */
    public function getRaisonSociale()
    {
        return $this->raisonSociale;
    }

    /**
     * Set permalien
     *
     * @param string $permalien
     *
     * @return Societe
     */
    public function setPermalien($permalien)
    {
        $this->permalien = strtolower($permalien);

        return $this;
    }

    /**
     * Get permalien
     *
     * @return string
     */
    public function getPermalien()
    {
        return $this->permalien;
    }

    /**
     * Set dateDeCreation
     *
     * @param \DateTime $dateDeCreation
     *
     * @return Societe
     */
    public function setDateDeCreation($dateDeCreation)
    {
        $this->dateDeCreation = $dateDeCreation;

        return $this;
    }

    /**
     * Get dateDeCreation
     *
     * @return \DateTime
     */
    public function getDateDeCreation()
    {
        return $this->dateDeCreation;
    }

    /**
     * Set activitePrincipale
     *
     * @param string $activitePrincipale
     *
     * @return Societe
     */
    public function setActivitePrincipale($activitePrincipale)
    {
        $this->activitePrincipale = $activitePrincipale;

        return $this;
    }

    /**
     * Get activitePrincipale
     *
     * @return string
     */
    public function getActivitePrincipale()
    {
        return $this->activitePrincipale;
    }
    
    /**
     * @return int
     */
    public function getCapitalSocial ()
    {
        return $this -> capitalSocial;
    }
    
    /**
     * @param int $capitalSocial
     *
     * @return Societe
     */
    public function setCapitalSocial ( int $capitalSocial ) : Societe
    {
        $this -> capitalSocial = $capitalSocial;
        
        return $this;
    }
    
    /**
     * @return ArrayCollection
     */
    public function getAgrements () : ArrayCollection
    {
        return $this -> agrements;
    }
    
    /**
     * @param ArrayCollection $agrements
     *
     * @return Societe
     */
    public function setAgrements ( ArrayCollection $agrements )
    {
        $this -> agrements = $agrements;
        
        return $this;
    }
    
    /**
     * @return FormeJuridique
     */
    public function getFormeJuridique ()
    {
        return $this -> formeJuridique;
    }
    
    /**
     * @param FormeJuridique $formeJuridique
     */
    public function setFormeJuridique ( FormeJuridique $formeJuridique )
    {
        $this -> formeJuridique = $formeJuridique;
    }
    
    /**
     * @return SecteurActivite
     */
    public function getSecteurActivite ()
    {
        return $this -> secteurActivite;
    }
    
    /**
     * @param SecteurActivite $secteurActivite
     */
    public function setSecteurActivite ( SecteurActivite $secteurActivite )
    {
        $this -> secteurActivite = $secteurActivite;
    }
    
    /**
     * @return Monnaie
     */
    public function getMonnaie ()
    {
        return $this -> monnaie;
    }
    
    /**
     * @param Monnaie $monnaie
     */
    public function setMonnaie ( Monnaie $monnaie )
    {
        $this -> monnaie = $monnaie;
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
     * @return Societe
     */
    public function setSystemeComptable ( SystemeComptable $systemeComptable ) : Societe
    {
        $this -> systemeComptable = $systemeComptable;
        
        return $this;
    }
    
    /**
     * @return Pays
     */
    public function getPays () :? Pays
    {
        return $this -> pays;
    }
    
    /**
     * @param Pays $pays
     *
     * @return Societe
     */
    public function setPays ( Pays $pays ) : Societe
    {
        $this -> pays = $pays;
        
        return $this;
    }
    
    /**
     * @return AdresseSociete[]
     */
    public function getAdresseSocietes ()
    {
        return $this -> adresseSocietes;
    }
    
    public function addAdresseSociete(AdresseSociete $adresseSociete) : Societe
    {
        if(false === $this->adresseSocietes->contains( $adresseSociete)){
            $this->adresseSocietes[] = $adresseSociete;
            $adresseSociete->getSociete($this);
        }
        
        return $this;
        
    }
    
    public function removeAdresseSociete(AdresseSociete $adresseSociete) : Societe
    {
        if($this->adresseSocietes->contains( $adresseSociete)){
            $this->adresseSocietes->removeElement( $adresseSociete);
        }
        
        return $this;
    }
    
    
    
}

