<?php

namespace App\Controller\Api;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\DBAL\Connection;

class MoviesController extends AbstractController
{
    #[Route('/api/movies')]
    public function list(Connection $db): Response
    {
        $rows = $db->createQueryBuilder()
            ->select("m.*")
            ->from("movies", "m")
            ->orderBy("m.release_date", "ASC")
            ->setMaxResults(50)
            ->executeQuery()
            ->fetchAllAssociative();

        return $this->json([
            "movies" => $rows
        ]);
    }

    #[Route('/api/genres')]
    public function listGenres(Connection $db): Response
    {
        $rows = $db->createQueryBuilder()
            ->select("g.*")
            ->from("genres", "g")
            ->executeQuery()
            ->fetchAllAssociative();

        return $this->json([
            "genres" => $rows
        ]);
    }

    #[Route('/api/genres/{genreId}')]
    public function filterListByGenre(string $genreId, Connection $db): Response
    {
        $rows = $db->createQueryBuilder()
            ->select("m.*")
            ->from("movies", "m")
            ->innerJoin("m", "movies_genres", "mg", "m.id = mg.movie_id")
            ->where("mg.genre_id LIKE :genreId")
            ->setParameter('genreId', '%' . $genreId . '%')
            ->setMaxResults(50)
            ->executeQuery()
            ->fetchAllAssociative();

        return $this->json([
            "movies" => $rows
        ]);
    }
}