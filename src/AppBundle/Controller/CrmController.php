<?php
/**
 * Created by PhpStorm.
 * User: Eliket-Grp
 * Date: 16/07/2018
 * Time: 14:12
 */

namespace AppBundle\Controller;

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
}