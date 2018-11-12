<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * OperationSurCompte
 *
 * @ORM\Table(name="operation_sur_compte")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\OperationSurCompteRepository")
 */
class OperationSurCompte
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
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;

    /**
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=255)
     */
    private $libelle;

    /**
     * @var Compte
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Compte")
     */
    private $compte;

    /**
     * @var string
     *
     * @ORM\Column(name="debit", type="decimal", precision=2, scale=0)
     */
    private $debit;

    /**
     * @var string
     *
     * @ORM\Column(name="credit", type="decimal", precision=2, scale=0)
     */
    private $credit;
    
    /**
     * @var Documents
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Documents")
     */
    private $document;
    
    /**
     * @var array
     *
     * @ORM\Column(type="json_array", nullable=true)
     */
    private $piecesJointes;


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
     * Set date
     *
     * @param \DateTime $date
     *
     * @return OperationSurCompte
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set libelle
     *
     * @param string $libelle
     *
     * @return OperationSurCompte
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
     * @return Compte
     */
    public function getCompte () : Compte
    {
        return $this -> compte;
    }
    
    /**
     * @param Compte $compte
     *
     * @return OperationSurCompte
     */
    public function setCompte ( Compte $compte ) : OperationSurCompte
    {
        $this -> compte = $compte;
        
        return $this;
    }

    

    /**
     * Set debit
     *
     * @param string $debit
     *
     * @return OperationSurCompte
     */
    public function setDebit($debit)
    {
        $this->debit = $debit;

        return $this;
    }

    /**
     * Get debit
     *
     * @return string
     */
    public function getDebit()
    {
        return $this->debit;
    }

    /**
     * Set credit
     *
     * @param string $credit
     *
     * @return OperationSurCompte
     */
    public function setCredit($credit)
    {
        $this->credit = $credit;

        return $this;
    }
    
    /**
     * @return Documents
     */
    public function getDocument ()
    {
        return $this -> document;
    }
    
    /**
     * @param Documents $document
     *
     * @return OperationSurCompte
     */
    public function setDocument ( Documents $document ) : OperationSurCompte
    {
        $this -> document = $document;
        
        return $this;
    }
    
    /**
     * @return array
     */
    public function getPiecesJointes ()
    {
        return $this -> piecesJointes;
    }
    
    /**
     * @param array $piecesJointes
     *
     * @return OperationSurCompte
     */
    public function setPiecesJointes ( array $piecesJointes ) : OperationSurCompte
    {
        $this -> piecesJointes = $piecesJointes;
        
        return $this;
    }
    
    

    /**
     * Get credit
     *
     * @return string
     */
    public function getCredit()
    {
        return $this->credit;
    }
}

