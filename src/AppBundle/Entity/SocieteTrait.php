<?php
/**
 * Created by PhpStorm.
 * User: Stefann
 * Date: 25/10/2018
 * Time: 02:04
 */

namespace AppBundle\Entity;


trait SocieteTrait
{
    
    /**
     * @var Societe
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Societe")
     */
    private $societe;
    
    /**
     * @return Societe
     */
    public function getSociete ():? Societe
    {
        return $this -> societe;
    }
    
    /**
     * @param Societe $societe
     *
     * @return $this
     */
    public function setSociete ( Societe $societe )
    {
        $this -> societe = $societe;
        
        return $this;
    }
}