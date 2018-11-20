<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CompteComptableParActionComptable
 *
 * @ORM\Table(name="compte_comptable_par_action_comptable")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CompteComptableParActionComptableRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class CompteComptableParActionComptable
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
     * @var CompteComptable
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\CompteComptable")
     */
    private $compteComptable;

    /**
     * @var SystemeComptable
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\SystemeComptable")
     */
    private $systemeComptable;

    /**
     * @var ActionComptable
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ActionComptable")
     */
    private $actionComptable;


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
     * @return CompteComptable
     */
    public function getCompteComptable():? CompteComptable
    {
        return $this->compteComptable;
    }

    /**
     * @param CompteComptable $compteComptable
     * @return CompteComptableParActionComptable
     */
    public function setCompteComptable(CompteComptable $compteComptable): CompteComptableParActionComptable
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
     * @return CompteComptableParActionComptable
     */
    public function setSystemeComptable(SystemeComptable $systemeComptable): CompteComptableParActionComptable
    {
        $this->systemeComptable = $systemeComptable;
        return $this;
    }

    /**
     * @return ActionComptable
     */
    public function getActionComptable():? ActionComptable
    {
        return $this->actionComptable;
    }

    /**
     * @param ActionComptable $actionComptable
     * @return CompteComptableParActionComptable
     */
    public function setActionComptable(ActionComptable $actionComptable): CompteComptableParActionComptable
    {
        $this->actionComptable = $actionComptable;
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

