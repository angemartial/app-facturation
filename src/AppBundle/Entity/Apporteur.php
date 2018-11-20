<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Apporteur
 *
 * @ORM\Table(name="apporteur")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ApporteurRepository")
 */
class Apporteur
{
    use SocieteTrait;

    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var Entite
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\Entite")
     */
    private $entite;


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
     * @return Entite
     */
    public function getEntite():? Entite
    {
        return $this->entite;
    }

    /**
     * @param Entite $entite
     * @return Apporteur
     */
    public function setEntite(Entite $entite): Apporteur
    {
        $this->entite = $entite;
        return $this;
    }


}

