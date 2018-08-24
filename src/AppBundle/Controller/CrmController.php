<?php
/**
 * Created by PhpStorm.
 * User: Eliket-Grp
 * Date: 16/07/2018
 * Time: 14:12
 */

namespace AppBundle\Controller;

use AppBundle\Entity\Article;
use AppBundle\Entity\Client;
use AppBundle\Entity\Documents;
use AppBundle\Entity\Entite;
use AppBundle\Entity\Fournisseur;
use AppBundle\Entity\LigneFacture;
use AppBundle\Entity\Paiement;
use AppBundle\Entity\TypeDeDocuments;
use AppBundle\Form\ArticleType;
use AppBundle\Form\DocumentsType;
use AppBundle\Form\EntiteType;
use AppBundle\Form\PaiementType;
use Doctrine\ORM\Mapping\Entity;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class CrmController extends Controller
{
    /**
     * @param Request $request
     * @return Response
     * @Route("/", name="index")
     */
    public function indexAction(Request $request)
    {
        return $this->render('crm/index.html.twig');
    }

    /**
     * @param Request $request
     * @param $code
     * @param int $id
     * @Route("voir-document/{code}/{id}", name="show_document")
     * @return Response
     */
    public function showDocument(Request $request, $code, int $id){
        $em = $this->getDoctrine()->getManager();
        $document = $em->find(Documents::class, (int) $id);
        if(null === $document){
            throw $this->createNotFoundException('Document introuvable');
        }

        $payment = new Paiement();
        $payment->setMontant($document->getReste());
        $form = $this->createForm(PaiementType::class, $payment);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            /** @var Paiement $data */
            $data = $form->getData();
            $data->setDate(new \DateTime());
            $document->addPaiement($data);
            $document->setModifiedAt(new \DateTime());
            $em->persist($data);
            $em->persist($document);
            $em->flush();
            return $this->redirectToRoute('show_document', ['code' => $code, 'id' => $id]);
        }

        return $this->render('crm/show-document.html.twig',  ['document' => $document, 'form' => $form->createView()]);

    }

    /**
     * @param Request $request
     * @return Response
     * @Route("/list-produits", name="show-product")
     */
    public function showCatalogue(Request $request){
        $em = $this->getDoctrine()->getManager();
        $catalogue = $em->getRepository(Article::class)->findAll();

        /* cataloguetwig contient les elements de la variable $catalogue , elle servira à appeler les elements de cette variable
        dans les boucles de la vue  */
        return $this->render('crm/catalogue.html.twig', ['cataloguetwig' => $catalogue]);
    }

    /**
     * @param Request $request
     * @return Response
     * @Route("liste/{type}", name="show_Entity")
     */
    public function listEntity(Request $request, $type){
        $type = trim(strip_tags($type));

        if(false === in_array($type, ['client', 'fournisseur'])){
            throw $this->createNotFoundException('Aucun type correspondant');
        }

        $em = $this->getDoctrine()->getManager();

        $client = $em->getRepository($type === 'client' ? Client::class : Fournisseur::class)->findAll();
        return $this->render('crm/list-client.html.twig', ['client' => $client, 'type' => $type]);
   }

    /**
     * @Route("/document/{code}/{id}", name="document")
     * @param Request $request
     * @param $code
     * @param int $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|Response
     */
    public function documentAction(Request $request, $code, int $id = 0){
         $em = $this->getDoctrine()->getManager();

        /* recuperation d'un type de document  via le repository de la classe TypeDeDocuments */
        $type = $em->getRepository(TypeDeDocuments::class)->findOneBy(['code' => $code]);

        if(null === $type){
            throw $this->createNotFoundException('Type de document inexistant');
        }

         if(0 === $id){
             $document = new Documents();
             $document->setDate(new \DateTime());
         }else{
             $document = $em->find(Documents::class, $id);
             if(null === $document){
                 throw $this->createNotFoundException('Ce document n\'existe pas');
             }
         }
        $document->setTypeDeDocuments($type);
         $form = $this->createForm(DocumentsType::class, $document);

         $form->handleRequest($request);

         if($form->isSubmitted() && $form->isValid()){
             /** @var Documents $data */
            $data = $form->getData();
            $lines = $data->getLignes();
            /** @var LigneFacture $line */
             foreach ($lines as $line) {
                 $line->setDocument($data);
                 $em->persist($line);
            }
            $em->persist($data);

            $em->flush();
            return $this->redirectToRoute('documents', ['code' => $type->getCode()]);
         }

        return $this->render('crm/edit-document.html.twig', [
            'form' => $form->createView(),
            'type' => $type,
            'document' => $document
        ]);
    }

    /**
     * @Route("/documents/{code}", name="documents", methods={"GET"})
     */
    public function documentsAction(Request $request, $code){
        /* Appel de l'entity manager. Il sers à gerer les entités de doctrine */
        $em = $this->getDoctrine()->getManager();

        /* recuperation d'un type de document  via le repository de la classe TypeDeDocuments */
        $type = $em->getRepository(TypeDeDocuments::class)->findOneBy(['code' => $code]);

        /*
         * Au ramene une page d'erreur 404 au cas ou le type de document n'existe pas en base de données
         */
        if(null === $type){
            throw $this->createNotFoundException('Page introuvable');
        }

        /* On recupere en base de données tous les document liés au type defini plus haut. limité à 40 documents à la fois */
        $documents = $em->getRepository(Documents::class)->findBy(['typeDeDocuments' => $type], [], 40, 0);

        /* Affichage des document dans la vue */
        return $this->render('crm/documents.html.twig', ['documents' => $documents, 'type' => $type]);
    }

    /**
     * @Route("/nouvelle-entite/{type}/{id}", name="new_entity", requirements={"id" = "\d+"}, defaults={"id" = 0})
     * @param Request $request
     * @param int $id
     * @param $type
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|Response
     * @internal param Entite|null $entite
     */
    public function entiteAction(Request $request, $type, int $id){

        $type = trim(strip_tags($type));
        if(false === in_array($type, ['client', 'fournisseur'])){
            throw $this->createNotFoundException('Aucun type correspondant');
        }


        $em = $this->getDoctrine()->getManager();

        if(0 === $id){
            $entite = new Entite();

        }else{
            $entite = $em->find(Entite::class, $id);
            if(null === $entite){
                throw $this->createNotFoundException('Cet élément n\'existe pas en base de données');
            }
        }

        $form = $this->createForm(EntiteType::class, $entite);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            /** @var Entite $entite */
            $entite = $form->getData();


            if(null === $entite->getId()){
                if('client' === $type ){
                    $object = new Client();
                }else{
                    $object = new Fournisseur();
                }
                $object->setEntite($entite);
                $em->persist($object);
            }

            $em->persist($entite);
            $em->flush();
            $this->addFlash('success', 'Données sauvegardées avec succes');
            return $this->redirectToRoute('app_homepage');
        }

        return $this->render('crm/edit-client.html.twig', [
            'form' => $form->createView(),
            'type' => $type
        ]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|Response
     * @Route("/editer-produit/{id}", name="edit_product")
     */
    public function editCatalogueAction(Request $request, int $id) {
        $em = $this->getDoctrine()->getManager();

        if(0 === $id){
            $catalogue = new Article();
        }else{
            $catalogue = $em->find(Article::class, $id);
            if(null === $catalogue){
                throw $this->createNotFoundException('Cet élément n\'existe pas en base de données');
            }
        }


        $form = $this->createForm(ArticleType::class, $catalogue);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){

            $catalogue = $form->getData();
            $em->persist($catalogue);
            $em->flush();
            $this->addFlash('success', 'Article ajouté ');
            return $this->redirectToRoute('app_homepage');
        }

        return $this->render('crm/create-product.html.twig', [
            'form' => $form->createView()
        ]);

    }
}
