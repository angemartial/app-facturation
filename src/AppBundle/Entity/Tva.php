<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Tva
 *
 * @ORM\Table(name="tva")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\TvaRepository")
 */
class Tva
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
     * @ORM\Column(name="taux", type="float", nullable=false, unique=true)
     */
    private $taux;


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
     * Set taux
     *
     * @param float $taux
     *
     * @return Tva
     */
    public function setTaux($taux)
    {
        $this->taux = $taux;

        return $this;
    }

    /**
     * Get taux
     *
     * @return float
     */
    public function getTaux()
    {
        return $this->taux;
    }

    public function __toString()
    {
        return $this->getTaux() . '%';
    }
}

