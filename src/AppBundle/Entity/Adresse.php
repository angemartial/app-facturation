<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Adresse
 *
 * @ORM\Table(name="adresse")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\AdresseRepository")
 */
class Adresse
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
     * @ORM\Column(name="adresse", type="string", length=255)
     */
    private $adresse;

    /**
     * @var string
     *
     * @ORM\Column(name="adresseSuite", type="string", length=255, nullable=true)
     */
    private $adresseSuite;

    /**
     * @var string
     *
     * @ORM\Column(name="ville", type="string", length=255)
     */
    private $ville;

    /**
     * @var string
     *
     * @ORM\Column(name="codePostal", type="string", length=255)
     */
    private $codePostal;

    /**
     * @var Pays
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Pays")
     */
    private $pays;

    /**
     * @var string
     * @ORM\column(name="telBureau", type="string", length=255, nullable=true)
     */
    private $telBureau;

    /**
     * @var string
     * @ORM\column(name="portable", type="string", length=255, nullable=true)
     */
    private $portable;

    /**
     * @var string
     * @ORM\column(name="fax", type="string", length=255, nullable=true)
     */
    private $fax;
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
     * Set adresse
     *
     * @param string $adresse
     *
     * @return Adresse
     */
    public function setAdresse($adresse)
    {
        $this->adresse = $adresse;

        return $this;
    }

    /**
     * Get adresse
     *
     * @return string
     */
    public function getAdresse()
    {
        return $this->adresse;
    }

    /**
     * Set adresseSuite
     *
     * @param string $adresseSuite
     *
     * @return Adresse
     */
    public function setAdresseSuite($adresseSuite)
    {
        $this->adresseSuite = $adresseSuite;

        return $this;
    }

    /**
     * Get adresseSuite
     *
     * @return string
     */
    public function getAdresseSuite()
    {
        return $this->adresseSuite;
    }

    /**
     * Set ville
     *
     * @param string $ville
     *
     * @return Adresse
     */
    public function setVille($ville)
    {
        $this->ville = $ville;

        return $this;
    }

    /**
     * Get ville
     *
     * @return string
     */
    public function getVille()
    {
        return $this->ville;
    }

    /**
     * Set codePostal
     *
     * @param string $codePostal
     *
     * @return Adresse
     */
    public function setCodePostal($codePostal)
    {
        $this->codePostal = $codePostal;

        return $this;
    }

    /**
     * Get codePostal
     *
     * @return string
     */
    public function getCodePostal()
    {
        return $this->codePostal;
    }

    /**
     * @return Pays
     */
    public function getPays()
    {
        return $this->pays;
    }

    /**
     * @param Pays $Pays
     * @return Adresse
     */
    public function setPays(Pays $Pays)
    {
        $this->pays = $Pays;
        return $this;
    }

    /**
     * @return string
     */
    public function getTelBureau()
    {
        return $this->telBureau;
    }

    /**
     * @param string $telBureau
     * @return Adresse
     */
    public function setTelBureau(string $telBureau)
    {
        $this->telBureau = $telBureau;
        return $this;
    }

    /**
     * @return string
     */
    public function getPortable()
    {
        return $this->portable;
    }

    /**
     * @param string $portable
     * @return Adresse
     */
    public function setPortable(string $portable)
    {
        $this->portable = $portable;
        return $this;
    }

    /**
     * @return string
     */
    public function getFax()
    {
        return $this->fax;
    }

    /**
     * @param string $fax
     * @return Adresse
     */
    public function setFax(string $fax)
    {
        $this->fax = $fax;
        return $this;
    }

    public function __toString()
    {
        $string = '<ul>';
        $string.= '<li>'.$this->adresse.'</li>';
        if(!empty($this->adresseSuite)){
            $string.= '<li>'.$this->adresseSuite.'</li>';
        }
        $string.= '<li>'.$this->codePostal.' '.$this->ville.'</li>';
        if(!empty($this->telBureau)){
            $string.= '<li>Tel: '.$this->telBureau.' '.$this->portable.'</li>';
        }
        if(!empty($this->fax)){
            $string.= '<li>Fax: '.$this->adresseSuite.'</li>';
        }
        $string .= '</ul>';
        return $string;
    }

}

