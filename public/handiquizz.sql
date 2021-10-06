-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 05 oct. 2021 à 15:10
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

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
-- Structure de la table `Theme`
--

DROP TABLE IF EXISTS Theme;
CREATE TABLE IF NOT EXISTS Theme(
    id_theme INT NOT NULL,
    libelle VARCHAR(250)
);

-- --------------------------------------------------------

--
-- Structure de la table `Etablissement`
--

DROP TABLE IF EXISTS Etablissement;
CREATE TABLE IF NOT EXISTS Etablissement(
    id_etablissement INT NOT NULL,
    nom VARCHAR(50) NOT NULL,
    adresse VARCHAR(50) NOT NULL,
    CP VARCHAR(50) NOT NULL
);

-- --------------------------------------------------------

--
-- Structure de la table `Metier`
--

DROP TABLE IF EXISTS Metier;
CREATE TABLE IF NOT EXISTS Metier(
    id_metier INT NOT NULL,
    libelle VARCHAR(50)
);

-- --------------------------------------------------------

--
-- Structure de la table `Abilitation`
--

DROP TABLE IF EXISTS Abilitation;
CREATE TABLE IF NOT EXISTS Abilitation(
    id_abilitation INT NOT NULL,
    libelle VARCHAR(50)
);

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

DROP TABLE IF EXISTS Utilisateur;
CREATE TABLE IF NOT EXISTS Utilisateur(
    id_utilisateur INT NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50),
    mail VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    date_crea DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_edit DATETIME NOT NULL,
    mdp VARCHAR(50) NOT NULL,
    id_abilitation INT NOT NULL,
    id_metier INT NOT NULL,
    id_etablissement INT NOT NULL
);

-- --------------------------------------------------------

--
-- Structure de la table `Question`
--

DROP TABLE IF EXISTS Question;
CREATE TABLE IF NOT EXISTS Question(
    id_question INT NOT NULL,
    libelle VARCHAR(250),
    id_theme INT NOT NULL
);

-- --------------------------------------------------------

--
-- Structure de la table `Reponse`
--

DROP TABLE IF EXISTS Reponse;
CREATE TABLE IF NOT EXISTS Reponse(
    id_reponse INT NOT NULL,
    libelle VARCHAR(250),
    resultat BOOLEAN,
    id_question INT NOT NULL
);

-- --------------------------------------------------------

--
-- Structure de la table `Resultat`
--

DROP TABLE IF EXISTS Resultat;
CREATE TABLE IF NOT EXISTS Resultat(
    id_resultat INT NOT NULL,
    id_utilisateur INT,
    id_question INT,
    id_reponse INT,
    date_resultat DATETIME
);

-- --------------------------------------------------------

--
-- Primary Keys
--

ALTER TABLE Theme
ADD CONSTRAINT PK_Theme PRIMARY KEY (id_theme),
MODIFY id_theme INT NOT NULL AUTO_INCREMENT;

ALTER TABLE Etablissement
ADD CONSTRAINT PK_Etablissement PRIMARY KEY (id_etablissement),
MODIFY id_etablissement INT NOT NULL AUTO_INCREMENT;

ALTER TABLE Metier
ADD CONSTRAINT PK_Metier PRIMARY KEY (id_metier),
MODIFY id_metier INT NOT NULL AUTO_INCREMENT;

ALTER TABLE Abilitation
ADD CONSTRAINT PK_Abilitation PRIMARY KEY (id_abilitation),
MODIFY id_abilitation INT NOT NULL AUTO_INCREMENT;

ALTER TABLE Utilisateur
ADD CONSTRAINT PK_Utilisateur PRIMARY KEY (id_utilisateur),
MODIFY id_utilisateur INT NOT NULL AUTO_INCREMENT;

ALTER TABLE Question
ADD CONSTRAINT PK_Question PRIMARY KEY (id_question),
MODIFY id_question INT NOT NULL AUTO_INCREMENT;

ALTER TABLE Reponse
ADD CONSTRAINT PK_Reponse PRIMARY KEY (id_reponse),
MODIFY id_reponse INT NOT NULL AUTO_INCREMENT;

ALTER TABLE Resultat
ADD CONSTRAINT PK_Resultat PRIMARY KEY (id_resultat,id_utilisateur, id_question, id_reponse),
MODIFY id_resultat INT NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Foreign Keys
--

ALTER TABLE Utilisateur
ADD CONSTRAINT FK_u_role FOREIGN KEY(id_abilitation) REFERENCES Abilitation(id_abilitation),
ADD CONSTRAINT FK_u_metier FOREIGN KEY(id_metier) REFERENCES Metier(id_metier),
ADD CONSTRAINT FK_u_etablissement FOREIGN KEY(id_etablissement) REFERENCES Etablissement(id_etablissement);

ALTER TABLE Question
ADD CONSTRAINT FK_q_theme FOREIGN KEY(id_theme) REFERENCES Theme(id_theme);

ALTER TABLE Reponse
ADD CONSTRAINT FK_rep_question FOREIGN KEY(id_question) REFERENCES question(id_question);

ALTER TABLE Resultat
ADD CONSTRAINT FK_res_utilisateur FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur),
ADD CONSTRAINT FK_res_question FOREIGN KEY(id_question) REFERENCES question(id_question),
ADD CONSTRAINT FK_res_reponse FOREIGN KEY(id_reponse) REFERENCES reponse(id_reponse);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;