<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Article
 *
 * @ORM\Table(name="article")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ArticleRepository")
 */
class Article
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
     *
     * @ORM\Column(name="reference", type="string", length=255, unique=true)
     */
    private $reference;

    /**
     * @var ClassificationArticle
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ClassificationArticle")
     */
    private $classificationArticle;


    /**
     * @var Fournisseur
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Fournisseur")
     */
    private $fournisseurs;

    /**
     * @var ClassificationVente
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ClassificationVente")
     */
    private $classificationVente;

    /**
     * @var string
     *
     * @ORM\Column(name="designation", type="text", length=255)
     */
    private $designation;

    /**
     * @var Marge
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\Marge")
     */
    private $marge;

    /**
     * @var Tva
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Tva")
     */
    private $tva;

    /**
     * @var Unite
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Unite")
     */
    private $unite;

    /**
     * @return Unite
     */
    public function getUnite()
    {
        return $this->unite;
    }

    /**
     * @param Unite $unite
     * @return Article
     */
    public function setUnite(Unite $unite)
    {
        $this->unite = $unite;
        return $this;
    }

    /**
     * @return NatureArticle
     */
    public function getNatureArticle()
    {
        return $this->natureArticle;
    }

    /**
     * @param NatureArticle $natureArticle
     * @return Article
     */
    public function setNatureArticle(NatureArticle $natureArticle)
    {
        $this->natureArticle = $natureArticle;
        return $this;
    }

    /**
     * @var NatureArticle
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\NatureArticle")
     */
    private $natureArticle;


    /**
     * @var string
     *
     * @ORM\Column(name="quantite", type="string", length=255, unique=true)
     */
    private $quantite;

    /**
     * @var string
     *
     * @ORM\Column(name="prixUnitaire", type="string", length=255, unique=true)
     */
    private $prixUnitaire;


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
     * Set reference
     *
     * @param string $reference
     *
     * @return Article
     */
    public function setReference($reference)
    {
        $this->reference = $reference;

        return $this;
    }

    /**
     * Get reference
     *
     * @return string
     */
    public function getReference()
    {
        return $this->reference;
    }

    /**
     * Set designation
     *
     * @param string $designation
     *
     * @return Article
     */
    public function setDesignation($designation)
    {
        $this->designation = $designation;

        return $this;
    }

    /**
     * Get designation
     *
     * @return string
     */
    public function getDesignation()
    {
        return $this->designation;
    }

    /**
     * Set quantite
     *
     * @param string $quantite
     *
     * @return Article
     */
    public function setQuantite($quantite)
    {
        $this->quantite = $quantite;

        return $this;
    }

    /**
     * Get quantite
     *
     * @return string
     */
    public function getQuantite()
    {
        return $this->quantite;
    }

    /**
     * Set prixUnitaire
     *
     * @param string $prixUnitaire
     *
     * @return Article
     */
    public function setPrixUnitaire($prixUnitaire)
    {
        $this->prixUnitaire = $prixUnitaire;

        return $this;
    }

    /**
     * Get prixUnitaire
     *
     * @return string
     */
    public function getPrixUnitaire()
    {
        return $this->prixUnitaire;
    }


    /**
     * @return Marge
     */
    public function getMarge()
    {
        return $this->marge;
    }

    /**
     * @param Marge $marge
     * @return Article
     */
    public function setMarge(Marge $marge)
    {
        $this->marge = $marge;
        return $this;
    }

    /**
     * @return ClassificationVente
     */
    public function getClassificationVente()
    {
        return $this->classificationVente;
    }

    /**
     * @param ClassificationVente $classificationVente
     * @return Article
     */
    public function setClassificationVente(ClassificationVente $classificationVente)
    {
        $this->classificationVente = $classificationVente;
        return $this;
    }

    /**
     * @return ClassificationArticle
     */
    public function getClassificationArticle()
    {
        return $this->classificationArticle;
    }

    /**
     * @param ClassificationArticle $classificationArticle
     * @return Article
     */
    public function setClassificationArticle(ClassificationArticle $classificationArticle)
    {
        $this->classificationArticle = $classificationArticle;
        return $this;
    }

    /**
     * @return Fournisseur
     */
    public function getFournisseurs()
    {
        return $this->fournisseurs;
    }

    /**
     * @param Fournisseur $fournisseurs
     * @return Article
     */
    public function setFournisseurs(Fournisseur $fournisseurs)
    {
        $this->fournisseurs = $fournisseurs;
        return $this;
    }

    /**
     * @return Tva
     */
    public function getTva()
    {
        return $this->tva;
    }

    /**
     * @param Tva $tva
     * @return Article
     */
    public function setTva(Tva $tva)
    {
        $this->tva = $tva;
        return $this;
    }



}

