-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : Dim 17 jan. 2021 à 16:06
-- Version du serveur :  5.7.30
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `e-tech`
--

-- --------------------------------------------------------

--
-- Structure de la table `accueil`
--

CREATE TABLE `accueil` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `accueil`
--

INSERT INTO `accueil` (`id`, `title`, `content`, `image`) VALUES
(1, 'Bienvenue sur E-Tech', 'Bienvenue à tous sur votre site de produit High-Tech !\r\nVenez découvrir nos produits !', 'background-titre-60005a95c624e.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `message`) VALUES
(3, 1, 'Le chocolat est absolument merveilleux j\'en reprendrais deux !');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210111154707', '2021-01-11 15:47:15', 120),
('DoctrineMigrations\\Version20210111155721', '2021-01-11 15:57:26', 94),
('DoctrineMigrations\\Version20210112091210', '2021-01-12 09:12:16', 268),
('DoctrineMigrations\\Version20210112092547', '2021-01-12 09:25:50', 93),
('DoctrineMigrations\\Version20210112092702', '2021-01-12 09:27:05', 87),
('DoctrineMigrations\\Version20210112133004', '2021-01-12 13:30:08', 164),
('DoctrineMigrations\\Version20210114144003', '2021-01-14 14:40:24', 78);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `product_id`, `name`) VALUES
(5, 2, '5127956b57a8212107b8be9905308a96.jpg'),
(10, 2, 'd114b5a054bbd3063cec1553647bcf36.jpg'),
(11, 3, '8840950f5717be98940d4ae778f5dcc5.jpg'),
(12, 4, '2d6c091f8026d009009bcdf8beec50a8.jpg'),
(13, 5, '9adb1d453caf0434b048302f43df01e9.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `content`, `price`, `stock`) VALUES
(2, 'BRAVIA XR MASTER Series A90J', 'Découvrez notre meilleur téléviseur OLED, basé sur le processeur avec intelligence cognitive Cognitive Processor XR™ de Sony. Profitez d\'un contraste hors pair avec une luminosité extrême et des noirs purs dans un design minimaliste immersif.', 7899, 50),
(3, 'WH-1000XM4', 'Avec le casque WH-1000XM4, il n\'y a que vous et votre musique. Il offre un son plus pur et moins de bruit grâce à sa technologie d\'écoute intelligente qui personnalise automatiquement votre expérience.', 379, 182),
(4, 'SRS-RA3000', 'Que vous soyez pelotonné dans votre canapé avec un bon livre ou en train de cuisiner, le son ambiant immersif sera idéal en toile de fond. Profitez de ce son partout chez vous avec cette enceinte sans fil compacte.', 349, 31),
(5, 'α7C', 'Avec l\'objectif FE 28-60 mm F4-5.6, l\'α7C atteint une qualité d\'image optimale avec le système le plus compact du monde. Capable de satisfaire aux plus hautes exigences en termes de qualité d\'image, de mise au point et de rapidité.', 1999, 16);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'q.andreani@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$w9V5iH+bbg04xkjMx1+WAw$WASoB/BSfQ5AApWROh7Xn/Y/bLkvUPgQEWcddtdPXMI', 'Quentin', 'Andreani'),
(2, 'theturtlefranklin@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$vSso5FOsiSg0lIT5iuhXlw$MVLJU0hO0CWT9Ryqv1k2zImI+UzVjOfZxJynJcg2hpw', 'Franklin', 'The Turtle');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accueil`
--
ALTER TABLE `accueil`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_33401573A76ED395` (`user_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E01FBE6A4584665A` (`product_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accueil`
--
ALTER TABLE `accueil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `FK_33401573A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK_E01FBE6A4584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);