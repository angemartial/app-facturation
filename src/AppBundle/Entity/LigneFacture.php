<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * LigneFacture
 *
 * @ORM\Table(name="ligne_facture")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\LigneFactureRepository")
 */
class LigneFacture
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
     * @ORM\Column(name="reference", type="string", length=255)
     */
    private $reference;

    /**
     * @var string
     *
     * @ORM\Column(name="designation", type="string", length=255, nullable=false)
     */
    private $designation;

    /**
     * @var string
     *
     * @ORM\Column(name="prixUnitaire", type="string", length=255, nullable=true)
     */
    private $prixUnitaire;

    /**
     * @var float
     * @ORM\Column(name="quantite",type="float", nullable=false)
     */
    private $quantite;

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
     * @var Documents
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Documents", inversedBy="lignes", cascade={"persist"})
     */
    private $document;

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
     * @return LigneFacture
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
     * @return LigneFacture
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
     * Set prixUnitaire
     *
     * @param string $prixUnitaire
     *
     * @return LigneFacture
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
     * Set quantite
     *
     * @param float $quantite
     *
     * @return LigneFacture
     */
    public function setQuantite($quantite)
    {
        $this->quantite = $quantite;

        return $this;
    }

    /**
     * Get quantite
     *
     * @return float
     */
    public function getQuantite()
    {
        return $this->quantite;
    }

    /**
     * Set unite
     *
     * @param \AppBundle\Entity\Unite $unite
     *
     * @return LigneFacture
     */
    public function setUnite(Unite $unite = null)
    {
        $this->unite = $unite;

        return $this;
    }

    /**
     * Get unite
     *
     * @return \AppBundle\Entity\Unite
     */
    public function getUnite()
    {
        return $this->unite;
    }

    /**
     * Set document
     *
     * @param Documents $document
     *
     * @return LigneFacture
     */
    public function setDocument(Documents $document = null)
    {
        $this->document = $document;

        return $this;
    }

    /**
     * Get document
     *
     * @return Documents
     */
    public function getDocument()
    {
        return $this->document;
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
     * @return LigneFacture
     */
    public function setTva(Tva $tva)
    {
        $this->tva = $tva;
        return $this;
    }

    public function getHt(){
        return $this->prixUnitaire * $this->quantite;
    }

}
