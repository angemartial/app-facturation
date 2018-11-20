<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * LigneDepense
 *
 * @ORM\Table(name="ligne_depense")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\LigneDepenseRepository")
 */
class LigneDepense
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
     * @ORM\Column(name="montant", type="decimal", precision=10, scale=5)
     */
    private $montant;

    /**
     * @var Depense
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Depense", inversedBy="lignes")
     */
    private $depense;

    /**
     * @var ClassificationArticle
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ClassificationArticle")
     */
    private $classification;

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
     * @param string $montant
     *
     * @return LigneDepense
     */
    public function setMontant($montant)
    {
        $this->montant = $montant;

        return $this;
    }

    /**
     * Get montant
     *
     * @return string
     */
    public function getMontant()
    {
        return $this->montant;
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
     * @return LigneDepense
     */
    public function setDepense(Depense $depense): LigneDepense
    {
        $this->depense = $depense;
        return $this;
    }

    /**
     * @return ClassificationArticle
     */
    public function getClassification():? ClassificationArticle
    {
        return $this->classification;
    }

    /**
     * @param ClassificationArticle $classification
     * @return LigneDepense
     */
    public function setClassification(ClassificationArticle $classification): LigneDepense
    {
        $this->classification = $classification;
        return $this;
    }


}

