<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ActionComptableSociete
 *
 * @ORM\Table(name="action_comptable_societe")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ActionComptableSocieteRepository")
 */
class ActionComptableSociete
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
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getLibelle(): string
    {
        return $this->libelle;
    }

    /**
     * @param string $libelle
     * @return ActionComptableSociete
     */
    public function setLibelle(string $libelle): ActionComptableSociete
    {
        $this->libelle = $libelle;
        return $this;
    }

    /**
     * @return string
     */
    public function getCode(): string
    {
        return $this->code;
    }

    /**
     * @param string $code
     * @return ActionComptableSociete
     */
    public function setCode(string $code): ActionComptableSociete
    {
        $this->code = $code;
        return $this;
    }

    /**
     * @return SystemeComptable
     */
    public function getSystemeComptable():? SystemeComptable
    {
        return $this->systemeComptable;
    }

    /**
     * @param SystemeComptable $systemeComptable
     * @return ActionComptableSociete
     */
    public function setSystemeComptable(SystemeComptable $systemeComptable): ActionComptableSociete
    {
        $this->systemeComptable = $systemeComptable;
        return $this;
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
     * @return ActionComptableSociete
     */
    public function setCompteComptable(CompteComptable $compteComptable): ActionComptableSociete
    {
        $this->compteComptable = $compteComptable;
        return $this;
    }

}

