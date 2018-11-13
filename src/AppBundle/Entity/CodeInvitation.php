<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Dup\UserBundle\Entity\User;

/**
 * CodeInvitation
 *
 * @ORM\Table(name="code_invitation")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CodeInvitationRepository")
 */
class CodeInvitation
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
     * @ORM\Column(name="recipient_email", type="string", length=255)
     */
    private $recipientEmail;
    
    /**
     * @var User
     * @ORM\ManyToOne(targetEntity="Dup\UserBundle\Entity\User")
     */
    private $generatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="code", type="string", length=100, unique=true)
     */
    private $code;


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
     * Set code
     *
     * @param string $code
     *
     * @return CodeInvitation
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }
    
    /**
     * @return User
     */
    public function getGeneratedBy () :? User
    {
        return $this -> generatedBy;
    }
    
    /**
     * @param User $generatedBy
     *
     * @return CodeInvitation
     */
    public function setGeneratedBy ( User $generatedBy ) : CodeInvitation
    {
        $this -> generatedBy = $generatedBy;
        
        return $this;
    }
    
    /**
     * @return string
     */
    public function getRecipientEmail () : string
    {
        return $this -> recipientEmail;
    }
    
    /**
     * @param string $recipientEmail
     *
     * @return CodeInvitation
     */
    public function setRecipientEmail ( string $recipientEmail ) : CodeInvitation
    {
        $this -> recipientEmail = $recipientEmail;
        
        return $this;
    }
    
    
}

