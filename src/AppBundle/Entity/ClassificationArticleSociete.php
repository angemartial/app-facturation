<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ClassificationArticleSociete
 *
 * @ORM\Table(name="classification_article_societe")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ClassificationArticleSocieteRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class ClassificationArticleSociete
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
     * @ORM\Column(name="titre", type="string", length=255)
     */
    private $titre;

    /**
     * @var CompteComptable
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\CompteComptable")
     * @ORM\JoinColumn(nullable=false)
     */
    private $compteComptable;

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
     * Set titre
     *
     * @param string $titre
     *
     * @return ClassificationArticleSociete
     */
    public function setTitre($titre)
    {
        $this->titre = $titre;

        return $this;
    }

    /**
     * Get titre
     *
     * @return string
     */
    public function getTitre()
    {
        return $this->titre;
    }

    public function __toString()
    {
        return $this->getTitre();
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
     * @return ClassificationArticleSociete
     */
    public function setCompteComptable(CompteComptable $compteComptable): ClassificationArticleSociete
    {
        $this->compteComptable = $compteComptable;
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
     * @return ClassificationArticleSociete
     */
    public function setSystemeComptable(SystemeComptable $systemeComptable): ClassificationArticleSociete
    {
        $this->systemeComptable = $systemeComptable;
        return $this;
    }

    /**
     * @throws \Exception
     * @ORM\PrePersist()
     */
    public function checkCompteComptable(){
        if($this->compteComptable->getSystemeComptable() !== $this->systemeComptable){
            throw new \Exception('This account does not exist in the given account chart');
        }
    }
}

