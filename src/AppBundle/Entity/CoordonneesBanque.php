<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CoordonneesBanque
 *
 * @ORM\Table(name="coordonnees_banque")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CoordonneesBanqueRepository")
 */
class CoordonneesBanque
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
     * @ORM\Column(name="banque", type="string", length=255, nullable=true)
     */
    private $banque;

    /**
     * @var string
     *
     * @ORM\Column(name="rib", type="string", length=255, unique=true, nullable=true)
     */
    private $rib;

    /**
     * @var string
     *
     * @ORM\Column(name="iban", type="string", length=255,  nullable=true)
     */
    private $iban;

    /**
     * @var string
     *
     * @ORM\Column(name="bic", type="string", length=255,  nullable=true)
     */
    private $bic;

    /**
     * @var string
     *
     * @ORM\Column(name="montantDeLencours", type="string", length=255,  nullable=true)
     */
    private $montantDeLencours;


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
     * Set banque
     *
     * @param string $banque
     *
     * @return CoordonneesBanque
     */
    public function setBanque($banque)
    {
        $this->banque = $banque;

        return $this;
    }

    /**
     * Get banque
     *
     * @return string
     */
    public function getBanque()
    {
        return $this->banque;
    }

    /**
     * Set rib
     *
     * @param string $rib
     *
     * @return CoordonneesBanque
     */
    public function setRib($rib)
    {
        $this->rib = $rib;

        return $this;
    }

    /**
     * Get rib
     *
     * @return string
     */
    public function getRib()
    {
        return $this->rib;
    }

    /**
     * Set iban
     *
     * @param string $iban
     *
     * @return CoordonneesBanque
     */
    public function setIban($iban)
    {
        $this->iban = $iban;

        return $this;
    }

    /**
     * Get iban
     *
     * @return string
     */
    public function getIban()
    {
        return $this->iban;
    }

    /**
     * Set bic
     *
     * @param string $bic
     *
     * @return CoordonneesBanque
     */
    public function setBic($bic)
    {
        $this->bic = $bic;

        return $this;
    }

    /**
     * Get bic
     *
     * @return string
     */
    public function getBic()
    {
        return $this->bic;
    }

    /**
     * Set montantDeLencours
     *
     * @param string $montantDeLencours
     *
     * @return CoordonneesBanque
     */
    public function setMontantDeLencours($montantDeLencours)
    {
        $this->montantDeLencours = $montantDeLencours;

        return $this;
    }

    /**
     * Get montantDeLencours
     *
     * @return string
     */
    public function getMontantDeLencours()
    {
        return $this->montantDeLencours;
    }
}

