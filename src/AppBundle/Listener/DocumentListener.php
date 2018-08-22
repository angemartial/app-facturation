<?php
/**
 * Created by PhpStorm.
 * User: Eliket-Grp
 * Date: 27/07/2018
 * Time: 15:50
 */

namespace AppBundle\Listener;


use AppBundle\Entity\Documents;
use AppBundle\Entity\LigneFacture;
use AppBundle\Entity\Paiement;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Event\LifecycleEventArgs;
use Dompdf\Dompdf;
use Dompdf\Options;

class DocumentListener
{

    public function prePersist(LifecycleEventArgs $event){
        $entity = $event->getEntity();
        if($entity instanceof Documents){
            $this->calculate($entity);
            $this->generateReference($entity, $event->getEntityManager());
            $this->generatePdf($entity);
        }
    }

    public function preUpdate(LifecycleEventArgs $event){
        $entity = $event->getEntity();
        if($entity instanceof Documents){
            $this->calculate($entity);
            $this->generatePdf($entity);
        }
    }

    public function generatePdf(Documents $document){
        $options = new Options();
        //$options->setDpi(300);
        $options->setIsHtml5ParserEnabled(true);
        $domPdf = new Dompdf($options);
        $domPdf->setPaper('A4', 'portrait');

        global $kernel;
        $container = $kernel->getContainer();
        $twig = $container->get('twig');

        $html = $twig->render('crm/document-pdf-template.html.twig', ['document' => $document]);



        $domPdf->loadHtml($html);
        $domPdf->render();
        $output = $domPdf->output();
        $path = $kernel->getProjectDir().'/web/pdf/'.$document->getReference().'.pdf';
        $domPdf->setBasePath($kernel->getProjectDir()."/css/");
        file_put_contents($path, $output);
    }

    private function calculate(Documents $entity){
        $lines = $entity->getLignes();
        $totalHt = 0;
        $totalTva = 0;
        $totalTtc =0 ;
        /** @var LigneFacture $line */
        foreach ($lines as $line) {
            $ht = $line->getQuantite() * $line->getPrixUnitaire();
            $totalHt += $ht;
            $tvaObject = $line->getTva();
            $tva = null === $tvaObject ? 0 : ($ht * ($tvaObject->getTaux() / 100));

            $totalTva += $tva;

            $totalTtc += ($ht + $tva);
        }
        $entity->setTva($totalTva);
        $entity->setMontantHT($totalHt);
        $entity->setMontantTTC($totalTtc);

        $paiements = $entity->getPaiements();
        $totalPaiements = 0;
        if(empty($paiements) === false){
            /** @var Paiement $paiement */
            foreach ($paiements as $paiement) {
                $totalPaiements += $paiement->getMontant();
            }
        }

        $entity->setReste($totalTtc - $totalPaiements);

    }

    private function generateReference(Documents $entity, EntityManager $em){
        $year = new \DateTime();
        $year = $year->format('Ymd');

        $list = $em
            ->getRepository(Documents::class)
            ->findBy(['typeDeDocuments' => $entity->getTypeDeDocuments()]);

        $count = count($list) + 1;
        $entity->setReference($entity->getTypeDeDocuments()->getPrefix() . '-' . $year . '-' . $count) ;
    }
}