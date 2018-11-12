<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Entite
 *
 * @ORM\Table(name="entite")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\EntiteRepository")
 */
class Entite
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
     * @var Civilite
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Civilite", cascade={"persist"})
     */
    private $civilite;

    /**
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * @param string $code
     * @return Entite
     */
    public function setCode(string $code)
    {
        $this->code = $code;
        return $this;
    }

    /**
     * @var string
     * @ORM\column(name="code", type="string", nullable=false)
     */
    private $code;

    /**
     * @var FormeJuridique
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\FormeJuridique", cascade={"persist"})
     */
    private $formeJuridique;

    /**
     * @var ClassificationArticle[]|ArrayCollection
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\ClassificationArticle")
     */
    private $classificationArticles;

    /**
     * @var CoordonneesBanque
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\CoordonneesBanque", cascade={"persist", "remove"})
     *
     */
    private $coordonneesBanque;



    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=255, nullable=true)
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="prenoms", type="string", length=255, nullable=true)
     */
    private $prenoms;

    /**
     * @var string
     *
     * @ORM\Column(name="raisonSociale", type="string", length=255, nullable=true)
     */
    private $raisonSociale;



    /**
     * @var string
     *
     * @ORM\Column(name="siteWeb", type="string", length=255, nullable=true)
     */
    private $siteWeb;

    /**
     * @var string
     *
     * @ORM\Column(name="fonction", type="string", length=255, nullable=true)
     */
    private $fonction;

    /**
     * @var Adresse
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\Adresse", cascade={"persist", "persist"})
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
     * Set nom
     *
     * @param string $nom
     *
     * @return Entite
     */
    public function setNom($nom)
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set prenoms
     *
     * @param string $prenoms
     *
     * @return Entite
     */
    public function setPrenoms($prenoms)
    {
        $this->prenoms = $prenoms;

        return $this;
    }

    /**
     * Get prenoms
     *
     * @return string
     */
    public function getPrenoms()
    {
        return $this->prenoms;
    }

    /**
     * Set raisonSociale
     *
     * @param string $raisonSociale
     *
     * @return Entite
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
     * Set siteWeb
     *
     * @param string $siteWeb
     *
     * @return Entite
     */
    public function setSiteWeb($siteWeb)
    {
        $this->siteWeb = $siteWeb;

        return $this;
    }

    /**
     * Get siteWeb
     *
     * @return string
     */
    public function getSiteWeb()
    {
        return $this->siteWeb;
    }

    /**
     * Set fax
     *
     * @param string $fax
     *
     * @return Entite
     */
    public function setFax($fax)
    {
        $this->fax = $fax;

        return $this;
    }

    /**
     * Get fax
     *
     * @return string
     */
    public function getFax()
    {
        return $this->fax;
    }

    /**
     * Set portable
     *
     * @param string $portable
     *
     * @return Entite
     */
    public function setPortable($portable)
    {
        $this->portable = $portable;

        return $this;
    }

    /**
     * Get portable
     *
     * @return string
     */
    public function getPortable()
    {
        return $this->portable;
    }

    /**
     * Set fonction
     *
     * @param string $fonction
     *
     * @return Entite
     */
    public function setFonction($fonction)
    {
        $this->fonction = $fonction;

        return $this;
    }

    /**
     * Get fonction
     *
     * @return string
     */
    public function getFonction()
    {
        return $this->fonction;
    }

    /**
     * @return Civilite
     */
    public function getCivilite()
    {
        return $this->civilite;
    }

    /**
     * @param Civilite $civilite
     * @return Entite
     */
    public function setCivilite(Civilite $civilite)
    {
        $this->civilite = $civilite;
        return $this;
    }

    /**
     * @return FormeJuridique
     */
    public function getFormeJuridique()
    {
        return $this->formeJuridique;
    }

    /**
     * @param FormeJuridique $formeJuridique
     * @return Entite
     */
    public function setFormeJuridique(FormeJuridique $formeJuridique)
    {
        $this->formeJuridique = $formeJuridique;
        return $this;
    }

    /**
     * @return CoordonneesBanque
     */
    public function getCoordonneesBanque()
    {
        return $this->coordonneesBanque;
    }

    /**
     * @param CoordonneesBanque $coordonneesBanque
     * @return Entite
     */
    public function setCoordonneesBanque(CoordonneesBanque $coordonneesBanque)
    {
        $this->coordonneesBanque = $coordonneesBanque;
        return $this;
    }

    public function __toString()
    {
        if(empty($this->raisonSociale) === false){
            return $this->raisonSociale;
        }else{
            return $this->civilite->getTitre() . ' ' . $this->getPrenoms() . ' ' . $this->getNom();
        }
    }

    /**
     * @return Adresse
     */
    public function getAdresse()
    {
        return $this->adresse;
    }

    /**
     * @param Adresse $adresse
     * @return Entite
     */
    public function setAdresse(Adresse $adresse)
    {
        $this->adresse = $adresse;
        return $this;
    }


    


    /**
     * Constructor
     */
    public function __construct()
    {
        $this->classificationArticles = new ArrayCollection();
    }

    /**
     * Add classificationArticle
     *
     * @param ClassificationArticle $classificationArticle
     *
     * @return Entite
     */
    public function addClassificationArticle(ClassificationArticle $classificationArticle)
    {
        $this->classificationArticles[] = $classificationArticle;

        return $this;
    }

    /**
     * Remove classificationArticle
     *
     * @param ClassificationArticle $classificationArticle
     */
    public function removeClassificationArticle(ClassificationArticle $classificationArticle)
    {
        $this->classificationArticles->removeElement($classificationArticle);
    }

    /**
     * Get classificationArticles
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getClassificationArticles()
    {
        return $this->classificationArticles;
    }
}
