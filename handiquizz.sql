-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 07 oct. 2021 à 16:34
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `handiquizz`
--

-- --------------------------------------------------------

--
-- Structure de la table `abilitation`
--

CREATE TABLE `abilitation` (
  `id_abilitation` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `abilitation`
--

INSERT INTO `abilitation` (`id_abilitation`, `libelle`) VALUES
(1, 'utilisateur'),
(2, 'centre de formation'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `id_etablissement` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `CP` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`id_etablissement`, `nom`, `adresse`, `CP`) VALUES
(1, 'EPITECH', 'Bordeaux', '33000'),
(2, 'EPSI', 'Bordeaux', '33000'),
(3, 'WIS', 'Bordeaux', '33000'),
(4, 'EPITECH', 'Paris', '75000'),
(5, 'EPSI', 'Paris', '75000'),
(6, 'WIS', 'Paris', '75000'),
(7, 'EPITECH', 'Toulouse', '31000'),
(8, 'EPSI', 'Toulouse', '31000'),
(9, 'WIS', 'Toulouse', '31000'),
(10, 'EPITECH', 'Lyon', '69000'),
(11, 'EPSI', 'Lyon', '69000'),
(12, 'WIS', 'Lyon', '69000'),
(13, 'EPITECH', 'Renne', '35000'),
(14, 'EPSI', 'Renne', '35000'),
(15, 'WIS', 'Renne', '35000');

-- --------------------------------------------------------

--
-- Structure de la table `etab_met`
--

CREATE TABLE `etab_met` (
  `id_etablissement` int(11) NOT NULL,
  `id_metier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etab_met`
--

INSERT INTO `etab_met` (`id_etablissement`, `id_metier`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(5, 2),
(5, 3),
(6, 1),
(7, 2),
(7, 3),
(8, 2),
(9, 1),
(9, 2),
(10, 2),
(11, 3),
(12, 2),
(13, 2),
(14, 1),
(15, 1),
(15, 2);

-- --------------------------------------------------------

--
-- Structure de la table `metier`
--

CREATE TABLE `metier` (
  `id_metier` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `metier`
--

INSERT INTO `metier` (`id_metier`, `libelle`) VALUES
(1, 'Développeur'),
(2, 'Community manager'),
(3, 'Administrateur réseaux');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id_question` int(11) NOT NULL,
  `libelle` varchar(250) DEFAULT NULL,
  `id_theme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id_question`, `libelle`, `id_theme`) VALUES
(1, 'Quelle est la part de français qui seront atteints par le mal de dos au moins une fois dans leur vie ?', 1),
(2, 'Afin de préserver son dos, il est souhaitable', 3),
(3, 'Le lumbago est une douleur aiguë au niveau', 1),
(4, 'L’arthrose est une pathologie qui touche', 1),
(5, 'La colonne vertébrale est constituée d’environ', 1),
(6, 'Une tendinite est une inflammation :', 1),
(7, 'Lors d’un travail continuel sur ordinateur, il est préférable de :', 3),
(8, 'Lors d’une posture prolongée, les muscles fonctionnent en :', 1),
(9, 'Lorsque l’on est assis, la meilleure position est:', 2),
(10, 'Lors de l’utilisation d’un ordinateur, il faut:', 2),
(11, 'Les lombalgies sont favorisées par :', 1),
(12, 'Lorsque la posture mise en œuvre pour soulever un poids est mauvaise, la pression qui s’exerce sur les disques intervertébraux peut être jusqu’à :', 1),
(13, 'Lorsqu’on soulève un poids, pour préserver sa colonne vertébrale, le dos doit être :', 2),
(14, 'Entre chaque vertèbre se trouvent:', 1),
(15, 'Une lombalgie se manifeste par :', 1),
(16, 'Que signifie l’acronyme TMS ?', 1),
(17, 'Selon vous, quel est l’intérêt de suivre une initiation aux gestes et postures ?', 1),
(18, 'Quels est le facteurs (élément) de risques dus à l’activité physique ?', 1),
(19, 'Après une journée de travail il est conseillé de pratiquer :', 3);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `id_reponse` int(11) NOT NULL,
  `libelle` varchar(250) DEFAULT NULL,
  `resultat` tinyint(1) DEFAULT NULL,
  `id_question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id_reponse`, `libelle`, `resultat`, `id_question`) VALUES
(1, '80', 1, 1),
(2, '85', 0, 1),
(3, '75', 0, 1),
(4, '70', 0, 1),
(5, 'De sauter à la corde', 1, 2),
(6, 'De s’échauffer avant une effort', 1, 2),
(7, 'De faire des pompes', 0, 2),
(8, 'De se mettre à genoux', 0, 2),
(9, 'Du genoux', 0, 3),
(10, 'Du bras', 0, 3),
(11, 'Du dos', 1, 3),
(12, 'Des pieds', 0, 3),
(13, 'Les articulations', 1, 4),
(14, 'Les ligaments', 0, 4),
(15, 'Les mains', 0, 4),
(16, 'Les veines', 0, 4),
(17, '28 à 30 vertèbres', 0, 5),
(18, '32 à 34 vertèbres', 1, 5),
(19, '30 à 32 vertèbres', 0, 5),
(20, '34 à 36 vertèbres', 0, 5),
(21, 'Du tendons', 1, 6),
(22, 'Du muscle', 0, 6),
(23, 'Du ligament', 0, 6),
(24, 'De la main', 0, 6),
(25, 'Faire des petites pauses fréquentes', 1, 7),
(26, 'Faire des pauses plus longues mais moins fréquentes', 0, 7),
(27, 'Ne pas faire de pause et finir plus vite', 0, 7),
(28, 'faire des longues pauses fréquentes', 0, 7),
(29, 'Travail dynamique', 0, 8),
(30, 'Travail statique', 1, 8),
(31, 'Travail rythmique', 0, 8),
(32, 'Ne travail pas', 0, 8),
(33, 'Au fond du siège', 1, 9),
(34, 'Au milieu du siège', 0, 9),
(35, 'Au bord du siège', 0, 9),
(36, 'En tailleur', 0, 9),
(37, 'Faire face à l’écran à plus de 50cm', 1, 10),
(38, 'Etre à gauche de l’écran', 0, 10),
(39, 'Etre à droite de l’écran', 0, 10),
(40, 'Faire face à l’écran à moins de 50cm', 0, 10),
(41, 'Le port des charges lourdes', 1, 11),
(42, 'Une mauvaise posture', 0, 11),
(43, 'Une charge de travail trop importante', 0, 11),
(44, 'Rester assis plus de 4h', 0, 11),
(45, 'Quatre fois plus importante', 1, 12),
(46, 'Trois fois plus importante', 0, 12),
(47, 'Deux fois plus importante', 0, 12),
(48, 'Dix fois plus importante', 0, 12),
(49, 'Droit', 1, 13),
(50, 'Arrondi', 0, 13),
(51, 'Carré', 0, 13),
(52, 'En pls', 0, 13),
(53, 'Les disques intervertébraux', 1, 14),
(54, 'Les disques vertébraux', 0, 14),
(55, 'Le liquide séminaire', 0, 14),
(56, 'Du sang', 0, 14),
(57, 'Une douleur en bas du dos', 1, 15),
(58, 'Une douleur en haut du dos', 0, 15),
(59, 'Une douleur en haut du bras', 0, 15),
(60, 'Une douleur en bas du bras', 0, 15),
(61, 'Trouble Musculo-Squelettique', 1, 16),
(62, 'Trouble Muqueuse-Sexuel', 0, 16),
(63, 'Transmission Musculo-Squelettique', 0, 16),
(64, 'Transmission Muqueuse-Sexuel', 0, 16),
(65, 'Réduire le risque de TMS', 1, 17),
(66, 'Augmenter son taux de TMS', 0, 17),
(67, 'Aucun', 0, 17),
(68, 'Pour réduire les impôts', 0, 17),
(69, 'gestes répétitifs', 1, 18),
(70, 'Augmenter sa libido', 0, 18),
(71, 'Aucun', 0, 18),
(72, 'S’entretenir', 0, 18),
(73, 'Des assouplissements', 1, 19),
(74, 'La sieste', 0, 19),
(75, 'Une activité de gaming intense', 0, 19),
(76, 'Du yoga', 0, 19);

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

CREATE TABLE `resultat` (
  `id_resultat` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `id_reponse` int(11) NOT NULL,
  `date_resultat` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `id_theme` int(11) NOT NULL,
  `libelle` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `theme`
--

INSERT INTO `theme` (`id_theme`, `libelle`) VALUES
(1, 'connaissances'),
(2, 'postures'),
(3, 'conseils');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `mail` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `date_crea` datetime NOT NULL DEFAULT current_timestamp(),
  `date_edit` datetime NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `id_abilitation` int(11) NOT NULL DEFAULT 1,
  `id_metier` int(11) NOT NULL,
  `id_etablissement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abilitation`
--
ALTER TABLE `abilitation`
  ADD PRIMARY KEY (`id_abilitation`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id_etablissement`);

--
-- Index pour la table `etab_met`
--
ALTER TABLE `etab_met`
  ADD PRIMARY KEY (`id_etablissement`,`id_metier`),
  ADD KEY `FK_EM_metier` (`id_metier`);

--
-- Index pour la table `metier`
--
ALTER TABLE `metier`
  ADD PRIMARY KEY (`id_metier`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `FK_q_theme` (`id_theme`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id_reponse`),
  ADD KEY `FK_rep_question` (`id_question`);

--
-- Index pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD PRIMARY KEY (`id_resultat`,`id_utilisateur`,`id_question`,`id_reponse`),
  ADD KEY `FK_res_utilisateur` (`id_utilisateur`),
  ADD KEY `FK_res_question` (`id_question`),
  ADD KEY `FK_res_reponse` (`id_reponse`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id_theme`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `FK_u_role` (`id_abilitation`),
  ADD KEY `FK_u_metier` (`id_metier`),
  ADD KEY `FK_u_etablissement` (`id_etablissement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abilitation`
--
ALTER TABLE `abilitation`
  MODIFY `id_abilitation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id_etablissement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `metier`
--
ALTER TABLE `metier`
  MODIFY `id_metier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `id_reponse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pour la table `resultat`
--
ALTER TABLE `resultat`
  MODIFY `id_resultat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `theme`
--
ALTER TABLE `theme`
  MODIFY `id_theme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etab_met`
--
ALTER TABLE `etab_met`
  ADD CONSTRAINT `FK_EM_etablissement` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`),
  ADD CONSTRAINT `FK_EM_metier` FOREIGN KEY (`id_metier`) REFERENCES `metier` (`id_metier`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_q_theme` FOREIGN KEY (`id_theme`) REFERENCES `theme` (`id_theme`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `FK_rep_question` FOREIGN KEY (`id_question`) REFERENCES `question` (`id_question`);

--
-- Contraintes pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `FK_res_question` FOREIGN KEY (`id_question`) REFERENCES `question` (`id_question`),
  ADD CONSTRAINT `FK_res_reponse` FOREIGN KEY (`id_reponse`) REFERENCES `reponse` (`id_reponse`),
  ADD CONSTRAINT `FK_res_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_u_etablissement` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`),
  ADD CONSTRAINT `FK_u_metier` FOREIGN KEY (`id_metier`) REFERENCES `metier` (`id_metier`),
  ADD CONSTRAINT `FK_u_role` FOREIGN KEY (`id_abilitation`) REFERENCES `abilitation` (`id_abilitation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
