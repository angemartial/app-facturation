<?php
/**
 * Created by PhpStorm.
 * User: Eliket-Grp
 * Date: 16/07/2018
 * Time: 14:12
 */

namespace AppBundle\Controller;

use AppBundle\Entity\Documents;
use AppBundle\Entity\Entite;
use AppBundle\Entity\TypeDeDocuments;
use AppBundle\Form\DocumentsType;
use AppBundle\Form\EntiteType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Svg\Document;
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

        return $this->render('crm/show-document.html.twig',  ['document' => $document]);

    }

    /**
     * @Route("/document/{code}/{id}", name="document")
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
            $data = $form->getData();
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
     * @Route("/nouvelle-entite/{id}", requirements={"id" = "\d+"}, defaults={"id" = 0})
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|Response
     * @internal param Entite|null $entite
     */
    public function entiteAction(Request $request, $id){

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

            $entite = $form->getData();
            $em->persist($entite);
            $em->flush();
            $this->addFlash('success', 'Données sauvegardées avec succes');
            return $this->redirectToRoute('app_homepage');
        }

        return $this->render('crm/edit-client.html.twig', [
            'form' => $form->createView()
        ]);
    }
}