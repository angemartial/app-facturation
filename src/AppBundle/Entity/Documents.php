<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints\DateTime;

/**
 * Documents
 *
 * @ORM\Table(name="documents")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\DocumentsRepository")
 */
class Documents
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
     * @ORM\Column(name="reference", length=255, nullable=false, unique=true, type="string")
     */
    private $reference;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;

    /**
     * @var float
     *
     * @ORM\Column(name="montant_ht", type="float", nullable=false)
     */
    private $montantHT;

    /**
     * @var float
     *
     * @ORM\Column(name="montant_ttc", type="float", nullable=false)
     */
    private $montantTTC;

    /**
     * @var float
     *
     * @ORM\Column(name="reste", type="float", nullable=false)
     */
    private $reste;

    /**
     * @var float
     *
     * @ORM\Column(name="tva", type="float", nullable=false)
     */
    private $tva;

    /**
     * @var string
     *
     * @ORM\Column(name="objet", type="string", length=255)
     */
    private $objet;

    /**
     * @var TypeDeDocuments
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\TypeDeDocuments")
     */
    private $typeDeDocuments;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateDeLivraison", type="datetime")
     */
    private $dateDeLivraison;

    /**
     * @var int
     *
     * @ORM\Column(name="dureeDeValidite", type="integer")
     */
    private $dureeDeValidite;

    /**
     * @var string
     *
     * @ORM\Column(name="commentaire", type="text")
     */
    private $commentaire;

    /**
     * @var LigneFacture[]|ArrayCollection
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\LigneFacture", mappedBy="document", cascade={"persist", "remove"})
     */
    private $lignes;

    /**
     * @var int
     *
     * @ORM\Column(name="tauxDePenalite", type="integer", nullable=true)
     */
    private $tauxDePenalite;

    /** @var  Entite
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Entite")
     */
    private $entite;

    /**
     * @var ConditionsDeReglements
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ConditionsDeReglements")
     */
    private $conditionsDeReglements;

    /**
     * @return ConditionsDeReglements
     */
    public function getConditionsDeReglements()
    {
        return $this->conditionsDeReglements;
    }

    /**
     * @param ConditionsDeReglements $conditionsDeReglements
     * @return Documents
     */
    public function setConditionsDeReglements(ConditionsDeReglements $conditionsDeReglements)
    {
        $this->conditionsDeReglements = $conditionsDeReglements;
        return $this;
    }

    /**
     * @return Entite
     */
    public function getEntite()
    {
        return $this->entite;
    }

    /**
     * @param Entite $entite
     * @return Documents
     */
    public function setEntite(Entite $entite)
    {
        $this->entite = $entite;
        return $this;
    }



    /**
     * @return ModeDePaiement
     */
    public function getModeDePaiement()
    {
        return $this->modeDePaiement;
    }

    /**
     * @param ModeDePaiement $modeDePaiement
     * @return Documents
     */
    public function setModeDePaiement(ModeDePaiement $modeDePaiement)
    {
        $this->modeDePaiement = $modeDePaiement;
        return $this;
    }

    /**
     * @var ModeDePaiement
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ModeDePaiement")
     */
    private $modeDePaiement;


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
     * Set date
     *
     * @param \DateTime $date
     *
     * @return Documents
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
     * Set objet
     *
     * @param string $objet
     *
     * @return Documents
     */
    public function setObjet($objet)
    {
        $this->objet = $objet;

        return $this;
    }

    /**
     * Get objet
     *
     * @return string
     */
    public function getObjet()
    {
        return $this->objet;
    }

    /**
     * Set dateDeLivraison
     *
     * @param \DateTime $dateDeLivraison
     *
     * @return Documents
     */
    public function setDateDeLivraison($dateDeLivraison)
    {
        $this->dateDeLivraison = $dateDeLivraison;

        return $this;
    }

    /**
     * Get dateDeLivraison
     *
     * @return \DateTime
     */
    public function getDateDeLivraison()
    {
        return $this->dateDeLivraison;
    }

    /**
     * Set dureeDeValidite
     *
     * @param integer $dureeDeValidite
     *
     * @return Documents
     */
    public function setDureeDeValidite($dureeDeValidite)
    {
        $this->dureeDeValidite = $dureeDeValidite;

        return $this;
    }

    /**
     * Get dureeDeValidite
     *
     * @return int
     */
    public function getDureeDeValidite()
    {
        return $this->dureeDeValidite;
    }

    /**
     * Set commentaire
     *
     * @param string $commentaire
     *
     * @return Documents
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
     * Set tauxDePenalite
     *
     * @param integer $tauxDePenalite
     *
     * @return Documents
     */
    public function setTauxDePenalite($tauxDePenalite)
    {
        $this->tauxDePenalite = $tauxDePenalite;

        return $this;
    }

    /**
     * Get tauxDePenalite
     *
     * @return int
     */
    public function getTauxDePenalite()
    {
        return $this->tauxDePenalite;
    }

    /**
     * @return TypeDeDocuments
     */
    public function getTypeDeDocuments()
    {
        return $this->typeDeDocuments;
    }

    /**
     * @param TypeDeDocuments $typeDeDocuments
     * @return Documents
     */
    public function setTypeDeDocuments(TypeDeDocuments $typeDeDocuments)
    {
        $this->typeDeDocuments = $typeDeDocuments;
        return $this;
    }

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->lignes = new ArrayCollection();
    }

    /**
     * @var Paiement
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\Paiement", mappedBy="document")
     */
    private $paiements;

    /**
     * Add ligne
     *
     * @param LigneFacture $ligne
     *
     * @return Documents
     */
    public function addLigne(LigneFacture $ligne)
    {
        $this->lignes->add($ligne);
        $ligne->setDocument($this);

        return $this;
    }

    /**
     * Remove ligne
     *
     * @param LigneFacture $ligne
     */
    public function removeLigne(LigneFacture $ligne)
    {
        $this->lignes->removeElement($ligne);
    }

    /**
     * Get lignes
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getLignes()
    {
        return $this->lignes;
    }

    /**
     * @return float
     */
    public function getMontantHT()
    {
        return $this->montantHT;
    }

    /**
     * @param float $montantHT
     * @return Documents
     */
    public function setMontantHT(float $montantHT)
    {
        $this->montantHT = $montantHT;
        return $this;
    }

    /**
     * @return float
     */
    public function getMontantTTC()
    {
        return $this->montantTTC;
    }

    /**
     * @param float $montantTTC
     * @return Documents
     */
    public function setMontantTTC(float $montantTTC)
    {
        $this->montantTTC = $montantTTC;
        return $this;
    }

    /**
     * @return float
     */
    public function getReste()
    {
        return $this->reste;
    }

    /**
     * @param float $reste
     * @return Documents
     */
    public function setReste(float $reste)
    {
        $this->reste = $reste;
        return $this;
    }

    /**
     * @return float
     */
    public function getTva()
    {
        return $this->tva;
    }

    /**
     * @param float $tva
     * @return Documents
     */
    public function setTva(float $tva)
    {
        $this->tva = $tva;
        return $this;
    }

    /**
     * @return Paiement
     */
    public function getPaiements()
    {
        return $this->paiements;
    }

    /**
     * @param Paiement $paiement
     * @return Documents
     */
    public function addPaiement(Paiement $paiement)
    {
        $this->paiements[] = $paiement;

        $paiement->setDocument($this);
        return $this;
    }

    /**
     * @return string
     */
    public function getReference()
    {
        return $this->reference;
    }

    /**
     * @param string $reference
     * @return Documents
     */
    public function setReference(string $reference)
    {
        $this->reference = $reference;
        return $this;
    }




}
