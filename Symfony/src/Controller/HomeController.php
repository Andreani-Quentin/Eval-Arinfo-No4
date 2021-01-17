<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use App\Repository\ProductsRepository;
use App\Repository\ImagesRepository;
use App\Repository\AccueilRepository;
use App\Entity\Products;
use App\Entity\Accueil;
use App\Entity\Images;


class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(ProductsRepository $products, ImagesRepository $images, AccueilRepository $accueil): Response
    {
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'products' => $products->findAll(),
            'images' => $images->findAll(),
            'accueil' => $accueil->findAll(),
        ]);
    }
}
