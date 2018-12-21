<?php
/**
 * Created by PhpStorm.
 * User: Eliket-Grp
 * Date: 16/07/2018
 * Time: 14:12
 */

namespace AppBundle\Controller;

use AppBundle\Entity\Apport;
use AppBundle\Entity\Article;
use AppBundle\Entity\Client;
use AppBundle\Entity\CompteComptable;
use AppBundle\Entity\Depense;
use AppBundle\Entity\Documents;
use AppBundle\Entity\Entite;
use AppBundle\Entity\Fournisseur;
use AppBundle\Entity\LigneFacture;
use AppBundle\Entity\Paiement;
use AppBundle\Entity\Societe;
use AppBundle\Entity\SystemeComptable;
use AppBundle\Entity\TypeDeDocuments;
use AppBundle\Form\ArticleType;
use AppBundle\Form\CompteComptableType;
use AppBundle\Form\DepenseType;
use AppBundle\Form\DocumentsType;
use AppBundle\Form\EntiteType;
use AppBundle\Form\PaiementType;
use AppBundle\Form\SocieteSettingsType;
use Doctrine\ORM\Mapping\Entity;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Validator\Constraints\DateTime;


class CrmController extends Controller
{

    /**
     * @var Societe
     */
    public $company;

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
     * @param int $page
     * @param string $q
     * @return Response
     * @Route("/catalogue-modal/{page}/{q}", name="catalogue_modal")
     */
    public function catalogueModalAction(int $page = 1, string $q = ''){
        $q = trim(strip_tags($q));
        $em = $this->getDoctrine()->getManager();
        $repository = $em->getRepository(Article::class);
        $result = $repository->cataloguePaginatedAndFiltered($page, $q);

        return $this->render('crm/catalogue-modal.html.twig', ['articles' => $result]);
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
     * @Route("/depense-liste", name="depense_liste")
     */
    public function showDepenseAction(Request $request){
        $em = $this->getDoctrine()->getManager();
        $depense = $em->getRepository(Depense::class)->findAll();
        return $this->render('crm/depense.html.twig',[
            'depense' => $depense
        ]);
    }

    /**
     * @param Request $request
     * @return Response
     * @Route("/apport-liste", name="apport_liste")
     */
    public function showApportAction(Request $request){
        $em = $this->getDoctrine()->getManager();
        $apport = $em->getRepository(Apport::class)->findAll();
        return $this->render('crm/apport.html.twig',[
            'apport'=> $apport
        ]);
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
             $document->setSociete( $this->company);
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
            return $this->redirectToRoute('documents', ['code' => $type->getCode(), 'permalink' => $this->company->getPermalien()]);
         }

        return $this->render('crm/edit-document.html.twig', [
            'form' => $form->createView(),
            'type' => $type,
            'document' => $document
        ]);
    }


    /**
     * @param Request $request
     * @param $id
     * @Route("/creation-compte-comptable/{id}", name="create_compte_comptable")
     */
    public function createCompteComptable(Request $request, $id){
        $em = $this->getDoctrine()->getManager();

            $compte = new CompteComptable();

        $form = $this->createForm(CompteComptableType::class, $compte);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){

            $compte = $form->getData();
            $em->persist($compte);
            $em->flush();
            $this->addFlash('success', 'compte comptable ajouté ');
//            return $this->redirectToRoute('app_homepage');
        }

        return $this->render("crm/edit-compte-comptable.html.twig", [
            'formCompteComptable' => $form->createView()
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
            $entite->setSociete( $this->company);
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


    /**
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|Response
     * @Route("/creation-depense/{id}", name="create_depense")
     */
    public function createDepenseAction(Request $request, int $id){

        $em =$this->getDoctrine()->getManager();

        if( 0 === $id){
            $depense = new Depense();
            $depense->setDate( new \Datetime());
        }
        else{
            $depense = $em->find(Depense::class, $id);
            if(null === $depense){
            throw $this->createNotFoundException('Cet élément n\'existe pas en base de données');
            }
        }

        $form = $this->createForm(DepenseType::class, $depense);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){

        $depense = $form->getData();
        $em->persist($depense);
        $em->flush();
        }

        return $this->render('crm/create-depense.html.twig', [
            'formdepense' => $form->createView()
        ]);


    }

    /**
     * @param Request $request
     * @return Response
     * @Route("/parameter/", name="parameter_page")
     */
    public function parameterAction(Request $request){

        return $this->render('crm/parameter.html.twig');
    }

    /**
     * @param Request $request
     * @return Response
     * @Route("/layout-one/", name="layout_one")
     */
    public function layoutOneAction(Request $request){

        return $this->render('default/layout_one.html.twig');
    }
    
    /**
     * @param Request $request
     * @Route("/parameter/company", name="company_parameter_page")
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|Response
     */
    public function companySettingsAction(Request $request){
        $em = $this->getDoctrine()->getManager();
        $company = $this->company;
        $form = $this->createForm( SocieteSettingsType::class, $company);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            /** @var Societe $company */
            $company = $form->getData();
            $em->persist( $company);
            
            $em->flush();
            $this->addFlash( 'success', 'Vos parametres ont été enregitrés avec succes');
            return $this->redirectToRoute( 'company_parameter_page', ['permalink' => $company->getPermalien()]);
        }
        
        return $this->render( 'crm/parameters/parameter.html.twig', ['company' => $company, 'form' => $form->createView()]);
    }
    
    
    /**
     * @Route("/upload-from-dropzone", name="upload_from_dropzone")
     */
    public function uploadFromDropzoneAction(Request $request){
        $file = $request->files->get('file');
        return new JsonResponse($this->upload($file));
    }
    
    /**
     * @Route("/remove-upload", name="remove_upload")
     * @param Request $request
     * @return JsonResponse
     */
    public function removeUploadAction(Request $request){
        $file = $request->request->get('url');
        $filename = basename($file);
        $uploadDirectory = $this->getParameter('kernel.project_dir').'/web/uploads';
        try{
            unlink($uploadDirectory.'/'.$filename);
            $result = 'ok';
        }catch (\Exception $e){
            $result = $e->getMessage();
        }
        return new JsonResponse([$result]);
    }
    
    private function upload($file){
        if(null !== $file && $file instanceof UploadedFile){
            $extension = $file->guessClientExtension();
            $extension = trim(strip_tags($extension));
            $uniqid = uniqid('', true);
            $uploadDirectory = $this->getParameter('kernel.project_dir').'/web/uploads';
            $filename = $uniqid.'.'.$extension;
            $file->move($uploadDirectory, $filename);
            return [
                'success' => true,
                'file' => $filename
            ];
        }
        
        return [
            'success' => false
        ];
    }
}
