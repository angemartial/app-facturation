<?php
/**
 * Created by PhpStorm.
 * User: Eliket-Grp
 * Date: 17/10/2018
 * Time: 18:24
 */

namespace AppBundle\Listener;

use AppBundle\Entity\Article;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Event\LifecycleEventArgs;

class ArticleListener
{
    public function prePersist(LifecycleEventArgs $event){
        $entity = $event->getEntity();
        if($entity instanceof Article){
            $this->generateReference($entity, $event->getEntityManager());
        }
    }

    private function generateReference(Article $entity, EntityManager $em){
        $famille = $entity->getFamille();
        if(null === $famille){
            throw new \Exception('Aucune famille d\'article renseignée pour cet article ');
        }
        $existing = $em->getRepository(Article::class)->findBy(['famille' => $famille]);
        $count = count($existing) + 1;
        $reference = $famille->getReference();
        $entity->setReference($reference.'-'.$count);
    }
}