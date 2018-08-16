<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TypeDeDocuments
 *
 * @ORM\Table(name="type_de_documents")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\TypeDeDocumentsRepository")
 */
class TypeDeDocuments
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
     * @ORM\Column(name="titre", type="string", length=255, unique=true)
     */
    private $titre;

    /**
     * @var string
     * @ORM\Column(name="code", type="string", length=10, unique=true, nullable=false)
     */
    private $code;

    /**
     * @var string
     * @ORM\Column(name="prefix", type="string", length=10, unique=true, nullable=false)
     */
    private $prefix;


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
     * @return TypeDeDocuments
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

    /**
     * @return string
     */
    public function getCode(): string
    {
        return $this->code;
    }

    /**
     * @param string $code
     * @return TypeDeDocuments
     */
    public function setCode(string $code): TypeDeDocuments
    {
        $this->code = $code;
        return $this;
    }

    /**
     * @return string
     */
    public function getPrefix(): string
    {
        return $this->prefix;
    }

    /**
     * @param string $prefix
     * @return TypeDeDocuments
     */
    public function setPrefix(string $prefix): TypeDeDocuments
    {
        $this->prefix = $prefix;
        return $this;
    }

    public function __toString()
    {
        return (string) $this->titre;
    }


}

