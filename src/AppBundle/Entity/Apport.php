<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Apport
 *
 * @ORM\Table(name="apport")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ApportRepository")
 */
class Apport
{
    use SocieteTrait;

    const CODE_ACTION_COMPTABLE = "APPORT";

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
     * @var Apporteur
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Apporteur")
     */
    private $apporteur;


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
     * @return Apport
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
     * @return Apport
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
     * @return Apport
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
     * @return Apporteur
     */
    public function getApporteur():? Apporteur
    {
        return $this->apporteur;
    }

    /**
     * @param Apporteur $apporteur
     * @return Apport
     */
    public function setApporteur(Apporteur $apporteur): Apport
    {
        $this->apporteur = $apporteur;
        return $this;
    }




}

