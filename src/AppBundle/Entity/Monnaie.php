<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Monnaie
 *
 * @ORM\Table(name="monnaie")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\MonnaieRepository")
 */
class Monnaie
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
     * @ORM\Column(name="iso", type="string", length=10, unique=true)
     */
    private $iso;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=255, nullable=true)
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=255, unique=true)
     */
    private $libelle;

    /**
     * @var float
     *
     * @ORM\Column(name="tauxAuDollar", type="float", nullable=true)
     */
    private $tauxAuDollar;


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
     * Set iso
     *
     * @param string $iso
     *
     * @return Monnaie
     */
    public function setIso($iso)
    {
        $this->iso = $iso;

        return $this;
    }

    /**
     * Get iso
     *
     * @return string
     */
    public function getIso()
    {
        return $this->iso;
    }

    /**
     * Set nom
     *
     * @param string $nom
     *
     * @return Monnaie
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
     * Set libelle
     *
     * @param string $libelle
     *
     * @return Monnaie
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
     * Set tauxAuDollar
     *
     * @param float $tauxAuDollar
     *
     * @return Monnaie
     */
    public function setTauxAuDollar($tauxAuDollar)
    {
        $this->tauxAuDollar = $tauxAuDollar;

        return $this;
    }

    /**
     * Get tauxAuDollar
     *
     * @return float
     */
    public function getTauxAuDollar()
    {
        return $this->tauxAuDollar;
    }
}

