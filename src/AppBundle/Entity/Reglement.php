<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Reglement
 *
 * @ORM\Table(name="reglement")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ReglementRepository")
 */
class Reglement
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
     * @var float
     *
     * @ORM\Column(name="montant", type="float")
     */
    private $montant;

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
     * @var Depense
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Depense")
     * @ORM\JoinColumn(nullable=false)
     */
    private $depense;

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
     * Set montant
     *
     * @param float $montant
     *
     * @return Reglement
     */
    public function setMontant($montant)
    {
        $this->montant = $montant;

        return $this;
    }

    /**
     * Get montant
     *
     * @return float
     */
    public function getMontant()
    {
        return $this->montant;
    }

    /**
     * Set libelle
     *
     * @param string $libelle
     *
     * @return Reglement
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
     * @return Reglement
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
     * @return Depense
     */
    public function getDepense():? Depense
    {
        return $this->depense;
    }

    /**
     * @param Depense $depense
     * @return Reglement
     */
    public function setDepense(Depense $depense): Reglement
    {
        $this->depense = $depense;
        return $this;
    }

    /**
     * @return ModeDePaiement
     */
    public function getModeDePaiement():? ModeDePaiement
    {
        return $this->modeDePaiement;
    }

    /**
     * @param ModeDePaiement $modeDePaiement
     * @return Reglement
     */
    public function setModeDePaiement(ModeDePaiement $modeDePaiement): Reglement
    {
        $this->modeDePaiement = $modeDePaiement;
        return $this;
    }


}

