<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CoordonneeBanqueSociete
 *
 * @ORM\Table(name="coordonnee_banque_societe")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CoordonneeBanqueSocieteRepository")
 */
class CoordonneeBanqueSociete
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
     * @var CoordonneesBanque
     *
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\CoordonneesBanque")
     */
    private $coordonneeBanque;

    /**
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=255, nullable=true)
     */
    private $libelle;



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
     * @return CoordonneeBanqueSociete
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
     * @return CoordonneesBanque
     */
    public function getCoordonneeBanque ()
    {
        return $this -> coordonneeBanque;
    }
    
    /**
     * @param CoordonneesBanque $coordonneeBanque
     *
     * @return CoordonneeBanqueSociete
     */
    public function setCoordonneeBanque ( CoordonneesBanque $coordonneeBanque )
    {
        $this -> coordonneeBanque = $coordonneeBanque;
        
        return $this;
    }
    
    
    
    
}

