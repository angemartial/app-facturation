<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Agrement
 *
 * @ORM\Table(name="agrement")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\AgrementRepository")
 */
class Agrement
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
     * @var string
     *
     * @ORM\Column(name="typeAgrement", type="string", length=255)
     */
    private $typeAgrement;

    /**
     * @var string
     *
     * @ORM\Column(name="numeroAgrement", type="string", length=255)
     */
    private $numeroAgrement;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateAgrement", type="datetime")
     */
    private $dateAgrement;


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
     * Set typeAgrement
     *
     * @param string $typeAgrement
     *
     * @return Agrement
     */
    public function setTypeAgrement($typeAgrement)
    {
        $this->typeAgrement = $typeAgrement;

        return $this;
    }

    /**
     * Get typeAgrement
     *
     * @return string
     */
    public function getTypeAgrement()
    {
        return $this->typeAgrement;
    }

    /**
     * Set numeroAgrement
     *
     * @param string $numeroAgrement
     *
     * @return Agrement
     */
    public function setNumeroAgrement($numeroAgrement)
    {
        $this->numeroAgrement = $numeroAgrement;

        return $this;
    }

    /**
     * Get numeroAgrement
     *
     * @return string
     */
    public function getNumeroAgrement()
    {
        return $this->numeroAgrement;
    }

    /**
     * Set dateAgrement
     *
     * @param \DateTime $dateAgrement
     *
     * @return Agrement
     */
    public function setDateAgrement($dateAgrement)
    {
        $this->dateAgrement = $dateAgrement;

        return $this;
    }

    /**
     * Get dateAgrement
     *
     * @return \DateTime
     */
    public function getDateAgrement()
    {
        return $this->dateAgrement;
    }
    
    
    
}

