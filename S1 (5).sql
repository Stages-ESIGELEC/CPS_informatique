-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 19 juil. 2023 à 01:18
-- Version du serveur : 8.0.33-0ubuntu0.22.04.2
-- Version de PHP : 8.1.2-1ubuntu2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `S1`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id_article` int NOT NULL,
  `boutique_id` int NOT NULL,
  `article_nom` varchar(50) NOT NULL,
  `article_categorie` int NOT NULL,
  `artcle_sous_categorie` int NOT NULL,
  `article_prix` int NOT NULL,
  `article_date_dépôt` datetime NOT NULL,
  `article_quantité` int NOT NULL,
  `photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id_article`, `boutique_id`, `article_nom`, `article_categorie`, `artcle_sous_categorie`, `article_prix`, `article_date_dépôt`, `article_quantité`, `photo`) VALUES
(3, 1, 'chemise-longue', 1, 2, 5000, '2023-07-18 10:31:18', 4, '/home/sanoussi/Téléchargements/chemise-longue.jpeg'),
(4, 2, 'boots', 1, 1, 3500, '2023-07-18 10:31:18', 3, '/home/sanoussi/Téléchargements/b.jpeg'),
(5, 2, 'alls', 2, 2, 6000, '2023-07-18 10:31:18', 7, '/home/sanoussi/Téléchargements/chemise-longue.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `boutiques`
--

CREATE TABLE `boutiques` (
  `id_boutique` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  `boutique_nom` varchar(20) NOT NULL,
  `boutique_domaine` varchar(50) NOT NULL,
  `boutique_adresse` float NOT NULL,
  `boutique_description` varchar(400) NOT NULL,
  `boutique_photo` varchar(200) NOT NULL,
  `boutique_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `boutiques`
--

INSERT INTO `boutiques` (`id_boutique`, `utilisateur_id`, `boutique_nom`, `boutique_domaine`, `boutique_adresse`, `boutique_description`, `boutique_photo`, `boutique_type`) VALUES
(1, 2, 'sun-shop', 'vetement', 1.6, 'une belle aventure vous attend', '/home/sanoussi/Images/764967.png', 1),
(2, 3, 'ghoul', 'chaussure', 2.4, 'trouver la paire qui vous sied a merveille', '/home/sanoussi/Téléchargements/b.jpeg', 2),
(5, 1, 'sanounou', 'space', 2.4, 'fcyjyf', 'gyulb', 2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_article`
--

CREATE TABLE `categorie_article` (
  `id` int NOT NULL,
  `libelle_categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categorie_article`
--

INSERT INTO `categorie_article` (`id`, `libelle_categorie`) VALUES
(1, 'montantes'),
(2, 'plates');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `commande_id` int NOT NULL,
  `id_article` int NOT NULL,
  `boutique_id` int NOT NULL,
  `quantite` int NOT NULL,
  `prix` int NOT NULL,
  `date_commande` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `commentaire_id` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  `id_boutique` int NOT NULL,
  `id_article` int NOT NULL,
  `commentaire` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `demandes`
--

CREATE TABLE `demandes` (
  `demande_id` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  `type_demande` int NOT NULL,
  `demande_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE `membres` (
  `id_membre` int NOT NULL,
  `boutique_id` int NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id_panier` int NOT NULL,
  `id_article` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  `quantite` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sous_categorie`
--

CREATE TABLE `sous_categorie` (
  `id` int NOT NULL,
  `libelle_sous_categorie` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sous_categorie`
--

INSERT INTO `sous_categorie` (`id`, `libelle_sous_categorie`) VALUES
(1, 'taille\r\n'),
(2, 'couleur\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `utilisateur_id` int NOT NULL,
  `utiilisateur_mail` varchar(30) NOT NULL,
  `utilisateur_pseudo` varchar(30) NOT NULL,
  `utilisateur_naissance` date NOT NULL,
  `utilisateur_type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`utilisateur_id`, `utiilisateur_mail`, `utilisateur_pseudo`, `utilisateur_naissance`, `utilisateur_type`) VALUES
(1, 'sanoumalick24@gmail.com', 'rising-sun', '2012-04-01', 'membre'),
(2, 'gerant@gmail.com', 'sun', '2023-07-02', 'gerant'),
(3, 'kenkaneki@gmail.com', 'ken', '2023-07-17', 'gerant');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `boutique_id` (`boutique_id`),
  ADD KEY `artcle_specificite` (`artcle_sous_categorie`),
  ADD KEY `article_categorie` (`article_categorie`);

--
-- Index pour la table `boutiques`
--
ALTER TABLE `boutiques`
  ADD PRIMARY KEY (`id_boutique`),
  ADD KEY `boutique_type_id` (`boutique_type`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `categorie_article`
--
ALTER TABLE `categorie_article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`commande_id`),
  ADD KEY `commandes_ibfk_1` (`id_article`),
  ADD KEY `commandes_ibfk_2` (`boutique_id`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`commentaire_id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_boutique` (`id_boutique`);

--
-- Index pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD PRIMARY KEY (`demande_id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `type_demande` (`type_demande`);

--
-- Index pour la table `membres`
--
ALTER TABLE `membres`
  ADD PRIMARY KEY (`id_membre`),
  ADD KEY `boutique_id` (`boutique_id`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id_panier`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`utilisateur_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `boutiques`
--
ALTER TABLE `boutiques`
  MODIFY `id_boutique` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `categorie_article`
--
ALTER TABLE `categorie_article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `commande_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `commentaire_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demandes`
--
ALTER TABLE `demandes`
  MODIFY `demande_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `membres`
--
ALTER TABLE `membres`
  MODIFY `id_membre` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id_panier` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `utilisateur_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`boutique_id`) REFERENCES `boutiques` (`id_boutique`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`artcle_sous_categorie`) REFERENCES `sous_categorie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `articles_ibfk_3` FOREIGN KEY (`article_categorie`) REFERENCES `categorie_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `boutiques`
--
ALTER TABLE `boutiques`
  ADD CONSTRAINT `boutiques_ibfk_2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`utilisateur_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON UPDATE RESTRICT,
  ADD CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`boutique_id`) REFERENCES `boutiques` (`id_boutique`) ON UPDATE RESTRICT;

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `commentaires_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`utilisateur_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `commentaires_ibfk_2` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `commentaires_ibfk_3` FOREIGN KEY (`id_boutique`) REFERENCES `boutiques` (`id_boutique`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD CONSTRAINT `demandes_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`utilisateur_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `membres`
--
ALTER TABLE `membres`
  ADD CONSTRAINT `membres_ibfk_1` FOREIGN KEY (`boutique_id`) REFERENCES `boutiques` (`id_boutique`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `panier_ibfk_2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`utilisateur_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
