<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Depense
 *
 * @ORM\Table(name="depense")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\DepenseRepository")
 */
class Depense
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
     * @ORM\Column(name="libelle", type="string", length=255, nullable=true)
     */
    private $libelle;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;

    /**
     * @var Fournisseur
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Fournisseur")
     */
    private $fournisseur;

    /**
     * @var string
     *
     * @ORM\Column(name="referencePiece", type="string", length=255, nullable=true)
     */
    private $referencePiece;

    /**
     * @var string
     *
     * @ORM\Column(name="commentaire", type="text", nullable=true)
     */
    private $commentaire;

    /**
     * @var array
     *
     * @ORM\Column(name="scanPiece", type="json_array", nullable=true)
     */
    private $scanPiece;

    /**
     * @var LigneDepense[]|ArrayCollection
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\LigneDepense", mappedBy="depense")
     */
    private $lignes;

    public function __construct()
    {
        $this->lignes = new ArrayCollection();
    }


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
     * @return Depense
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
     * Set date
     *
     * @param \DateTime $date
     *
     * @return Depense
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set referencePiece
     *
     * @param string $referencePiece
     *
     * @return Depense
     */
    public function setReferencePiece($referencePiece)
    {
        $this->referencePiece = $referencePiece;

        return $this;
    }

    /**
     * Get referencePiece
     *
     * @return string
     */
    public function getReferencePiece()
    {
        return $this->referencePiece;
    }

    /**
     * Set commentaire
     *
     * @param string $commentaire
     *
     * @return Depense
     */
    public function setCommentaire($commentaire)
    {
        $this->commentaire = $commentaire;

        return $this;
    }

    /**
     * Get commentaire
     *
     * @return string
     */
    public function getCommentaire()
    {
        return $this->commentaire;
    }

    /**
     * Set scanPiece
     *
     * @param array $scanPiece
     *
     * @return Depense
     */
    public function setScanPiece($scanPiece)
    {
        $this->scanPiece = $scanPiece;

        return $this;
    }

    /**
     * Get scanPiece
     *
     * @return array
     */
    public function getScanPiece()
    {
        return $this->scanPiece;
    }

    /**
     * @return LigneDepense[]
     */
    public function getLignes(): array
    {
        return $this->lignes;
    }

    /**
     * @param LigneDepense $ligne
     * @return Depense
     */
    public function addLigne(LigneDepense $ligne): Depense
    {
        if(!$this->lignes->contains($ligne)){
            $this->lignes->add($ligne);
        }

        return $this;
    }

    public function removeLigne(LigneDepense $ligne): Depense
    {
        if($this->lignes->contains($ligne)){
            $this->lignes->removeElement($ligne);
        }

        return $this;
    }

    /**
     * @return Fournisseur
     */
    public function getFournisseur():? Fournisseur
    {
        return $this->fournisseur;
    }

    /**
     * @param Fournisseur $fournisseur
     * @return Depense
     */
    public function setFournisseur(Fournisseur $fournisseur): Depense
    {
        $this->fournisseur = $fournisseur;
        return $this;
    }



}

