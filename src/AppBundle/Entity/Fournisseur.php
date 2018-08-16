<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Fournisseur
 *
 * @ORM\Table(name="fournisseur")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\FournisseurRepository")
 */
class Fournisseur
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
     * @var Entite
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\Entite")
     */
    private $entite;

    /**
     * @var ClassificationArticle
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\ClassificationArticle")
     */
    private $classificationArticle;


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
    public function getEntite(): Entite
    {
        return $this->entite;
    }

    /**
     * @param Entite $entite
     * @return Fournisseur
     */
    public function setEntite(Entite $entite): Fournisseur
    {
        $this->entite = $entite;
        return $this;
    }

    /**
     * @return ClassificationArticle
     */
    public function getClassificationArticle(): ClassificationArticle
    {
        return $this->classificationArticle;
    }

    /**
     * @param ClassificationArticle $classificationArticle
     * @return Fournisseur
     */
    public function setClassificationArticle(ClassificationArticle $classificationArticle): Fournisseur
    {
        $this->classificationArticle = $classificationArticle;
        return $this;
    }



}

