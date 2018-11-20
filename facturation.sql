-- MySQL dump 10.16  Distrib 10.1.36-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: app_facturation
-- ------------------------------------------------------
-- Server version	10.1.36-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `action_comptable`
--

DROP TABLE IF EXISTS `action_comptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_comptable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FF62507AA4D60759` (`libelle`),
  UNIQUE KEY `UNIQ_FF62507A77153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_comptable`
--

LOCK TABLES `action_comptable` WRITE;
/*!40000 ALTER TABLE `action_comptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_comptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pays_id` int(11) DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresseSuite` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `codePostal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telBureau` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `portable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C35F0816A6E44244` (`pays_id`),
  CONSTRAINT `FK_C35F0816A6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresse_societe`
--

DROP TABLE IF EXISTS `adresse_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societe_id` int(11) DEFAULT NULL,
  `adresse_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B77B82224DE7DC5C` (`adresse_id`),
  KEY `IDX_B77B8222FCF77503` (`societe_id`),
  CONSTRAINT `FK_B77B82224DE7DC5C` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`),
  CONSTRAINT `FK_B77B8222FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse_societe`
--

LOCK TABLES `adresse_societe` WRITE;
/*!40000 ALTER TABLE `adresse_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `adresse_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agrement`
--

DROP TABLE IF EXISTS `agrement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agrement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societe_id` int(11) DEFAULT NULL,
  `typeAgrement` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numeroAgrement` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateAgrement` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B0C8CC9FCF77503` (`societe_id`),
  CONSTRAINT `FK_B0C8CC9FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agrement`
--

LOCK TABLES `agrement` WRITE;
/*!40000 ALTER TABLE `agrement` DISABLE KEYS */;
/*!40000 ALTER TABLE `agrement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apport`
--

DROP TABLE IF EXISTS `apport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apporteur_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `montant` double NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E96D1F4384FC98A0` (`apporteur_id`),
  KEY `IDX_E96D1F43FCF77503` (`societe_id`),
  CONSTRAINT `FK_E96D1F4384FC98A0` FOREIGN KEY (`apporteur_id`) REFERENCES `apporteur` (`id`),
  CONSTRAINT `FK_E96D1F43FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apport`
--

LOCK TABLES `apport` WRITE;
/*!40000 ALTER TABLE `apport` DISABLE KEYS */;
/*!40000 ALTER TABLE `apport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apporteur`
--

DROP TABLE IF EXISTS `apporteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apporteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entite_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D19B6D719BEA957A` (`entite_id`),
  KEY `IDX_D19B6D71FCF77503` (`societe_id`),
  CONSTRAINT `FK_D19B6D719BEA957A` FOREIGN KEY (`entite_id`) REFERENCES `entite` (`id`),
  CONSTRAINT `FK_D19B6D71FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apporteur`
--

LOCK TABLES `apporteur` WRITE;
/*!40000 ALTER TABLE `apporteur` DISABLE KEYS */;
/*!40000 ALTER TABLE `apporteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classification_article_id` int(11) DEFAULT NULL,
  `classification_vente_id` int(11) DEFAULT NULL,
  `marge_id` int(11) DEFAULT NULL,
  `tva_id` int(11) DEFAULT NULL,
  `unite_id` int(11) DEFAULT NULL,
  `id_famille` int(11) NOT NULL,
  `nature_article_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `designation` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `quantite` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prixUnitaire` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_23A0E66AEA34913` (`reference`),
  UNIQUE KEY `UNIQ_23A0E668BF24A79` (`quantite`),
  UNIQUE KEY `UNIQ_23A0E669EF3DE33` (`prixUnitaire`),
  UNIQUE KEY `UNIQ_23A0E66FB0D31D6` (`marge_id`),
  KEY `IDX_23A0E661C946EBC` (`classification_article_id`),
  KEY `IDX_23A0E66F851745A` (`classification_vente_id`),
  KEY `IDX_23A0E664D79775F` (`tva_id`),
  KEY `IDX_23A0E66EC4A74AB` (`unite_id`),
  KEY `IDX_23A0E66FAEE5B63` (`id_famille`),
  KEY `IDX_23A0E669EEA350B` (`nature_article_id`),
  KEY `IDX_23A0E66FCF77503` (`societe_id`),
  CONSTRAINT `FK_23A0E661C946EBC` FOREIGN KEY (`classification_article_id`) REFERENCES `classification_article` (`id`),
  CONSTRAINT `FK_23A0E664D79775F` FOREIGN KEY (`tva_id`) REFERENCES `tva` (`id`),
  CONSTRAINT `FK_23A0E669EEA350B` FOREIGN KEY (`nature_article_id`) REFERENCES `nature_article` (`id`),
  CONSTRAINT `FK_23A0E66EC4A74AB` FOREIGN KEY (`unite_id`) REFERENCES `unite` (`id`),
  CONSTRAINT `FK_23A0E66F851745A` FOREIGN KEY (`classification_vente_id`) REFERENCES `classification_vente` (`id`),
  CONSTRAINT `FK_23A0E66FAEE5B63` FOREIGN KEY (`id_famille`) REFERENCES `famille_article` (`id`),
  CONSTRAINT `FK_23A0E66FB0D31D6` FOREIGN KEY (`marge_id`) REFERENCES `marge` (`id`),
  CONSTRAINT `FK_23A0E66FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_fournisseur`
--

DROP TABLE IF EXISTS `article_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_fournisseur` (
  `article_id` int(11) NOT NULL,
  `fournisseur_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`fournisseur_id`),
  KEY `IDX_AC1DA0557294869C` (`article_id`),
  KEY `IDX_AC1DA055670C757F` (`fournisseur_id`),
  CONSTRAINT `FK_AC1DA055670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AC1DA0557294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_fournisseur`
--

LOCK TABLES `article_fournisseur` WRITE;
/*!40000 ALTER TABLE `article_fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `civilite`
--

DROP TABLE IF EXISTS `civilite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `civilite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2C4C1BD6FF7747B4` (`titre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `civilite`
--

LOCK TABLES `civilite` WRITE;
/*!40000 ALTER TABLE `civilite` DISABLE KEYS */;
/*!40000 ALTER TABLE `civilite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification_article`
--

DROP TABLE IF EXISTS `classification_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_comptable_id` int(11) NOT NULL,
  `systeme_comptable_id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F1698634D678252E` (`compte_comptable_id`),
  KEY `IDX_F1698634E74A125A` (`systeme_comptable_id`),
  CONSTRAINT `FK_F1698634D678252E` FOREIGN KEY (`compte_comptable_id`) REFERENCES `compte_comptable` (`id`),
  CONSTRAINT `FK_F1698634E74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_article`
--

LOCK TABLES `classification_article` WRITE;
/*!40000 ALTER TABLE `classification_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `classification_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification_article_societe`
--

DROP TABLE IF EXISTS `classification_article_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification_article_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_comptable_id` int(11) NOT NULL,
  `systeme_comptable_id` int(11) NOT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DDC379F0D678252E` (`compte_comptable_id`),
  KEY `IDX_DDC379F0E74A125A` (`systeme_comptable_id`),
  KEY `IDX_DDC379F0FCF77503` (`societe_id`),
  CONSTRAINT `FK_DDC379F0D678252E` FOREIGN KEY (`compte_comptable_id`) REFERENCES `compte_comptable` (`id`),
  CONSTRAINT `FK_DDC379F0E74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`),
  CONSTRAINT `FK_DDC379F0FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_article_societe`
--

LOCK TABLES `classification_article_societe` WRITE;
/*!40000 ALTER TABLE `classification_article_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `classification_article_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification_vente`
--

DROP TABLE IF EXISTS `classification_vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification_vente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_comptable_id` int(11) NOT NULL,
  `systeme_comptable_id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A4D701C8D678252E` (`compte_comptable_id`),
  KEY `IDX_A4D701C8E74A125A` (`systeme_comptable_id`),
  CONSTRAINT `FK_A4D701C8D678252E` FOREIGN KEY (`compte_comptable_id`) REFERENCES `compte_comptable` (`id`),
  CONSTRAINT `FK_A4D701C8E74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_vente`
--

LOCK TABLES `classification_vente` WRITE;
/*!40000 ALTER TABLE `classification_vente` DISABLE KEYS */;
/*!40000 ALTER TABLE `classification_vente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification_vente_societe`
--

DROP TABLE IF EXISTS `classification_vente_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification_vente_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_comptable_id` int(11) NOT NULL,
  `systeme_comptable_id` int(11) NOT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E8859E37D678252E` (`compte_comptable_id`),
  KEY `IDX_E8859E37E74A125A` (`systeme_comptable_id`),
  KEY `IDX_E8859E37FCF77503` (`societe_id`),
  CONSTRAINT `FK_E8859E37D678252E` FOREIGN KEY (`compte_comptable_id`) REFERENCES `compte_comptable` (`id`),
  CONSTRAINT `FK_E8859E37E74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`),
  CONSTRAINT `FK_E8859E37FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_vente_societe`
--

LOCK TABLES `classification_vente_societe` WRITE;
/*!40000 ALTER TABLE `classification_vente_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `classification_vente_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C74404559BEA957A` (`entite_id`),
  CONSTRAINT `FK_C74404559BEA957A` FOREIGN KEY (`entite_id`) REFERENCES `entite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_invitation`
--

DROP TABLE IF EXISTS `code_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generated_by_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `recipient_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D9B39C4477153098` (`code`),
  KEY `IDX_D9B39C441BDD81B` (`generated_by_id`),
  KEY `IDX_D9B39C44FCF77503` (`societe_id`),
  CONSTRAINT `FK_D9B39C441BDD81B` FOREIGN KEY (`generated_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_D9B39C44FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_invitation`
--

LOCK TABLES `code_invitation` WRITE;
/*!40000 ALTER TABLE `code_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `code_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte`
--

DROP TABLE IF EXISTS `compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societe_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `montant` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CFF65260FCF77503` (`societe_id`),
  CONSTRAINT `FK_CFF65260FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte`
--

LOCK TABLES `compte` WRITE;
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte_comptable`
--

DROP TABLE IF EXISTS `compte_comptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compte_comptable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systeme_comptable_id` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `code` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_98EA7D55E74A125A` (`systeme_comptable_id`),
  CONSTRAINT `FK_98EA7D55E74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte_comptable`
--

LOCK TABLES `compte_comptable` WRITE;
/*!40000 ALTER TABLE `compte_comptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte_comptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte_comptable_par_action_comptable`
--

DROP TABLE IF EXISTS `compte_comptable_par_action_comptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compte_comptable_par_action_comptable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_comptable_id` int(11) DEFAULT NULL,
  `systeme_comptable_id` int(11) DEFAULT NULL,
  `action_comptable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C2ECB77CD678252E` (`compte_comptable_id`),
  KEY `IDX_C2ECB77CE74A125A` (`systeme_comptable_id`),
  KEY `IDX_C2ECB77C26207569` (`action_comptable_id`),
  CONSTRAINT `FK_C2ECB77C26207569` FOREIGN KEY (`action_comptable_id`) REFERENCES `action_comptable` (`id`),
  CONSTRAINT `FK_C2ECB77CD678252E` FOREIGN KEY (`compte_comptable_id`) REFERENCES `compte_comptable` (`id`),
  CONSTRAINT `FK_C2ECB77CE74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte_comptable_par_action_comptable`
--

LOCK TABLES `compte_comptable_par_action_comptable` WRITE;
/*!40000 ALTER TABLE `compte_comptable_par_action_comptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte_comptable_par_action_comptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte_comptable_societe`
--

DROP TABLE IF EXISTS `compte_comptable_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compte_comptable_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ABFDC4BCF2C56620` (`compte_id`),
  KEY `IDX_ABFDC4BCFCF77503` (`societe_id`),
  CONSTRAINT `FK_ABFDC4BCF2C56620` FOREIGN KEY (`compte_id`) REFERENCES `compte` (`id`),
  CONSTRAINT `FK_ABFDC4BCFCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte_comptable_societe`
--

LOCK TABLES `compte_comptable_societe` WRITE;
/*!40000 ALTER TABLE `compte_comptable_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte_comptable_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions_de_reglements`
--

DROP TABLE IF EXISTS `conditions_de_reglements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions_de_reglements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2B7D750DFF7747B4` (`titre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions_de_reglements`
--

LOCK TABLES `conditions_de_reglements` WRITE;
/*!40000 ALTER TABLE `conditions_de_reglements` DISABLE KEYS */;
/*!40000 ALTER TABLE `conditions_de_reglements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordonnee_banque_societe`
--

DROP TABLE IF EXISTS `coordonnee_banque_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordonnee_banque_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coordonnee_banque_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2BFB1B9F46463BCD` (`coordonnee_banque_id`),
  KEY `IDX_2BFB1B9FFCF77503` (`societe_id`),
  CONSTRAINT `FK_2BFB1B9F46463BCD` FOREIGN KEY (`coordonnee_banque_id`) REFERENCES `coordonnees_banque` (`id`),
  CONSTRAINT `FK_2BFB1B9FFCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordonnee_banque_societe`
--

LOCK TABLES `coordonnee_banque_societe` WRITE;
/*!40000 ALTER TABLE `coordonnee_banque_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordonnee_banque_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordonnees_banque`
--

DROP TABLE IF EXISTS `coordonnees_banque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordonnees_banque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banque` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `montantDeLencours` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6F3F5C38BFB7B5B6` (`rib`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordonnees_banque`
--

LOCK TABLES `coordonnees_banque` WRITE;
/*!40000 ALTER TABLE `coordonnees_banque` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordonnees_banque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depense`
--

DROP TABLE IF EXISTS `depense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fournisseur_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `referencePiece` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commentaire` longtext COLLATE utf8_unicode_ci,
  `scanPiece` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_34059757670C757F` (`fournisseur_id`),
  CONSTRAINT `FK_34059757670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depense`
--

LOCK TABLES `depense` WRITE;
/*!40000 ALTER TABLE `depense` DISABLE KEYS */;
/*!40000 ALTER TABLE `depense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_de_documents_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `entite_id` int(11) DEFAULT NULL,
  `conditions_de_reglements_id` int(11) DEFAULT NULL,
  `mode_de_paiement_id` int(11) DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `montant_ht` double NOT NULL,
  `montant_ttc` double NOT NULL,
  `reste` double NOT NULL,
  `tva` double NOT NULL,
  `objet` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modified_at` datetime NOT NULL,
  `dateDeLivraison` datetime NOT NULL,
  `dureeDeValidite` int(11) NOT NULL,
  `commentaire` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tauxDePenalite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A2B07288AEA34913` (`reference`),
  KEY `IDX_A2B07288EAFB552E` (`type_de_documents_id`),
  KEY `IDX_A2B07288FCF77503` (`societe_id`),
  KEY `IDX_A2B072889BEA957A` (`entite_id`),
  KEY `IDX_A2B072881265D67A` (`conditions_de_reglements_id`),
  KEY `IDX_A2B072888776F13D` (`mode_de_paiement_id`),
  CONSTRAINT `FK_A2B072881265D67A` FOREIGN KEY (`conditions_de_reglements_id`) REFERENCES `conditions_de_reglements` (`id`),
  CONSTRAINT `FK_A2B072888776F13D` FOREIGN KEY (`mode_de_paiement_id`) REFERENCES `mode_de_paiement` (`id`),
  CONSTRAINT `FK_A2B072889BEA957A` FOREIGN KEY (`entite_id`) REFERENCES `entite` (`id`),
  CONSTRAINT `FK_A2B07288EAFB552E` FOREIGN KEY (`type_de_documents_id`) REFERENCES `type_de_documents` (`id`),
  CONSTRAINT `FK_A2B07288FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entite`
--

DROP TABLE IF EXISTS `entite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `civilite_id` int(11) DEFAULT NULL,
  `forme_juridique_id` int(11) DEFAULT NULL,
  `coordonnees_banque_id` int(11) DEFAULT NULL,
  `adresse_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenoms` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `raisonSociale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siteWeb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fonction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1A2918274DE7DC5C` (`adresse_id`),
  KEY `IDX_1A29182739194ABF` (`civilite_id`),
  KEY `IDX_1A2918279AEE68EB` (`forme_juridique_id`),
  KEY `IDX_1A291827EC514E12` (`coordonnees_banque_id`),
  KEY `IDX_1A291827FCF77503` (`societe_id`),
  CONSTRAINT `FK_1A29182739194ABF` FOREIGN KEY (`civilite_id`) REFERENCES `civilite` (`id`),
  CONSTRAINT `FK_1A2918274DE7DC5C` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`),
  CONSTRAINT `FK_1A2918279AEE68EB` FOREIGN KEY (`forme_juridique_id`) REFERENCES `forme_juridique` (`id`),
  CONSTRAINT `FK_1A291827EC514E12` FOREIGN KEY (`coordonnees_banque_id`) REFERENCES `coordonnees_banque` (`id`),
  CONSTRAINT `FK_1A291827FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entite`
--

LOCK TABLES `entite` WRITE;
/*!40000 ALTER TABLE `entite` DISABLE KEYS */;
/*!40000 ALTER TABLE `entite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entite_classification_article`
--

DROP TABLE IF EXISTS `entite_classification_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entite_classification_article` (
  `entite_id` int(11) NOT NULL,
  `classification_article_id` int(11) NOT NULL,
  PRIMARY KEY (`entite_id`,`classification_article_id`),
  KEY `IDX_A7830B389BEA957A` (`entite_id`),
  KEY `IDX_A7830B381C946EBC` (`classification_article_id`),
  CONSTRAINT `FK_A7830B381C946EBC` FOREIGN KEY (`classification_article_id`) REFERENCES `classification_article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A7830B389BEA957A` FOREIGN KEY (`entite_id`) REFERENCES `entite` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entite_classification_article`
--

LOCK TABLES `entite_classification_article` WRITE;
/*!40000 ALTER TABLE `entite_classification_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `entite_classification_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `famille_article`
--

DROP TABLE IF EXISTS `famille_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `famille_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societe_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CE500488FCF77503` (`societe_id`),
  CONSTRAINT `FK_CE500488FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `famille_article`
--

LOCK TABLES `famille_article` WRITE;
/*!40000 ALTER TABLE `famille_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `famille_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forme_juridique`
--

DROP TABLE IF EXISTS `forme_juridique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forme_juridique` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_15992E62B36786B` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forme_juridique`
--

LOCK TABLES `forme_juridique` WRITE;
/*!40000 ALTER TABLE `forme_juridique` DISABLE KEYS */;
/*!40000 ALTER TABLE `forme_juridique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_369ECA329BEA957A` (`entite_id`),
  CONSTRAINT `FK_369ECA329BEA957A` FOREIGN KEY (`entite_id`) REFERENCES `entite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_administrative`
--

DROP TABLE IF EXISTS `information_administrative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information_administrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societe_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FD9E0F9AFCF77503` (`societe_id`),
  CONSTRAINT `FK_FD9E0F9AFCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_administrative`
--

LOCK TABLES `information_administrative` WRITE;
/*!40000 ALTER TABLE `information_administrative` DISABLE KEYS */;
/*!40000 ALTER TABLE `information_administrative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne_depense`
--

DROP TABLE IF EXISTS `ligne_depense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligne_depense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depense_id` int(11) DEFAULT NULL,
  `classification_id` int(11) DEFAULT NULL,
  `montant` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AB9CA96E41D81563` (`depense_id`),
  KEY `IDX_AB9CA96E2A86559F` (`classification_id`),
  CONSTRAINT `FK_AB9CA96E2A86559F` FOREIGN KEY (`classification_id`) REFERENCES `classification_article` (`id`),
  CONSTRAINT `FK_AB9CA96E41D81563` FOREIGN KEY (`depense_id`) REFERENCES `depense` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_depense`
--

LOCK TABLES `ligne_depense` WRITE;
/*!40000 ALTER TABLE `ligne_depense` DISABLE KEYS */;
/*!40000 ALTER TABLE `ligne_depense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne_facture`
--

DROP TABLE IF EXISTS `ligne_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligne_facture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tva_id` int(11) DEFAULT NULL,
  `unite_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prixUnitaire` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantite` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_611F5A294D79775F` (`tva_id`),
  KEY `IDX_611F5A29EC4A74AB` (`unite_id`),
  KEY `IDX_611F5A29C33F7837` (`document_id`),
  CONSTRAINT `FK_611F5A294D79775F` FOREIGN KEY (`tva_id`) REFERENCES `tva` (`id`),
  CONSTRAINT `FK_611F5A29C33F7837` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_611F5A29EC4A74AB` FOREIGN KEY (`unite_id`) REFERENCES `unite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_facture`
--

LOCK TABLES `ligne_facture` WRITE;
/*!40000 ALTER TABLE `ligne_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `ligne_facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marge`
--

DROP TABLE IF EXISTS `marge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prixAchatHt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `margeBrute` double NOT NULL,
  `coefficientMultiplicateur` double NOT NULL,
  `pourcentageMarge` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marge`
--

LOCK TABLES `marge` WRITE;
/*!40000 ALTER TABLE `marge` DISABLE KEYS */;
/*!40000 ALTER TABLE `marge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mode_de_paiement`
--

DROP TABLE IF EXISTS `mode_de_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mode_de_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AC92AFA92B36786B` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode_de_paiement`
--

LOCK TABLES `mode_de_paiement` WRITE;
/*!40000 ALTER TABLE `mode_de_paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `mode_de_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monnaie`
--

DROP TABLE IF EXISTS `monnaie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monnaie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tauxAuDollar` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B3A6E2E661587F41` (`iso`),
  UNIQUE KEY `UNIQ_B3A6E2E6A4D60759` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monnaie`
--

LOCK TABLES `monnaie` WRITE;
/*!40000 ALTER TABLE `monnaie` DISABLE KEYS */;
/*!40000 ALTER TABLE `monnaie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nature_article`
--

DROP TABLE IF EXISTS `nature_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nature_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nature_article`
--

LOCK TABLES `nature_article` WRITE;
/*!40000 ALTER TABLE `nature_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `nature_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_sur_compte`
--

DROP TABLE IF EXISTS `operation_sur_compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_sur_compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `debit` decimal(2,0) NOT NULL,
  `credit` decimal(2,0) NOT NULL,
  `pieces_jointes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_4F8B43DAF2C56620` (`compte_id`),
  KEY `IDX_4F8B43DAC33F7837` (`document_id`),
  CONSTRAINT `FK_4F8B43DAC33F7837` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_4F8B43DAF2C56620` FOREIGN KEY (`compte_id`) REFERENCES `compte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_sur_compte`
--

LOCK TABLES `operation_sur_compte` WRITE;
/*!40000 ALTER TABLE `operation_sur_compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_sur_compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode_de_paiement_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `montant` double NOT NULL,
  `date` datetime NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B1DC7A1E8776F13D` (`mode_de_paiement_id`),
  KEY `IDX_B1DC7A1EC33F7837` (`document_id`),
  CONSTRAINT `FK_B1DC7A1E8776F13D` FOREIGN KEY (`mode_de_paiement_id`) REFERENCES `mode_de_paiement` (`id`),
  CONSTRAINT `FK_B1DC7A1EC33F7837` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiement`
--

LOCK TABLES `paiement` WRITE;
/*!40000 ALTER TABLE `paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systeme_comptable_id` int(11) DEFAULT NULL,
  `iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_349F3CAEFF7747B4` (`titre`),
  KEY `IDX_349F3CAEE74A125A` (`systeme_comptable_id`),
  CONSTRAINT `FK_349F3CAEE74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reglement`
--

DROP TABLE IF EXISTS `reglement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reglement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depense_id` int(11) NOT NULL,
  `mode_de_paiement_id` int(11) DEFAULT NULL,
  `montant` double NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EBE4C14C41D81563` (`depense_id`),
  KEY `IDX_EBE4C14C8776F13D` (`mode_de_paiement_id`),
  CONSTRAINT `FK_EBE4C14C41D81563` FOREIGN KEY (`depense_id`) REFERENCES `depense` (`id`),
  CONSTRAINT `FK_EBE4C14C8776F13D` FOREIGN KEY (`mode_de_paiement_id`) REFERENCES `mode_de_paiement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglement`
--

LOCK TABLES `reglement` WRITE;
/*!40000 ALTER TABLE `reglement` DISABLE KEYS */;
/*!40000 ALTER TABLE `reglement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privilege` (
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`privilege_id`),
  KEY `IDX_D6D4495BD60322AC` (`role_id`),
  KEY `IDX_D6D4495B32FB8AEA` (`privilege_id`),
  CONSTRAINT `FK_D6D4495B32FB8AEA` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D6D4495BD60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_privilege`
--

LOCK TABLES `role_privilege` WRITE;
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_role`
--

DROP TABLE IF EXISTS `role_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_role` (
  `role_source` int(11) NOT NULL,
  `role_target` int(11) NOT NULL,
  PRIMARY KEY (`role_source`,`role_target`),
  KEY `IDX_E9D6F8FEF4AC9EC2` (`role_source`),
  KEY `IDX_E9D6F8FEED49CE4D` (`role_target`),
  CONSTRAINT `FK_E9D6F8FEED49CE4D` FOREIGN KEY (`role_target`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E9D6F8FEF4AC9EC2` FOREIGN KEY (`role_source`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_role`
--

LOCK TABLES `role_role` WRITE;
/*!40000 ALTER TABLE `role_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secteur_activite`
--

DROP TABLE IF EXISTS `secteur_activite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secteur_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secteur_activite`
--

LOCK TABLES `secteur_activite` WRITE;
/*!40000 ALTER TABLE `secteur_activite` DISABLE KEYS */;
/*!40000 ALTER TABLE `secteur_activite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `societe`
--

DROP TABLE IF EXISTS `societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systeme_comptable_id` int(11) DEFAULT NULL,
  `forme_juridique_id` int(11) DEFAULT NULL,
  `secteur_activite_id` int(11) DEFAULT NULL,
  `monnaie_id` int(11) DEFAULT NULL,
  `pays_id` int(11) DEFAULT NULL,
  `raisonSociale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permalien` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `capital_social` int(11) DEFAULT NULL,
  `dateDeCreation` datetime NOT NULL,
  `activitePrincipale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_19653DBDE74A125A` (`systeme_comptable_id`),
  KEY `IDX_19653DBD9AEE68EB` (`forme_juridique_id`),
  KEY `IDX_19653DBD5233A7FC` (`secteur_activite_id`),
  KEY `IDX_19653DBD98D3FE22` (`monnaie_id`),
  KEY `IDX_19653DBDA6E44244` (`pays_id`),
  CONSTRAINT `FK_19653DBD5233A7FC` FOREIGN KEY (`secteur_activite_id`) REFERENCES `secteur_activite` (`id`),
  CONSTRAINT `FK_19653DBD98D3FE22` FOREIGN KEY (`monnaie_id`) REFERENCES `monnaie` (`id`),
  CONSTRAINT `FK_19653DBD9AEE68EB` FOREIGN KEY (`forme_juridique_id`) REFERENCES `forme_juridique` (`id`),
  CONSTRAINT `FK_19653DBDA6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`),
  CONSTRAINT `FK_19653DBDE74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `societe`
--

LOCK TABLES `societe` WRITE;
/*!40000 ALTER TABLE `societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systeme_comptable`
--

DROP TABLE IF EXISTS `systeme_comptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systeme_comptable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69EEE1DBA4D60759` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systeme_comptable`
--

LOCK TABLES `systeme_comptable` WRITE;
/*!40000 ALTER TABLE `systeme_comptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `systeme_comptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tva`
--

DROP TABLE IF EXISTS `tva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taux` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EF699620809A3D7D` (`taux`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tva`
--

LOCK TABLES `tva` WRITE;
/*!40000 ALTER TABLE `tva` DISABLE KEYS */;
/*!40000 ALTER TABLE `tva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_de_documents`
--

DROP TABLE IF EXISTS `type_de_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_de_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FAE7AA84FF7747B4` (`titre`),
  UNIQUE KEY `UNIQ_FAE7AA8477153098` (`code`),
  UNIQUE KEY `UNIQ_FAE7AA8493B1868E` (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_de_documents`
--

LOCK TABLES `type_de_documents` WRITE;
/*!40000 ALTER TABLE `type_de_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_de_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unite`
--

DROP TABLE IF EXISTS `unite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unite`
--

LOCK TABLES `unite` WRITE;
/*!40000 ALTER TABLE `unite` DISABLE KEYS */;
/*!40000 ALTER TABLE `unite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complete` tinyint(1) NOT NULL,
  `facebook_authorisation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_authorisation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenoms` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_host` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genre` tinyint(1) DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastactiondate` datetime DEFAULT NULL,
  `usertype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_parameter`
--

DROP TABLE IF EXISTS `user_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2A771CF4A76ED395` (`user_id`),
  CONSTRAINT `FK_2A771CF4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_parameter`
--

LOCK TABLES `user_parameter` WRITE;
/*!40000 ALTER TABLE `user_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_2DE8C6A3A76ED395` (`user_id`),
  KEY `IDX_2DE8C6A3D60322AC` (`role_id`),
  CONSTRAINT `FK_2DE8C6A3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2DE8C6A3D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur_societe`
--

DROP TABLE IF EXISTS `utilisateur_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_636ECA2FA76ED395` (`user_id`),
  KEY `IDX_636ECA2FFCF77503` (`societe_id`),
  CONSTRAINT `FK_636ECA2FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_636ECA2FFCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur_societe`
--

LOCK TABLES `utilisateur_societe` WRITE;
/*!40000 ALTER TABLE `utilisateur_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur_societe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-20 12:48:04
