<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ActionComptable
 *
 * @ORM\Table(name="action_comptable")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ActionComptableRepository")
 */
class ActionComptable
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
     * @ORM\Column(name="libelle", type="string", length=255)
     */
    private $libelle;

    /**
     * @var string
     * @ORM\Column(name="code", type="string", length=255)
     */
    private $code;

    /**
     * @var SystemeComptable
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\SystemeComptable")
     * @ORM\JoinColumn(nullable=false)
     */
    private $systemeComptable;

    /**
     * @var CompteComptable
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\CompteComptable")
     * @ORM\JoinColumn(nullable=false)
     */
    private $compteComptable;


    /**
     * @return SystemeComptable
     */
    public function getSystemeComptable():? SystemeComptable
    {
        return $this->systemeComptable;
    }

    /**
     * @param SystemeComptable $systemeComptable
     * @return ActionComptable
     */
    public function setSystemeComptable(SystemeComptable $systemeComptable): ActionComptable
    {
        $this->systemeComptable = $systemeComptable;
        return $this;
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
     * @return ActionComptable
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
     * @return mixed
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * @param mixed $code
     * @return ActionComptable
     */
    public function setCode($code)
    {
        $this->code = $code;
        return $this;
    }
    public function __toString()
    {
        return $this->code . ' ' . $this->systemeComptable->getLibelle();

    }

    /**
     * @return CompteComptable
     */
    public function getCompteComptable():? CompteComptable
    {
        return $this->compteComptable;
    }

    /**
     * @param CompteComptable $compteComptable
     * @return ActionComptable
     */
    public function setCompteComptable(CompteComptable $compteComptable): ActionComptable
    {
        $this->compteComptable = $compteComptable;
        return $this;
    }


}

