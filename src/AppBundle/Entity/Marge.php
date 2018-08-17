<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Marge
 *
 * @ORM\Table(name="marge")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\MargeRepository")
 */
class Marge
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
     * @ORM\Column(name="prixAchatHt", type="string", length=255)
     */
    private $prixAchatHt;

    /**
     * @var float
     *
     * @ORM\Column(name="margeBrute", type="float")
     */
    private $margeBrute;

    /**
     * @var float
     *
     * @ORM\Column(name="coefficientMultiplicateur", type="float")
     */
    private $coefficientMultiplicateur;

    /**
     * @var float
     *
     * @ORM\Column(name="pourcentageMarge", type="float")
     */
    private $pourcentageMarge;


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
     * Set prixAchatHt
     *
     * @param string $prixAchatHt
     *
     * @return Marge
     */
    public function setPrixAchatHt($prixAchatHt)
    {
        $this->prixAchatHt = $prixAchatHt;

        return $this;
    }

    /**
     * Get prixAchatHt
     *
     * @return string
     */
    public function getPrixAchatHt()
    {
        return $this->prixAchatHt;
    }

    /**
     * Set margeBrute
     *
     * @param float $margeBrute
     *
     * @return Marge
     */
    public function setMargeBrute($margeBrute)
    {
        $this->margeBrute = $margeBrute;

        return $this;
    }

    /**
     * Get margeBrute
     *
     * @return float
     */
    public function getMargeBrute()
    {
        return $this->margeBrute;
    }

    /**
     * Set coefficientMultiplicateur
     *
     * @param float $coefficientMultiplicateur
     *
     * @return Marge
     */
    public function setCoefficientMultiplicateur($coefficientMultiplicateur)
    {
        $this->coefficientMultiplicateur = $coefficientMultiplicateur;

        return $this;
    }

    /**
     * Get coefficientMultiplicateur
     *
     * @return float
     */
    public function getCoefficientMultiplicateur()
    {
        return $this->coefficientMultiplicateur;
    }

    /**
     * Set pourcentageMarge
     *
     * @param float $pourcentageMarge
     *
     * @return Marge
     */
    public function setPourcentageMarge($pourcentageMarge)
    {
        $this->pourcentageMarge = $pourcentageMarge;

        return $this;
    }

    /**
     * Get pourcentageMarge
     *
     * @return float
     */
    public function getPourcentageMarge()
    {
        return $this->pourcentageMarge;
    }
}

