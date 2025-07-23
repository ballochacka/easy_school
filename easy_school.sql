-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 17 juil. 2025 à 21:11
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `easy_school`
--

-- --------------------------------------------------------

--
-- Structure de la table `achats`
--

DROP TABLE IF EXISTS `achats`;
CREATE TABLE IF NOT EXISTS `achats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `cours_id` int NOT NULL,
  `statut` enum('en_attente','paye') COLLATE utf8mb4_general_ci DEFAULT 'en_attente',
  `date_achat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `cours_id` (`cours_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `achats`
--

INSERT INTO `achats` (`id`, `user_id`, `cours_id`, `statut`, `date_achat`) VALUES
(40, 9, 2, 'paye', '2025-07-17 17:24:49'),
(39, 9, 2, 'paye', '2025-07-17 17:09:09'),
(38, 9, 2, 'paye', '2025-07-17 16:57:10'),
(37, 9, 2, 'paye', '2025-07-17 16:51:20'),
(36, 9, 3, 'paye', '2025-07-17 16:50:37'),
(35, 9, 2, 'paye', '2025-07-17 16:50:24'),
(34, 9, 3, 'paye', '2025-07-17 16:48:10'),
(33, 9, 1, 'paye', '2025-07-17 16:47:46');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `professeur` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prix` int DEFAULT '200',
  `chemin` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `titre`, `professeur`, `prix`, `chemin`) VALUES
(1, 'Mathemetiques: Les fonctions', 'Mr. Diarra', 200, '1_5111985988276585881_5111985988276585889.mp4'),
(2, 'Anglais', 'Mr.Ballo', 200, 'squid.mp4'),
(3, 'Algorithme', 'Mr Boureïma', 200, 'Algorithme (1).mp4'),
(4, 'Physique chimie', 'Mr dupon', 200, NULL),
(5, 'Histoir geo', 'Mr Dubron', 200, NULL),
(6, 'Base de donneé', 'Mr sinanie', 200, NULL),
(7, 'Maintenance', 'Mr massire', 200, NULL),
(8, 'Français', 'Mr samake', 200, NULL),
(9, 'Economie', 'Mr sory', 200, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

DROP TABLE IF EXISTS `eleves`;
CREATE TABLE IF NOT EXISTS `eleves` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `filiere` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `matricule` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `eleves`
--

INSERT INTO `eleves` (`id`, `user_id`, `nom`, `prenom`, `filiere`, `matricule`) VALUES
(6, 9, 'Ballo', 'Moussa', 'TSECO', 'HPD23A0420');

-- --------------------------------------------------------

--
-- Structure de la table `points`
--

DROP TABLE IF EXISTS `points`;
CREATE TABLE IF NOT EXISTS `points` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `points` int DEFAULT '0',
  `date_attribution` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `mot_de_passe`, `date_creation`) VALUES
(9, 'moussachackaballo@gmail.com', '$2y$10$zrp9PTFi.rVGPWnJpw/4DuAiOX2EwuBAx.kEPrjMmBvj5P28//2Mq', '2025-07-17 16:46:29');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
