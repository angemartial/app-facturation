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
     * @var string
     *
     * @ORM\Column(name="designation", type="string", length=255, unique=true)
     */
    private $designation;


    /**
     * @var Unite
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Unite")
     */
    private $unite;

    /**
     * @return Unite
     */
    public function getUnite(): Unite
    {
        return $this->unite;
    }

    /**
     * @param Unite $unite
     * @return Article
     */
    public function setUnite(Unite $unite): Article
    {
        $this->unite = $unite;
        return $this;
    }

    /**
     * @return NatureArticle
     */
    public function getNatureArticle(): NatureArticle
    {
        return $this->natureArticle;
    }

    /**
     * @param NatureArticle $natureArticle
     * @return Article
     */
    public function setNatureArticle(NatureArticle $natureArticle): Article
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
     * @var string
     *
     * @ORM\Column(name="referenceFournisseur", type="string", length=255, unique=true)
     */
    private $referenceFournisseur;

    /**
     * @var bool
     *
     * @ORM\Column(name="taxe", type="boolean")
     */
    private $taxe;

    /**
     * @var string
     *
     * @ORM\Column(name="prixAchat", type="string", length=255)
     */
    private $prixAchat;

    /**
     * @var string
     *
     * @ORM\Column(name="coefficientMultiplicateur", type="decimal", precision=5, scale=0)
     */
    private $coefficientMultiplicateur;

    /**
     * @var string
     *
     * @ORM\Column(name="marge", type="decimal", precision=10, scale=0)
     */
    private $marge;

    /**
     * @var string
     *
     * @ORM\Column(name="margeBrute", type="decimal", precision=2, scale=0)
     */
    private $margeBrute;


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
     * Set referenceFournisseur
     *
     * @param string $referenceFournisseur
     *
     * @return Article
     */
    public function setReferenceFournisseur($referenceFournisseur)
    {
        $this->referenceFournisseur = $referenceFournisseur;

        return $this;
    }

    /**
     * Get referenceFournisseur
     *
     * @return string
     */
    public function getReferenceFournisseur()
    {
        return $this->referenceFournisseur;
    }

    /**
     * Set taxe
     *
     * @param boolean $taxe
     *
     * @return Article
     */
    public function setTaxe($taxe)
    {
        $this->taxe = $taxe;

        return $this;
    }

    /**
     * Get taxe
     *
     * @return bool
     */
    public function getTaxe()
    {
        return $this->taxe;
    }

    /**
     * Set prixAchat
     *
     * @param string $prixAchat
     *
     * @return Article
     */
    public function setPrixAchat($prixAchat)
    {
        $this->prixAchat = $prixAchat;

        return $this;
    }

    /**
     * Get prixAchat
     *
     * @return string
     */
    public function getPrixAchat()
    {
        return $this->prixAchat;
    }

    /**
     * Set coefficientMultiplicateur
     *
     * @param string $coefficientMultiplicateur
     *
     * @return Article
     */
    public function setCoefficientMultiplicateur($coefficientMultiplicateur)
    {
        $this->coefficientMultiplicateur = $coefficientMultiplicateur;

        return $this;
    }

    /**
     * Get coefficientMultiplicateur
     *
     * @return string
     */
    public function getCoefficientMultiplicateur()
    {
        return $this->coefficientMultiplicateur;
    }

    /**
     * Set marge
     *
     * @param string $marge
     *
     * @return Article
     */
    public function setMarge($marge)
    {
        $this->marge = $marge;

        return $this;
    }

    /**
     * Get marge
     *
     * @return string
     */
    public function getMarge()
    {
        return $this->marge;
    }

    /**
     * Set margeBrute
     *
     * @param string $margeBrute
     *
     * @return Article
     */
    public function setMargeBrute($margeBrute)
    {
        $this->margeBrute = $margeBrute;

        return $this;
    }

    /**
     * Get margeBrute
     *
     * @return string
     */
    public function getMargeBrute()
    {
        return $this->margeBrute;
    }

    /**
     * @return ClassificationArticle
     */
    public function getClassificationArticle(): ClassificationArticle
    {
        return $this->classificationArticle;
    }

    /**
     * @param ClassificationArticle $classificationArticle
     * @return Article
     */
    public function setClassificationArticle(ClassificationArticle $classificationArticle): Article
    {
        $this->classificationArticle = $classificationArticle;
        return $this;
    }

}

