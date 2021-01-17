<?php

namespace App\Controller;

use App\Entity\Accueil;
use App\Form\AccueilType;
use App\Repository\AccueilRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\String\Slugger\SluggerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @Route("/accueil")
 * @isGranted("ROLE_ADMIN")
 */
class AccueilController extends AbstractController
{
    /**
     * @Route("/", name="accueil_index", methods={"GET"})
     */
    public function index(AccueilRepository $accueilRepository): Response
    {
        return $this->render('accueil/index.html.twig', [
            'accueils' => $accueilRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="accueil_new", methods={"GET","POST"})
     */
    public function new(Request $request, SluggerInterface $slugger): Response
    {
        $accueil = new Accueil();
        $form = $this->createForm(AccueilType::class, $accueil);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

                        
            $image = $form->get('image')->getData();

            if ($image) {

                $originalFilename = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$image->guessExtension();

                try {
                    $image->move(
                    $this->getParameter('images_directory'),
                    $newFilename);
                } catch (FileException $e) {}

                $accueil->setImage($newFilename);
            }

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($accueil);
            $entityManager->flush();

            return $this->redirectToRoute('accueil_index');
        }

        return $this->render('accueil/new.html.twig', [
            'accueil' => $accueil,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="accueil_show", methods={"GET"})
     */
    public function show(Accueil $accueil): Response
    {
        return $this->render('accueil/show.html.twig', [
            'accueil' => $accueil,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="accueil_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Accueil $accueil): Response
    {
        $form = $this->createForm(AccueilType::class, $accueil);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('accueil_index');
        }

        return $this->render('accueil/edit.html.twig', [
            'accueil' => $accueil,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="accueil_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Accueil $accueil): Response
    {
        if ($this->isCsrfTokenValid('delete'.$accueil->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($accueil);
            $entityManager->flush();
        }

        return $this->redirectToRoute('accueil_index');
    }
}
