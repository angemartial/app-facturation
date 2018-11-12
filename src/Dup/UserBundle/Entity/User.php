<?php

namespace Dup\UserBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use FOS\UserBundle\Model\User as BaseUser;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * Dup\UserBundle\Entity\User
 *
 * @ORM\Table(name="user")
 * @ORM\Entity(repositoryClass="Dup\UserBundle\Entity\UserRepository")
 * @UniqueEntity(fields="email", message="Cette email existe déjà, choisissez une autre et rééssayez.")
 * @UniqueEntity(fields="username", message="Ce pseudo existe déjà, choisissez un autre et rééssayez.")
 * @ORM\EntityListeners({"Dup\UserBundle\Service\UserParamSetterListener"})
 */
class User extends BaseUser
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;
    
    /**
     * @var string $nom
     *
     * @ORM\Column(name="nom", type="string", length=255, nullable=true)
     */
    private $nom;
    
    /**
     * @var boolean $complete
     *
     * @ORM\Column(name="complete", type="boolean", nullable=false)
     */
    private $complete = true;
    
    /**
     * @var string
     *
     * @ORM\Column(name="facebook_authorisation", type="string", length=255, nullable=true)
     */
    private $facebookAuthorisation;
    
    /**
     * @var string
     *
     * @ORM\Column(name="google_authorisation", type="string", length=255, nullable=true)
     */
    private $googleAuthorisation;
    
    /**
     * @return bool
     */
    public function isComplete ()
    {
        return $this -> complete;
    }
    
    /**
     * @param bool $complete
     */
    public function setComplete ( $complete )
    {
        $this -> complete = $complete;
    }
    
    /**
     * @var string $prenoms
     *
     * @ORM\Column(name="prenoms", type="string", length=255, nullable=true)
     */
    private $prenoms;
    
    /**
     * @var string
     *
     * @ORM\Column(name="avatar_host", type="string", length=100)
     */
    private $avatarHost = 'local';
    
    /**
     * @return string
     */
    public function getAvatarHost ()
    {
        return $this -> avatarHost;
    }
    
    /**
     * @param string $avatarHost
     *
     * @return $this
     */
    public function setAvatarHost ( $avatarHost )
    {
        $this -> avatarHost = $avatarHost;
        
        return $this;
    }
    
    
    
    /**
     * @var \DateTime $birthdate
     *
     * @ORM\Column(name="birthdate", type="datetime", nullable=true)
     */
    private $birthdate;
    
    /**
     * @var string $contact
     *
     * @ORM\Column(name="contact", type="string", length=255, nullable=true)
     */
    private $contact;
    
    /**
     * @var boolean $genre
     *
     * @ORM\Column(name="genre", type="boolean", nullable=true)
     */
    private $genre;
    
    
    /**
     * @var string $adresse
     *
     * @ORM\Column(name="adresse", type="string", length=255, nullable=true)
     */
    private $adresse;
    
    /**
     * @var \DateTime $lastActionDate
     *
     * @ORM\Column(name="lastactiondate", type="datetime", nullable=true)
     */
    protected $lastActionDate;
    
    /**
     * @var string $userType
     *
     * @ORM\Column(name="usertype", type="string", length=255, nullable=true)
     */
    protected $userType;
    
    /**
     * @var string
     *
     * @ORM\Column(name="avatar", type="string", length=255, nullable=false)
     */
    protected $avatar = 'default.png';
    
    /**
     * @var string
     *
     * @ORM\Column(name="facebook_id", type="string", nullable=true)
     */
    protected $facebookId;
    
    /**
     * @var string
     *
     * @ORM\Column(name="google_id", type="string", nullable=true)
     */
    protected $googleId;
    
    /**
     * @var string
     *
     * @ORM\Column(name="twitter_id", type="string", nullable=true)
     */
    protected $twitterId;
    
    /**
     * @return string
     */
    public function getAvatar ()
    {
        return $this -> avatar;
    }
    
    /**
     * @param string $avatar
     *
     * @return $this
     */
    public function setAvatar ( $avatar )
    {
        $this -> avatar = $avatar;
        
        return $this;
    }
    
    /**
     * @var ArrayCollection
     *
     * @ORM\ManyToMany(targetEntity="Dup\UserBundle\Entity\Role")
     */
    protected $entityRoles;
    
    /**
     * Get id
     *
     * @return integer
     */
    public function getId ()
    {
        return $this -> id;
    }
    
    
    /**
     * Constructor
     */
    public function __construct ()
    {
        $this -> salt           = base_convert ( sha1 ( uniqid ( mt_rand (), true ) ), 16, 36 );
        $this -> enabled        = false;
        $this -> roles          = [];
        $this -> lastActionDate = new \DateTime();
    }
    
    /**
     * Set nom
     *
     * @param string $nom
     *
     * @return User
     */
    public function setNom ( $nom )
    {
        $this -> nom = $nom;
        
        return $this;
    }
    
    /**
     * Get nom
     *
     * @return string
     */
    public function getNom ()
    {
        return $this -> nom;
    }
    
    /**
     * Set prenoms
     *
     * @param string $prenoms
     *
     * @return User
     */
    public function setPrenoms ( $prenoms )
    {
        $this -> prenoms = $prenoms;
        
        return $this;
    }
    
    /**
     * Get prenoms
     *
     * @return string
     */
    public function getPrenoms ()
    {
        return $this -> prenoms;
    }
    
    /**
     * Set birthdate
     *
     * @param \DateTime $birthdate
     *
     * @return User
     */
    public function setBirthdate ( $birthdate )
    {
        $this -> birthdate = $birthdate;
        
        return $this;
    }
    
    /**
     * Get birthdate
     *
     * @return \DateTime
     */
    public function getBirthdate ()
    {
        return $this -> birthdate;
    }
    
    /**
     * Set contact
     *
     * @param string $contact
     *
     * @return User
     */
    public function setContact ( $contact )
    {
        $this -> contact = $contact;
        
        return $this;
    }
    
    /**
     * Get contact
     *
     * @return string
     */
    public function getContact ()
    {
        return $this -> contact;
    }
    
    /**
     * Set genre
     *
     * @param boolean $genre
     *
     * @return User
     */
    public function setGenre ( $genre )
    {
        $this -> genre = $genre;
        
        return $this;
    }
    
    /**
     * Get genre
     *
     * @return boolean
     */
    public function getGenre ()
    {
        return $this -> genre;
    }
    
    /**
     * Set adresse
     *
     * @param string $adresse
     *
     * @return User
     */
    public function setAdresse ( $adresse )
    {
        $this -> adresse = $adresse;
        
        return $this;
    }
    
    /**
     * Get adresse
     *
     * @return string
     */
    public function getAdresse ()
    {
        return $this -> adresse;
    }
    
    /**
     * Set lastActionDate
     *
     * @param \DateTime $lastActionDate
     *
     * @return User
     */
    public function setLastActionDate ( $lastActionDate )
    {
        $this -> lastActionDate = $lastActionDate;
        
        return $this;
    }
    
    /**
     * Get lastActionDate
     *
     * @return \DateTime
     */
    public function getLastActionDate ()
    {
        return $this -> lastActionDate;
    }
    
    /**
     * Set userType
     *
     * @param string $userType
     *
     * @return User
     */
    public function setUserType ( $userType )
    {
        $this -> userType = $userType;
        
        return $this;
    }
    
    /**
     * Get userType
     *
     * @return string
     */
    public function getUserType ()
    {
        return $this -> userType;
    }
    
    public function getDateWitness ()
    {
        $interval = new \DateInterval( 'PT' . UserRepository::MIN_UNACTIVE_PERIOD . 'S' );
        $now      = new \DateTime();
        
        return $now -> sub ( $interval );
    }
    
    public function isOffline ()
    {
        return $this -> getLastActionDate () <= $this -> getDateWitness ();
    }
    
    public function isOnline ()
    {
        return $this -> getLastActionDate () > $this -> getDateWitness ();
    }
    
    /**
     * Add entityRole
     *
     * @param \Dup\UserBundle\Entity\Role $entityRole
     *
     * @return User
     */
    public function addEntityRole ( \Dup\UserBundle\Entity\Role $entityRole )
    {
        $this -> entityRoles[] = $entityRole;
        
        return $this;
    }
    
    /**
     * Remove entityRole
     *
     * @param \Dup\UserBundle\Entity\Role $entityRole
     */
    public function removeEntityRole ( \Dup\UserBundle\Entity\Role $entityRole )
    {
        $this -> entityRoles -> removeElement ( $entityRole );
    }
    
    /**
     * Get entityRoles
     *
     * @return ArrayCollection
     */
    public function getEntityRoles ()
    {
        return $this -> entityRoles;
    }
    
    /**
     * @return string
     */
    public function getFacebookId ()
    {
        return $this -> facebookId;
    }
    
    /**
     * @param string $facebookId
     *
     * @return User
     */
    public function setFacebookId ( $facebookId )
    {
        $this -> facebookId = $facebookId;
        
        return $this;
    }
    
    /**
     * @return string
     */
    public function getGoogleId ()
    {
        return $this -> googleId;
    }
    
    /**
     * @param string $googleId
     *
     * @return User
     */
    public function setGoogleId ( $googleId )
    {
        $this -> googleId = $googleId;
        
        return $this;
    }
    
    /**
     * @return string
     */
    public function getTwitterId ()
    {
        return $this -> twitterId;
    }
    
    /**
     * @param string $twitterId
     *
     * @return User
     */
    public function setTwitterId ( $twitterId )
    {
        $this -> twitterId = $twitterId;
        
        return $this;
    }
    
    public function getAbsoluteAvatar(){
        return ($this->avatarHost === 'local' ? '/uploads/medias/avatars/' : '').$this->avatar;
    }
    
    /**
     * @return string
     */
    public function getFacebookAuthorisation ()
    {
        return $this -> facebookAuthorisation;
    }
    
    /**
     * @param string $facebookAuthorisation
     *
     * @return User
     */
    public function setFacebookAuthorisation ( $facebookAuthorisation )
    {
        $this -> facebookAuthorisation = $facebookAuthorisation;
        
        return $this;
    }
    
    /**
     * @return string
     */
    public function getGoogleAuthorisation ()
    {
        return $this -> googleAuthorisation;
    }
    
    /**
     * @param string $googleAuthorisation
     *
     * @return User
     */
    public function setGoogleAuthorisation ( $googleAuthorisation )
    {
        $this -> googleAuthorisation = $googleAuthorisation;
        
        return $this;
    }
    
    public function hasAuthorisation($owner, $authorisation){
        $getter = 'get'.ucfirst( $owner).'Authorisation';
        if(method_exists( $this, $getter)){
            $authorisationsString = $this->$getter();
            $authorisationsList = explode( ',', $authorisationsString);
            return in_array( $authorisation, $authorisationsList);
        }
        return false;
    }
    
    
}
