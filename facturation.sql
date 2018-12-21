-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: facturation
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `action_comptable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `systeme_comptable_id` int(11) NOT NULL,
  `compte_comptable_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FF62507AE74A125A` (`systeme_comptable_id`),
  KEY `IDX_FF62507AD678252E` (`compte_comptable_id`),
  CONSTRAINT `FK_FF62507AD678252E` FOREIGN KEY (`compte_comptable_id`) REFERENCES `compte_comptable` (`id`),
  CONSTRAINT `FK_FF62507AE74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_comptable`
--

LOCK TABLES `action_comptable` WRITE;
/*!40000 ALTER TABLE `action_comptable` DISABLE KEYS */;
INSERT INTO `action_comptable` VALUES (1,'Apports de capitaux','APPORT',1,2);
/*!40000 ALTER TABLE `action_comptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_comptable_societe`
--

DROP TABLE IF EXISTS `action_comptable_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `action_comptable_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systeme_comptable_id` int(11) NOT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FC30D1F2E74A125A` (`systeme_comptable_id`),
  KEY `IDX_FC30D1F2FCF77503` (`societe_id`),
  CONSTRAINT `FK_FC30D1F2E74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`),
  CONSTRAINT `FK_FC30D1F2FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_comptable_societe`
--

LOCK TABLES `action_comptable_societe` WRITE;
/*!40000 ALTER TABLE `action_comptable_societe` DISABLE KEYS */;
INSERT INTO `action_comptable_societe` VALUES (1,1,1,'Apports de capitaux','APPORT'),(2,1,2,'Apports de capitaux','APPORT');
/*!40000 ALTER TABLE `action_comptable_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pays_id` int(11) DEFAULT NULL,
  `adresse` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `adresseSuite` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `codePostal` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telBureau` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `portable` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C35F0816A6E44244` (`pays_id`),
  CONSTRAINT `FK_C35F0816A6E44244` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,51,'BP 7302',NULL,'abidjan','225','22225050','07676745',NULL),(2,51,'Ananeraie',NULL,'abidjan','225','89513382',NULL,NULL),(3,22,'BP 7302',NULL,'abidjan','225','EDS Côte d\'Ivoire',NULL,NULL),(5,51,'Plateau Rue du commerce',NULL,'Abidjan','00225',NULL,NULL,NULL);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresse_societe`
--

DROP TABLE IF EXISTS `adresse_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adresse_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societe_id` int(11) DEFAULT NULL,
  `adresse_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B77B82224DE7DC5C` (`adresse_id`),
  KEY `IDX_B77B8222FCF77503` (`societe_id`),
  CONSTRAINT `FK_B77B82224DE7DC5C` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`),
  CONSTRAINT `FK_B77B8222FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse_societe`
--

LOCK TABLES `adresse_societe` WRITE;
/*!40000 ALTER TABLE `adresse_societe` DISABLE KEYS */;
INSERT INTO `adresse_societe` VALUES (1,NULL,1,'Bingerville'),(2,NULL,2,'26 bp 1313 abidjan'),(3,NULL,3,'26 bp 1313 abidjan');
/*!40000 ALTER TABLE `adresse_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agrement`
--

DROP TABLE IF EXISTS `agrement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agrement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societe_id` int(11) DEFAULT NULL,
  `typeAgrement` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `numeroAgrement` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `apport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apporteur_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `montant` double NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
  `reference` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `designation` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quantite` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prixUnitaire` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `civilite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2C4C1BD6FF7747B4` (`titre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `civilite`
--

LOCK TABLES `civilite` WRITE;
/*!40000 ALTER TABLE `civilite` DISABLE KEYS */;
INSERT INTO `civilite` VALUES (1,'Docteur'),(2,'Madame'),(3,'Madame & Monsieur'),(5,'Mademoiselle'),(6,'Maître'),(4,'Monsieur'),(8,'Monsieur & Madame'),(7,'Professeur');
/*!40000 ALTER TABLE `civilite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification_article`
--

DROP TABLE IF EXISTS `classification_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classification_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_comptable_id` int(11) NOT NULL,
  `systeme_comptable_id` int(11) NOT NULL,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classification_article_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_comptable_id` int(11) NOT NULL,
  `systeme_comptable_id` int(11) NOT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classification_vente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_comptable_id` int(11) NOT NULL,
  `systeme_comptable_id` int(11) NOT NULL,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A4D701C8D678252E` (`compte_comptable_id`),
  KEY `IDX_A4D701C8E74A125A` (`systeme_comptable_id`),
  CONSTRAINT `FK_A4D701C8D678252E` FOREIGN KEY (`compte_comptable_id`) REFERENCES `compte_comptable` (`id`),
  CONSTRAINT `FK_A4D701C8E74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_vente`
--

LOCK TABLES `classification_vente` WRITE;
/*!40000 ALTER TABLE `classification_vente` DISABLE KEYS */;
INSERT INTO `classification_vente` VALUES (1,181,1,'Matières premières'),(2,184,2,'Matières premières');
/*!40000 ALTER TABLE `classification_vente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification_vente_societe`
--

DROP TABLE IF EXISTS `classification_vente_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classification_vente_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_comptable_id` int(11) NOT NULL,
  `systeme_comptable_id` int(11) NOT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E8859E37D678252E` (`compte_comptable_id`),
  KEY `IDX_E8859E37E74A125A` (`systeme_comptable_id`),
  KEY `IDX_E8859E37FCF77503` (`societe_id`),
  CONSTRAINT `FK_E8859E37D678252E` FOREIGN KEY (`compte_comptable_id`) REFERENCES `compte_comptable` (`id`),
  CONSTRAINT `FK_E8859E37E74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`),
  CONSTRAINT `FK_E8859E37FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_vente_societe`
--

LOCK TABLES `classification_vente_societe` WRITE;
/*!40000 ALTER TABLE `classification_vente_societe` DISABLE KEYS */;
INSERT INTO `classification_vente_societe` VALUES (1,181,1,1,'Matières premières'),(2,181,1,2,'Matières premières'),(3,184,2,3,'Matières premières');
/*!40000 ALTER TABLE `classification_vente_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C74404559BEA957A` (`entite_id`),
  CONSTRAINT `FK_C74404559BEA957A` FOREIGN KEY (`entite_id`) REFERENCES `entite` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_invitation`
--

DROP TABLE IF EXISTS `code_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `code_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generated_by_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `recipient_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societe_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `montant` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compte_comptable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systeme_comptable_id` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `code` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_98EA7D55E74A125A` (`systeme_comptable_id`),
  CONSTRAINT `FK_98EA7D55E74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte_comptable`
--

LOCK TABLES `compte_comptable` WRITE;
/*!40000 ALTER TABLE `compte_comptable` DISABLE KEYS */;
INSERT INTO `compte_comptable` VALUES (1,1,NULL,'10','Capital'),(2,1,NULL,'101','Capital social'),(3,1,NULL,'1011','Capital souscrit, non appelé'),(4,1,NULL,'1012','Capital souscrit, appelé, non versé'),(5,1,NULL,'1013','Capital souscrit, appelé, versé, versé, non amorti'),(6,1,NULL,'1014','Capital souscrit, appelé, versé, amorti'),(7,1,NULL,'1018','Capital souscrit soumis à des conditions particulières'),(8,1,NULL,'102','Capital par dotation'),(9,1,NULL,'1021','Dotation initiale'),(10,1,NULL,'1022','Dotations complémentaires'),(11,1,NULL,'1028','Autres dotations'),(12,1,NULL,'103','Capital personnel'),(13,1,NULL,'104','Compte de l’exploitant'),(14,1,NULL,'1041','Apports temporaires'),(15,1,NULL,'1042','Opérations courantes'),(16,1,NULL,'1043','Rémunérations, impôts et autres charges personnelles'),(17,1,NULL,'1047','Prélèvements d’autoconsom-mation'),(18,1,NULL,'1048','Autres prélèvements'),(19,1,NULL,'105','Primes liées aux capitaux propres'),(20,1,NULL,'1051','Primes d’émission'),(21,1,NULL,'1052','Primes d’apport'),(22,1,NULL,'1053','Primes de fusion'),(23,1,NULL,'1054','Primes de conversion'),(24,1,NULL,'1058','Autres primes'),(25,1,NULL,'106','Écarts de réévaluation'),(26,1,NULL,'1061','Écarts de réévaluation légale'),(27,1,NULL,'1062','Écarts de réévaluation libre'),(28,1,NULL,'109','Actionnaires, capital souscrit, non appelé'),(29,1,NULL,'11','Réserves'),(30,1,NULL,'111','Réserve légale'),(31,1,NULL,'112','Réserves statutaires ou contractuelles'),(32,1,NULL,'113','Réserves réglementées'),(33,1,NULL,'1131','Réserves de plus-values nettes à long terme'),(34,1,NULL,'1133','Réserves consécutives à l’oc-troi de subventions d’investisse-ment'),(35,1,NULL,'1138','Autres réserves réglementées'),(36,1,NULL,'118','Autres réserves'),(37,1,NULL,'1181','Réserves facultatives'),(38,1,NULL,'1188','Réserves diverses'),(39,1,NULL,'12','Report à nouveau'),(40,1,NULL,'121','Report à nouveau créditeur'),(41,1,NULL,'129','Report à nouveau débiteur'),(42,1,NULL,'1291','Perte nette à reporter'),(43,1,NULL,'1292','Perte - Amortissements réputés différés'),(44,1,NULL,'13','Résultat net de l’exercice'),(45,1,NULL,'130','Résultat en instance d’affectation'),(46,1,NULL,'1301','Résultat en instance d’affec-tation : bénéfice'),(47,1,NULL,'1309','Résultat en instance d’affec-tation : perte'),(48,1,NULL,'131','Résultat net : bénéfice'),(49,1,NULL,'132','Marge brute (MB)'),(50,1,NULL,'1321','Marge brute sur marchandises'),(51,1,NULL,'1322','Marge brute sur matières'),(52,1,NULL,'133','Valeur ajoutée (VA)'),(53,1,NULL,'134','Excédent brut d’exploitation (EBE)'),(54,1,NULL,'135','Résultat d’exploitation (RE)'),(55,1,NULL,'136','Résultat financier (RF)'),(56,1,NULL,'137','Résultat des activités ordinaires (RAO)'),(57,1,NULL,'138','Résultat hors activités ordinaires (RHAO)'),(58,1,NULL,'139','Résultat net : perte'),(59,1,NULL,'14','Subventions d’investissement'),(60,1,NULL,'141','Subventions d’équipement A'),(61,1,NULL,'1411','État'),(62,1,NULL,'1412','Régions'),(63,1,NULL,'1413','Départements'),(64,1,NULL,'1414','Communes et collectivités publiques décentralisées'),(65,1,NULL,'1415','Entreprises publiques ou mixtes'),(66,1,NULL,'1416','Entreprises et organismes privés'),(67,1,NULL,'1417','Organismes internationaux'),(68,1,NULL,'1418','Autres'),(69,1,NULL,'142','Subventions d’équipement B'),(70,1,NULL,'148','Autres subventions d’investisse-ment'),(71,1,NULL,'15','Provisions réglementées et fonds assimilés'),(72,1,NULL,'151','Amortissements dérogatoires'),(73,1,NULL,'152','Plus-values de cession à réinvestir'),(74,1,NULL,'153','Fonds réglementés'),(75,1,NULL,'1531','Fonds National'),(76,1,NULL,'1532','Prélèvement pour le Budget'),(77,1,NULL,'154','Provision spéciale de réévaluation'),(78,1,NULL,'155','Provisions réglementées relatives aux immobilisations'),(79,1,NULL,'1551','Reconstitution des gisements miniers et pétroliers'),(80,1,NULL,'156','Provisions réglementées relatives aux stocks'),(81,1,NULL,'1561','Hausse de prix'),(82,1,NULL,'1562','Fluctuation des cours'),(83,1,NULL,'157','Provisions pour investissement'),(84,1,NULL,'158','Autres provisions et fonds réglementes'),(85,1,NULL,'16','Emprunts et dettes assimilées'),(86,1,NULL,'161','Emprunts obligataires'),(87,1,NULL,'1611','Emprunts obligataires ordinaires'),(88,1,NULL,'1612','Emprunts obligataires con-vertibles'),(89,1,NULL,'1618','Autres emprunts obligataires'),(90,1,NULL,'162','Emprunts et dettes auprès des établissements de crédit'),(91,1,NULL,'163','Avances reçues de l’état'),(92,1,NULL,'164','Avances reçues et comptes courants bloqués'),(93,1,NULL,'165','Dépôts et cautionnements reçus'),(94,1,NULL,'1651','Dépôts'),(95,1,NULL,'1652','Cautionnements'),(96,1,NULL,'166','Intérêts courus'),(97,1,NULL,'1661','sur emprunts obligataires'),(98,1,NULL,'1662','sur emprunts et dettes auprès des établissements de crédit'),(99,1,NULL,'1663','sur avances reçues de l’État'),(100,1,NULL,'1664','sur avances reçues et comptes courants bloqués'),(101,1,NULL,'1665','sur dépôts et cautionnements reçus'),(102,1,NULL,'1667','sur avances assorties de conditions particulières'),(103,1,NULL,'1668','sur autres emprunts et dettes'),(104,1,NULL,'167','Avances assorties de conditions particulières'),(105,1,NULL,'1671','Avances assorties de conditions particulièresAvances bloquées pour augmentation du capital'),(106,1,NULL,'1672','Avances conditionnées par l’État'),(107,1,NULL,'1673','Avances conditionnées par les autres organismes africains'),(108,1,NULL,'1674','Avances conditionnées par les organismes internationaux'),(109,1,NULL,'1676','Droits du concédant exigibles en nature'),(110,1,NULL,'168','Autres emprunts et dettes'),(111,1,NULL,'1681','Rentes viagères capitalisées'),(112,1,NULL,'1682','Billets de fonds'),(113,1,NULL,'1683','Dettes consécutives à des titres empruntés'),(114,1,NULL,'1684','Dettes du concédant exigibles en nature'),(115,1,NULL,'1685','Emprunts participatifs'),(116,1,NULL,'1686','Participation des travailleurs aux bénéfices'),(117,1,NULL,'17','Dettes de crédit ‐ bail et contrats assimilés'),(118,1,NULL,'172','Emprunts équivalents de crédit - bail immobilier'),(119,1,NULL,'173','Emprunts équivalents de crédit - bail mobilier'),(120,1,NULL,'176','Intérêts courus'),(121,1,NULL,'1762','sur emprunts équivalents de crédit - bail immobilier'),(122,1,NULL,'1763','sur emprunts équivalents de crédit - bail mobilier'),(123,1,NULL,'1768','sur emprunts équivalents d’autres contrats'),(124,1,NULL,'178','Emprunts équivalents d’autres contrats'),(125,1,NULL,'18','Dettes liées à des participations et comptes de liaison des établissements et sociétés en participation'),(126,1,NULL,'181','Dettes liées à des participations'),(127,1,NULL,'1811','Dettes liées à des participations (groupe)'),(128,1,NULL,'1812','Dettes liées à des participations (hors groupe)'),(129,1,NULL,'182','Dettes liées à des sociétés en participation'),(130,1,NULL,'183','Intérêts courus sur dettes liées à des participations'),(131,1,NULL,'184','Comptes permanents bloqués des établissements et succursales'),(132,1,NULL,'185','Comptes permanents non bloqués des établissements et succursales'),(133,1,NULL,'186','Comptes de liaison charges'),(134,1,NULL,'187','Comptes de liaison produits'),(135,1,NULL,'188','Comptes de liaison des sociétés en participation'),(136,1,NULL,'19','Provisions financières pour risques et charges'),(137,1,NULL,'191','Provisions pour litiges'),(138,1,NULL,'192','Provisions pour garanties données aux clients'),(139,1,NULL,'193','Provisions pour pertes sur marchés à achèvement futur'),(140,1,NULL,'194','Provisions pour pertes de change'),(141,1,NULL,'196','Provisions pour pensions et obligations similaires'),(142,1,NULL,'1971','Provisions pour grosses réparations'),(143,1,NULL,'198','Autres provisions financières pour risques et charges'),(144,1,NULL,'1981','Provisions pour amendes et pénalités'),(145,1,NULL,'1982','Provisions pour renouvellement des immobilisations (entreprises concessionnaires)'),(146,1,NULL,'1983','Provisions de propre assureur'),(147,1,NULL,'1988','Autres provisions financières pour risques et charges'),(148,1,NULL,'20','Charges immobilisées'),(149,1,NULL,'201','Frais d’établissement'),(150,1,NULL,'2011','Frais de constitution'),(151,1,NULL,'2012','Frais de prospection'),(152,1,NULL,'2013','Frais de publicité et de lancement'),(153,2,NULL,'10','Capital'),(154,2,NULL,'100','Capital souscrit'),(155,2,NULL,'101','Capital non appelé'),(156,2,NULL,'11','Primes d’émission'),(157,2,NULL,'12','Plus-values et réévaluation'),(158,2,NULL,'120','Plus-values et réévaluation sur immobilisations incorporelles'),(159,2,NULL,'121','Plus-values et réévaluation sur immobilisations corporelles'),(160,2,NULL,'122','Plus-values et réévaluation sur immobilisations financières'),(161,2,NULL,'123','Plus-values et réévaluation sur immobilisations sur stocks'),(162,2,NULL,'124','Reprises de réduction de valeurs sur placements de trésorerie'),(163,2,NULL,'13','Réserves'),(164,2,NULL,'130','Réserves légales'),(165,2,NULL,'131','Réserves indisponibles'),(166,2,NULL,'1310','Réserves pour actions propres'),(167,2,NULL,'1311','Autres réserves indisponibles'),(168,2,NULL,'132','Réserves immunisées'),(169,2,NULL,'133','Réserves disponibles'),(170,2,NULL,'14','Bénéfice reporté ou perte reportée'),(171,2,NULL,'140','Bénéfice reporté'),(172,2,NULL,'141','Perte reportée'),(173,2,NULL,'15','Subsides en capital'),(174,2,NULL,'16','Provisions et impôts différés'),(175,2,NULL,'160','Provisions pour pensions et obligations similaires'),(176,1,NULL,'70','Ventes'),(177,1,NULL,'701','Ventes de marchandises'),(178,2,NULL,'700 à 707','ventes et prestations de services'),(179,1,NULL,'705','Travaux facturés'),(181,1,NULL,'602','Achats de matières premières et fournitures liées'),(182,2,NULL,'600','Achats de matières premières'),(183,1,NULL,'6052','Fournitures non stockables - Électricité'),(184,2,NULL,'602','Achats de services, travaux et études');
/*!40000 ALTER TABLE `compte_comptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte_comptable_par_action_comptable`
--

DROP TABLE IF EXISTS `compte_comptable_par_action_comptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conditions_de_reglements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2B7D750DFF7747B4` (`titre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions_de_reglements`
--

LOCK TABLES `conditions_de_reglements` WRITE;
/*!40000 ALTER TABLE `conditions_de_reglements` DISABLE KEYS */;
INSERT INTO `conditions_de_reglements` VALUES (6,'120 jours'),(1,'15 jours'),(2,'30 jours'),(3,'45 jours'),(4,'60 jours'),(5,'90 jours'),(7,'à la commande'),(8,'à la réception');
/*!40000 ALTER TABLE `conditions_de_reglements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordonnee_banque_societe`
--

DROP TABLE IF EXISTS `coordonnee_banque_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `coordonnee_banque_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coordonnee_banque_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `coordonnees_banque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banque` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `rib` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `montantDeLencours` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6F3F5C38BFB7B5B6` (`rib`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordonnees_banque`
--

LOCK TABLES `coordonnees_banque` WRITE;
/*!40000 ALTER TABLE `coordonnees_banque` DISABLE KEYS */;
INSERT INTO `coordonnees_banque` VALUES (2,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `coordonnees_banque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depense`
--

DROP TABLE IF EXISTS `depense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `depense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fournisseur_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `referencePiece` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `commentaire` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `scanPiece` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_de_documents_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `entite_id` int(11) DEFAULT NULL,
  `conditions_de_reglements_id` int(11) DEFAULT NULL,
  `mode_de_paiement_id` int(11) DEFAULT NULL,
  `reference` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `montant_ht` double NOT NULL,
  `montant_ttc` double NOT NULL,
  `reste` double NOT NULL,
  `tva` double NOT NULL,
  `objet` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modified_at` datetime NOT NULL,
  `dateDeLivraison` datetime NOT NULL,
  `dureeDeValidite` int(11) NOT NULL,
  `commentaire` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,1,3,1,3,NULL,'F-20181219-1','2018-12-19 17:24:03',0,0,0,0,'joli facture 15','2018-12-19 19:14:51','2018-12-19 17:24:03',10,'joli com',NULL),(2,1,3,1,4,NULL,'F-20181219-2','2018-12-19 17:26:24',0,0,0,0,'belle facture de la mort qui tue qui est baleze','2018-12-19 19:59:11','2018-12-19 17:26:24',15,'salut',NULL);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entite`
--

DROP TABLE IF EXISTS `entite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `civilite_id` int(11) DEFAULT NULL,
  `forme_juridique_id` int(11) DEFAULT NULL,
  `coordonnees_banque_id` int(11) DEFAULT NULL,
  `adresse_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenoms` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `raisonSociale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `siteWeb` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fonction` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entite`
--

LOCK TABLES `entite` WRITE;
/*!40000 ALTER TABLE `entite` DISABLE KEYS */;
INSERT INTO `entite` VALUES (1,NULL,2,2,5,3,NULL,NULL,NULL,'BCEAO',NULL,NULL);
/*!40000 ALTER TABLE `entite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entite_classification_article`
--

DROP TABLE IF EXISTS `entite_classification_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `famille_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societe_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `forme_juridique` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_15992E62B36786B` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forme_juridique`
--

LOCK TABLES `forme_juridique` WRITE;
/*!40000 ALTER TABLE `forme_juridique` DISABLE KEYS */;
INSERT INTO `forme_juridique` VALUES (4,'Individuel'),(1,'SA'),(2,'SARL'),(3,'USARL');
/*!40000 ALTER TABLE `forme_juridique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `information_administrative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societe_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ligne_facture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tva_id` int(11) DEFAULT NULL,
  `unite_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `reference` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prixUnitaire` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prixAchatHt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mode_de_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `monnaie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tauxAuDollar` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B3A6E2E661587F41` (`iso`),
  UNIQUE KEY `UNIQ_B3A6E2E6A4D60759` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monnaie`
--

LOCK TABLES `monnaie` WRITE;
/*!40000 ALTER TABLE `monnaie` DISABLE KEYS */;
INSERT INTO `monnaie` VALUES (1,'ARM',NULL,'Argentine Peso (1881?1970)',NULL),(2,'ARL',NULL,'Argentine Peso Ley (1970?1983)',NULL),(3,'BOL',NULL,'Bolivian Boliviano (1863?1963)',NULL),(4,'BAN',NULL,'Bosnia-Herzegovina New Dinar (1994?1997)',NULL),(5,'BRZ',NULL,'Brazilian Cruzeiro (1942?1967)',NULL),(6,'BGO',NULL,'Bulgarian Lev (1879?1952)',NULL),(7,'BGM',NULL,'Bulgarian Socialist Lev',NULL),(8,'CLE',NULL,'Chilean Escudo',NULL),(9,'CNX',NULL,'Chinese People?s Bank Dollar',NULL),(10,'ISJ',NULL,'Icelandic Króna (1918?1981)',NULL),(11,'ILR',NULL,'Israeli Shekel (1980?1985)',NULL),(12,'MKN',NULL,'Macedonian Denar (1992?1993)',NULL),(13,'MVP',NULL,'Maldivian Rupee (1947?1981)',NULL),(14,'MDC',NULL,'Moldovan Cupon',NULL),(15,'MCF',NULL,'Monegasque Franc',NULL),(16,'KRH',NULL,'South Korean Hwan (1953?1962)',NULL),(17,'KRO',NULL,'South Korean Won (1945?1953)',NULL),(18,'VNN',NULL,'Vietnamese Dong (1978?1985)',NULL),(19,'YUR',NULL,'Yugoslavian Reformed Dinar (1992?1993)',NULL),(20,'AFA',NULL,'afghani (1927?2002)',NULL),(21,'AFN',NULL,'afghani afghan',NULL),(22,'ROL',NULL,'ancien leu roumain',NULL),(23,'MGA',NULL,'ariary malgache',NULL),(24,'ARA',NULL,'austral argentin',NULL),(25,'THB',NULL,'baht thaïlandais',NULL),(26,'PAB',NULL,'balboa panaméen',NULL),(27,'ETB',NULL,'birr éthiopien',NULL),(28,'VEF',NULL,'bolivar vénézuélien',NULL),(29,'VEB',NULL,'bolivar vénézuélien (1871?2008)',NULL),(30,'BOB',NULL,'boliviano bolivien',NULL),(31,'CRC',NULL,'colón costaricain',NULL),(32,'SVC',NULL,'colón salvadorien',NULL),(33,'NIC',NULL,'cordoba',NULL),(34,'GEK',NULL,'coupon de lari géorgien',NULL),(35,'DKK',NULL,'couronne danoise',NULL),(36,'EEK',NULL,'couronne estonienne',NULL),(37,'CSK',NULL,'couronne forte tchécoslovaque',NULL),(38,'ISK',NULL,'couronne islandaise',NULL),(39,'NOK',NULL,'couronne norvégienne',NULL),(40,'SKK',NULL,'couronne slovaque',NULL),(41,'SEK',NULL,'couronne suédoise',NULL),(42,'CZK',NULL,'couronne tchèque',NULL),(43,'BRC',NULL,'cruzado brésilien (1986?1989)',NULL),(44,'BRR',NULL,'cruzeiro',NULL),(45,'BRE',NULL,'cruzeiro brésilien (1990?1993)',NULL),(46,'GHC',NULL,'cédi',NULL),(47,'GHS',NULL,'cédi ghanéen',NULL),(48,'NIO',NULL,'córdoba oro nicaraguayen',NULL),(49,'GMD',NULL,'dalasi gambien',NULL),(50,'MKD',NULL,'denar macédonien',NULL),(51,'DZD',NULL,'dinar algérien',NULL),(52,'BHD',NULL,'dinar bahreïni',NULL),(53,'BAD',NULL,'dinar bosniaque',NULL),(54,'HRD',NULL,'dinar croate',NULL),(55,'YDD',NULL,'dinar du Yémen',NULL),(56,'IQD',NULL,'dinar irakien',NULL),(57,'JOD',NULL,'dinar jordanien',NULL),(58,'KWD',NULL,'dinar koweïtien',NULL),(59,'LYD',NULL,'dinar libyen',NULL),(60,'RSD',NULL,'dinar serbe',NULL),(61,'CSD',NULL,'dinar serbo-monténégrin',NULL),(62,'SDD',NULL,'dinar soudanais',NULL),(63,'TND',NULL,'dinar tunisien',NULL),(64,'YUM',NULL,'dinar yougoslave Noviy',NULL),(65,'YUN',NULL,'dinar yougoslave convertible',NULL),(66,'AED',NULL,'dirham des Émirats arabes unis',NULL),(67,'MAD',NULL,'dirham marocain',NULL),(68,'STD',NULL,'dobra santoméen',NULL),(69,'AUD',NULL,'dollar australien',NULL),(70,'BSD',NULL,'dollar bahaméen',NULL),(71,'BBD',NULL,'dollar barbadien',NULL),(72,'BMD',NULL,'dollar bermudien',NULL),(73,'BND',NULL,'dollar brunéien',NULL),(74,'BZD',NULL,'dollar bélizéen',NULL),(75,'CAD',NULL,'dollar canadien',NULL),(76,'HKD',NULL,'dollar de Hong Kong',NULL),(77,'SGD',NULL,'dollar de Singapour',NULL),(78,'XCD',NULL,'dollar des Caraïbes orientales',NULL),(79,'USS',NULL,'dollar des Etats-Unis (jour même)',NULL),(80,'USN',NULL,'dollar des Etats-Unis (jour suivant)',NULL),(81,'USD',NULL,'dollar des États-Unis',NULL),(82,'KYD',NULL,'dollar des îles Caïmans',NULL),(83,'SBD',NULL,'dollar des îles Salomon',NULL),(84,'GYD',NULL,'dollar du Guyana',NULL),(85,'FJD',NULL,'dollar fidjien',NULL),(86,'JMD',NULL,'dollar jamaïcain',NULL),(87,'LRD',NULL,'dollar libérien',NULL),(88,'NAD',NULL,'dollar namibien',NULL),(89,'NZD',NULL,'dollar néo-zélandais',NULL),(90,'RHD',NULL,'dollar rhodésien',NULL),(91,'SRD',NULL,'dollar surinamais',NULL),(92,'TTD',NULL,'dollar trinidadien',NULL),(93,'ZWD',NULL,'dollar zimbabwéen',NULL),(94,'ZWR',NULL,'dollar zimbabwéen (2008)',NULL),(95,'ZWL',NULL,'dollar zimbabwéen (2009)',NULL),(96,'GRD',NULL,'drachme grecque',NULL),(97,'AMD',NULL,'dram arménien',NULL),(98,'VND',NULL,'dông vietnamien',NULL),(99,'GQE',NULL,'ekwélé équatoguinéen',NULL),(100,'CVE',NULL,'escudo capverdien',NULL),(101,'GWE',NULL,'escudo de Guinée portugaise',NULL),(102,'MZE',NULL,'escudo mozambicain',NULL),(103,'PTE',NULL,'escudo portugais',NULL),(104,'TPE',NULL,'escudo timorais',NULL),(105,'EUR',NULL,'euro',NULL),(106,'CHE',NULL,'euro WIR',NULL),(107,'ANG',NULL,'florin antillais',NULL),(108,'AWG',NULL,'florin arubais',NULL),(109,'NLG',NULL,'florin néerlandais',NULL),(110,'SRG',NULL,'florin surinamais',NULL),(111,'HUF',NULL,'forint hongrois',NULL),(112,'XOF',NULL,'franc CFA (BCEAO)',NULL),(113,'XAF',NULL,'franc CFA (BEAC)',NULL),(114,'XPF',NULL,'franc CFP',NULL),(115,'XFU',NULL,'franc UIC',NULL),(116,'CHW',NULL,'franc WIR',NULL),(117,'BEF',NULL,'franc belge',NULL),(118,'BEC',NULL,'franc belge (convertible)',NULL),(119,'BEL',NULL,'franc belge (financier)',NULL),(120,'BIF',NULL,'franc burundais',NULL),(121,'KMF',NULL,'franc comorien',NULL),(122,'CDF',NULL,'franc congolais',NULL),(123,'LUC',NULL,'franc convertible luxembourgeois',NULL),(124,'DJF',NULL,'franc djiboutien',NULL),(125,'LUL',NULL,'franc financier luxembourgeois',NULL),(126,'FRF',NULL,'franc français',NULL),(127,'GNF',NULL,'franc guinéen',NULL),(128,'LUF',NULL,'franc luxembourgeois',NULL),(129,'MGF',NULL,'franc malgache',NULL),(130,'MLF',NULL,'franc malien',NULL),(131,'MAF',NULL,'franc marocain',NULL),(132,'XFO',NULL,'franc or',NULL),(133,'RWF',NULL,'franc rwandais',NULL),(134,'CHF',NULL,'franc suisse',NULL),(135,'HTG',NULL,'gourde haïtienne',NULL),(136,'PYG',NULL,'guaraní paraguayen',NULL),(137,'UAH',NULL,'hryvnia ukrainienne',NULL),(138,'PEI',NULL,'inti péruvien',NULL),(139,'UAK',NULL,'karbovanetz',NULL),(140,'PGK',NULL,'kina papouan-néo-guinéen',NULL),(141,'LAK',NULL,'kip loatien',NULL),(142,'HRK',NULL,'kuna croate',NULL),(143,'MWK',NULL,'kwacha malawite',NULL),(144,'ZMW',NULL,'kwacha zambien',NULL),(145,'ZMK',NULL,'kwacha zambien (1968?2012)',NULL),(146,'AOA',NULL,'kwanza angolais',NULL),(147,'AOK',NULL,'kwanza angolais (1977?1990)',NULL),(148,'AOR',NULL,'kwanza angolais réajusté (1995?1999)',NULL),(149,'BUK',NULL,'kyat birman',NULL),(150,'MMK',NULL,'kyat myanmarais',NULL),(151,'GEL',NULL,'lari géorgien',NULL),(152,'LVL',NULL,'lats letton',NULL),(153,'ALL',NULL,'lek albanais',NULL),(154,'ALK',NULL,'lek albanais (1947?1961)',NULL),(155,'HNL',NULL,'lempira hondurien',NULL),(156,'SLL',NULL,'leone sierra-léonais',NULL),(157,'MDL',NULL,'leu moldave',NULL),(158,'RON',NULL,'leu roumain',NULL),(159,'BGN',NULL,'lev bulgare',NULL),(160,'BGL',NULL,'lev bulgare (1962?1999)',NULL),(161,'SZL',NULL,'lilangeni swazi',NULL),(162,'ITL',NULL,'lire italienne',NULL),(163,'MTL',NULL,'lire maltaise',NULL),(164,'LTL',NULL,'litas lituanien',NULL),(165,'CYP',NULL,'livre chypriote',NULL),(166,'GIP',NULL,'livre de Gibraltar',NULL),(167,'SHP',NULL,'livre de Sainte-Hélène',NULL),(168,'FKP',NULL,'livre des îles Malouines',NULL),(169,'IEP',NULL,'livre irlandaise',NULL),(170,'ILP',NULL,'livre israélienne',NULL),(171,'LBP',NULL,'livre libanaise',NULL),(172,'MTP',NULL,'livre maltaise',NULL),(173,'SDG',NULL,'livre soudanaise',NULL),(174,'SDP',NULL,'livre soudanaise (1956?2007)',NULL),(175,'GBP',NULL,'livre sterling',NULL),(176,'SSP',NULL,'livre sud-soudanaise',NULL),(177,'SYP',NULL,'livre syrienne',NULL),(178,'TRY',NULL,'livre turque',NULL),(179,'TRL',NULL,'livre turque (1844?2005)',NULL),(180,'EGP',NULL,'livre égyptienne',NULL),(181,'LSL',NULL,'loti lesothan',NULL),(182,'AZN',NULL,'manat azéri',NULL),(183,'AZM',NULL,'manat azéri (1993?2006)',NULL),(184,'TMM',NULL,'manat turkmène',NULL),(185,'DEM',NULL,'mark allemand',NULL),(186,'BAM',NULL,'mark convertible bosniaque',NULL),(187,'DDM',NULL,'mark est-allemand',NULL),(188,'FIM',NULL,'mark finlandais',NULL),(189,'MZN',NULL,'metical mozambicain',NULL),(190,'BOV',NULL,'mvdol bolivien',NULL),(191,'MZM',NULL,'métical',NULL),(192,'ERN',NULL,'nafka érythréen',NULL),(193,'NGN',NULL,'naira nigérian',NULL),(194,'BTN',NULL,'ngultrum bouthanais',NULL),(195,'BRN',NULL,'nouveau cruzado',NULL),(196,'BRB',NULL,'nouveau cruzeiro brésilien (1967?1986)',NULL),(197,'YUD',NULL,'nouveau dinar yougoslave',NULL),(198,'TWD',NULL,'nouveau dollar taïwanais',NULL),(199,'AON',NULL,'nouveau kwanza angolais (1990?2000)',NULL),(200,'TMT',NULL,'nouveau manat turkmène',NULL),(201,'BYB',NULL,'nouveau rouble biélorusse (1994?1999)',NULL),(202,'ILS',NULL,'nouveau shekel israélien',NULL),(203,'ZRN',NULL,'nouveau zaïre zaïrien',NULL),(204,'MRO',NULL,'ouguiya mauritanien',NULL),(205,'MOP',NULL,'pataca macanaise',NULL),(206,'TOP',NULL,'pa?anga tongan',NULL),(207,'ADP',NULL,'peseta andorrane',NULL),(208,'ESP',NULL,'peseta espagnole',NULL),(209,'ESA',NULL,'peseta espagnole (compte A)',NULL),(210,'ESB',NULL,'peseta espagnole (compte convertible)',NULL),(211,'ARS',NULL,'peso argentin',NULL),(212,'ARP',NULL,'peso argentin (1983?1985)',NULL),(213,'GWP',NULL,'peso bissau-guinéen',NULL),(214,'BOP',NULL,'peso bolivien',NULL),(215,'CLP',NULL,'peso chilien',NULL),(216,'COP',NULL,'peso colombien',NULL),(217,'CUP',NULL,'peso cubain',NULL),(218,'CUC',NULL,'peso cubain convertible',NULL),(219,'DOP',NULL,'peso dominicain',NULL),(220,'MXP',NULL,'peso d?argent mexicain (1861?1992)',NULL),(221,'MXN',NULL,'peso mexicain',NULL),(222,'PHP',NULL,'peso philippin',NULL),(223,'UYU',NULL,'peso uruguayen',NULL),(224,'UYP',NULL,'peso uruguayen (1975?1993)',NULL),(225,'UYI',NULL,'peso uruguayen (unités indexées)',NULL),(226,'BWP',NULL,'pula botswanais',NULL),(227,'GTQ',NULL,'quetzal guatémaltèque',NULL),(228,'ZAR',NULL,'rand sud-africain',NULL),(229,'ZAL',NULL,'rand sud-africain (financier)',NULL),(230,'IRR',NULL,'rial iranien',NULL),(231,'OMR',NULL,'rial omanais',NULL),(232,'QAR',NULL,'rial qatari',NULL),(233,'SAR',NULL,'rial saoudien',NULL),(234,'YER',NULL,'rial yéménite',NULL),(235,'KHR',NULL,'riel cambodgien',NULL),(236,'MYR',NULL,'ringgit malais',NULL),(237,'BYN',NULL,'rouble biélorusse',NULL),(238,'BYR',NULL,'rouble biélorusse (2000?2016)',NULL),(239,'LVR',NULL,'rouble letton',NULL),(240,'RUB',NULL,'rouble russe',NULL),(241,'RUR',NULL,'rouble russe (1991?1998)',NULL),(242,'SUR',NULL,'rouble soviétique',NULL),(243,'TJR',NULL,'rouble tadjik',NULL),(244,'SCR',NULL,'roupie des Seychelles',NULL),(245,'INR',NULL,'roupie indienne',NULL),(246,'IDR',NULL,'roupie indonésienne',NULL),(247,'MUR',NULL,'roupie mauricienne',NULL),(248,'NPR',NULL,'roupie népalaise',NULL),(249,'PKR',NULL,'roupie pakistanaise',NULL),(250,'LKR',NULL,'roupie srilankaise',NULL),(251,'MVR',NULL,'rufiyaa maldivien',NULL),(252,'BRL',NULL,'réal brésilien',NULL),(253,'ATS',NULL,'schilling autrichien',NULL),(254,'KES',NULL,'shilling kényan',NULL),(255,'UGX',NULL,'shilling ougandais',NULL),(256,'UGS',NULL,'shilling ougandais (1966?1987)',NULL),(257,'SOS',NULL,'shilling somalien',NULL),(258,'TZS',NULL,'shilling tanzanien',NULL),(259,'PEN',NULL,'sol péruvien',NULL),(260,'PES',NULL,'sol péruvien (1863?1985)',NULL),(261,'KGS',NULL,'som kirghize',NULL),(262,'TJS',NULL,'somoni tadjik',NULL),(263,'ECS',NULL,'sucre équatorien',NULL),(264,'UZS',NULL,'sum ouzbek',NULL),(265,'GNS',NULL,'syli guinéen',NULL),(266,'BDT',NULL,'taka bangladeshi',NULL),(267,'WST',NULL,'tala samoan',NULL),(268,'LTT',NULL,'talonas lituanien',NULL),(269,'KZT',NULL,'tenge kazakh',NULL),(270,'SIT',NULL,'tolar slovène',NULL),(271,'MNT',NULL,'tugrik mongol',NULL),(272,'XRE',NULL,'type de fonds RINET',NULL),(273,'XEU',NULL,'unité de compte européenne (ECU)',NULL),(274,'MXV',NULL,'unité de conversion mexicaine (UDI)',NULL),(275,'ECV',NULL,'unité de valeur constante équatoriale (UVC)',NULL),(276,'COU',NULL,'unité de valeur réelle colombienne',NULL),(277,'CLF',NULL,'unité d?investissement chilienne',NULL),(278,'VUV',NULL,'vatu vanuatuan',NULL),(279,'KPW',NULL,'won nord-coréen',NULL),(280,'KRW',NULL,'won sud-coréen',NULL),(281,'JPY',NULL,'yen japonais',NULL),(282,'CNY',NULL,'yuan renminbi chinois',NULL),(283,'ZRZ',NULL,'zaïre zaïrois',NULL),(284,'PLZ',NULL,'zloty (1950?1995)',NULL),(285,'PLN',NULL,'zloty polonais',NULL);
/*!40000 ALTER TABLE `monnaie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nature_article`
--

DROP TABLE IF EXISTS `nature_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nature_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operation_sur_compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `debit` decimal(2,0) NOT NULL,
  `credit` decimal(2,0) NOT NULL,
  `pieces_jointes` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode_de_paiement_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `montant` double NOT NULL,
  `date` datetime NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systeme_comptable_id` int(11) DEFAULT NULL,
  `iso` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_349F3CAEFF7747B4` (`titre`),
  KEY `IDX_349F3CAEE74A125A` (`systeme_comptable_id`),
  CONSTRAINT `FK_349F3CAEE74A125A` FOREIGN KEY (`systeme_comptable_id`) REFERENCES `systeme_comptable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,NULL,'AF','Afghanistan'),(2,NULL,'ZA','Afrique du Sud'),(3,NULL,'AL','Albanie'),(4,NULL,'DZ','Algérie'),(5,NULL,'DE','Allemagne'),(6,NULL,'AD','Andorre'),(7,NULL,'AO','Angola'),(8,NULL,'AI','Anguilla'),(9,NULL,'AQ','Antarctique'),(10,NULL,'AG','Antigua-et-Barbuda'),(11,NULL,'SA','Arabie saoudite'),(12,NULL,'AR','Argentine'),(13,NULL,'AM','Arménie'),(14,NULL,'AW','Aruba'),(15,NULL,'AU','Australie'),(16,NULL,'AT','Autriche'),(17,NULL,'AZ','Azerbaïdjan'),(18,NULL,'BS','Bahamas'),(19,NULL,'BH','Bahreïn'),(20,NULL,'BD','Bangladesh'),(21,NULL,'BB','Barbade'),(22,NULL,'BE','Belgique'),(23,NULL,'BZ','Belize'),(24,NULL,'BJ','Bénin'),(25,NULL,'BM','Bermudes'),(26,NULL,'BT','Bhoutan'),(27,NULL,'BY','Biélorussie'),(28,NULL,'BO','Bolivie'),(29,NULL,'BA','Bosnie-Herzégovine'),(30,NULL,'BW','Botswana'),(31,NULL,'BR','Brésil'),(32,NULL,'BN','Brunéi Darussalam'),(33,NULL,'BG','Bulgarie'),(34,NULL,'BF','Burkina Faso'),(35,NULL,'BI','Burundi'),(36,NULL,'KH','Cambodge'),(37,NULL,'CM','Cameroun'),(38,NULL,'CA','Canada'),(39,NULL,'CV','Cap-Vert'),(40,NULL,'EA','Ceuta et Melilla'),(41,NULL,'CL','Chili'),(42,NULL,'CN','Chine'),(43,NULL,'CY','Chypre'),(44,NULL,'CO','Colombie'),(45,NULL,'KM','Comores'),(46,NULL,'CG','Congo-Brazzaville'),(47,NULL,'CD','Congo-Kinshasa'),(48,NULL,'KP','Corée du Nord'),(49,NULL,'KR','Corée du Sud'),(50,NULL,'CR','Costa Rica'),(51,NULL,'CI','Côte d?Ivoire'),(52,NULL,'HR','Croatie'),(53,NULL,'CU','Cuba'),(54,NULL,'CW','Curaçao'),(55,NULL,'DK','Danemark'),(56,NULL,'DG','Diego Garcia'),(57,NULL,'DJ','Djibouti'),(58,NULL,'DM','Dominique'),(59,NULL,'EG','Égypte'),(60,NULL,'SV','El Salvador'),(61,NULL,'AE','Émirats arabes unis'),(62,NULL,'EC','Équateur'),(63,NULL,'ER','Érythrée'),(64,NULL,'ES','Espagne'),(65,NULL,'EE','Estonie'),(66,NULL,'VA','État de la Cité du Vatican'),(67,NULL,'FM','États fédérés de Micronésie'),(68,NULL,'US','États-Unis'),(69,NULL,'ET','Éthiopie'),(70,NULL,'EZ','Eurozone'),(71,NULL,'FJ','Fidji'),(72,NULL,'FI','Finlande'),(73,NULL,'FR','France'),(74,NULL,'GA','Gabon'),(75,NULL,'GM','Gambie'),(76,NULL,'GE','Géorgie'),(77,NULL,'GS','Géorgie du Sud et îles Sandwich du Sud'),(78,NULL,'GH','Ghana'),(79,NULL,'GI','Gibraltar'),(80,NULL,'GR','Grèce'),(81,NULL,'GD','Grenade'),(82,NULL,'GL','Groenland'),(83,NULL,'GP','Guadeloupe'),(84,NULL,'GU','Guam'),(85,NULL,'GT','Guatemala'),(86,NULL,'GG','Guernesey'),(87,NULL,'GN','Guinée'),(88,NULL,'GQ','Guinée équatoriale'),(89,NULL,'GW','Guinée-Bissau'),(90,NULL,'GY','Guyana'),(91,NULL,'GF','Guyane française'),(92,NULL,'HT','Haïti'),(93,NULL,'HN','Honduras'),(94,NULL,'HU','Hongrie'),(95,NULL,'CX','Île Christmas'),(96,NULL,'AC','Île de l?Ascension'),(97,NULL,'IM','Île de Man'),(98,NULL,'NF','Île Norfolk'),(99,NULL,'AX','Îles Åland'),(100,NULL,'KY','Îles Caïmans'),(101,NULL,'IC','Îles Canaries'),(102,NULL,'CC','Îles Cocos'),(103,NULL,'CK','Îles Cook'),(104,NULL,'FO','Îles Féroé'),(105,NULL,'FK','Îles Malouines'),(106,NULL,'MP','Îles Mariannes du Nord'),(107,NULL,'MH','Îles Marshall'),(108,NULL,'UM','Îles mineures éloignées des États-Unis'),(109,NULL,'PN','Îles Pitcairn'),(110,NULL,'SB','Îles Salomon'),(111,NULL,'TC','Îles Turques-et-Caïques'),(112,NULL,'VG','Îles Vierges britanniques'),(113,NULL,'VI','Îles Vierges des États-Unis'),(114,NULL,'IN','Inde'),(115,NULL,'ID','Indonésie'),(116,NULL,'IQ','Irak'),(117,NULL,'IR','Iran'),(118,NULL,'IE','Irlande'),(119,NULL,'IS','Islande'),(120,NULL,'IL','Israël'),(121,NULL,'IT','Italie'),(122,NULL,'JM','Jamaïque'),(123,NULL,'JP','Japon'),(124,NULL,'JE','Jersey'),(125,NULL,'JO','Jordanie'),(126,NULL,'KZ','Kazakhstan'),(127,NULL,'KE','Kenya'),(128,NULL,'KG','Kirghizistan'),(129,NULL,'KI','Kiribati'),(130,NULL,'XK','Kosovo'),(131,NULL,'KW','Koweït'),(132,NULL,'RE','La Réunion'),(133,NULL,'LA','Laos'),(134,NULL,'LS','Lesotho'),(135,NULL,'LV','Lettonie'),(136,NULL,'LB','Liban'),(137,NULL,'LR','Libéria'),(138,NULL,'LY','Libye'),(139,NULL,'LI','Liechtenstein'),(140,NULL,'LT','Lituanie'),(141,NULL,'LU','Luxembourg'),(142,NULL,'MK','Macédoine'),(143,NULL,'MG','Madagascar'),(144,NULL,'MY','Malaisie'),(145,NULL,'MW','Malawi'),(146,NULL,'MV','Maldives'),(147,NULL,'ML','Mali'),(148,NULL,'MT','Malte'),(149,NULL,'MA','Maroc'),(150,NULL,'MQ','Martinique'),(151,NULL,'MU','Maurice'),(152,NULL,'MR','Mauritanie'),(153,NULL,'YT','Mayotte'),(154,NULL,'MX','Mexique'),(155,NULL,'MD','Moldavie'),(156,NULL,'MC','Monaco'),(157,NULL,'MN','Mongolie'),(158,NULL,'ME','Monténégro'),(159,NULL,'MS','Montserrat'),(160,NULL,'MZ','Mozambique'),(161,NULL,'MM','Myanmar (Birmanie)'),(162,NULL,'NA','Namibie'),(163,NULL,'UN','Nations Unies'),(164,NULL,'NR','Nauru'),(165,NULL,'NP','Népal'),(166,NULL,'NI','Nicaragua'),(167,NULL,'NE','Niger'),(168,NULL,'NG','Nigéria'),(169,NULL,'NU','Niue'),(170,NULL,'NO','Norvège'),(171,NULL,'NC','Nouvelle-Calédonie'),(172,NULL,'NZ','Nouvelle-Zélande'),(173,NULL,'OM','Oman'),(174,NULL,'UG','Ouganda'),(175,NULL,'UZ','Ouzbékistan'),(176,NULL,'PK','Pakistan'),(177,NULL,'PW','Palaos'),(178,NULL,'PA','Panama'),(179,NULL,'PG','Papouasie-Nouvelle-Guinée'),(180,NULL,'PY','Paraguay'),(181,NULL,'NL','Pays-Bas'),(182,NULL,'BQ','Pays-Bas caribéens'),(183,NULL,'PE','Pérou'),(184,NULL,'PH','Philippines'),(185,NULL,'PL','Pologne'),(186,NULL,'PF','Polynésie française'),(187,NULL,'PR','Porto Rico'),(188,NULL,'PT','Portugal'),(189,NULL,'QA','Qatar'),(190,NULL,'HK','R.A.S. chinoise de Hong Kong'),(191,NULL,'MO','R.A.S. chinoise de Macao'),(192,NULL,'CF','République centrafricaine'),(193,NULL,'DO','République dominicaine'),(194,NULL,'RO','Roumanie'),(195,NULL,'GB','Royaume-Uni'),(196,NULL,'RU','Russie'),(197,NULL,'RW','Rwanda'),(198,NULL,'EH','Sahara occidental'),(199,NULL,'BL','Saint-Barthélemy'),(200,NULL,'KN','Saint-Christophe-et-Niévès'),(201,NULL,'SM','Saint-Marin'),(202,NULL,'MF','Saint-Martin'),(203,NULL,'SX','Saint-Martin (partie néerlandaise)'),(204,NULL,'PM','Saint-Pierre-et-Miquelon'),(205,NULL,'VC','Saint-Vincent-et-les-Grenadines'),(206,NULL,'SH','Sainte-Hélène'),(207,NULL,'LC','Sainte-Lucie'),(208,NULL,'WS','Samoa'),(209,NULL,'AS','Samoa américaines'),(210,NULL,'ST','Sao Tomé-et-Principe'),(211,NULL,'SN','Sénégal'),(212,NULL,'RS','Serbie'),(213,NULL,'SC','Seychelles'),(214,NULL,'SL','Sierra Leone'),(215,NULL,'SG','Singapour'),(216,NULL,'SK','Slovaquie'),(217,NULL,'SI','Slovénie'),(218,NULL,'SO','Somalie'),(219,NULL,'SD','Soudan'),(220,NULL,'SS','Soudan du Sud'),(221,NULL,'LK','Sri Lanka'),(222,NULL,'SE','Suède'),(223,NULL,'CH','Suisse'),(224,NULL,'SR','Suriname'),(225,NULL,'SJ','Svalbard et Jan Mayen'),(226,NULL,'SZ','Swaziland'),(227,NULL,'SY','Syrie'),(228,NULL,'TJ','Tadjikistan'),(229,NULL,'TW','Taïwan'),(230,NULL,'TZ','Tanzanie'),(231,NULL,'TD','Tchad'),(232,NULL,'CZ','Tchéquie'),(233,NULL,'TF','Terres australes françaises'),(234,NULL,'IO','Territoire britannique de l?océan Indien'),(235,NULL,'PS','Territoires palestiniens'),(236,NULL,'TH','Thaïlande'),(237,NULL,'TL','Timor oriental'),(238,NULL,'TG','Togo'),(239,NULL,'TK','Tokélaou'),(240,NULL,'TO','Tonga'),(241,NULL,'TT','Trinité-et-Tobago'),(242,NULL,'TA','Tristan da Cunha'),(243,NULL,'TN','Tunisie'),(244,NULL,'TM','Turkménistan'),(245,NULL,'TR','Turquie'),(246,NULL,'TV','Tuvalu'),(247,NULL,'UA','Ukraine'),(248,NULL,'UY','Uruguay'),(249,NULL,'VU','Vanuatu'),(250,NULL,'VE','Venezuela'),(251,NULL,'VN','Vietnam'),(252,NULL,'WF','Wallis-et-Futuna'),(253,NULL,'YE','Yémen'),(254,NULL,'ZM','Zambie'),(255,NULL,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reglement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depense_id` int(11) NOT NULL,
  `mode_de_paiement_id` int(11) DEFAULT NULL,
  `montant` double NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `secteur_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secteur_activite`
--

LOCK TABLES `secteur_activite` WRITE;
/*!40000 ALTER TABLE `secteur_activite` DISABLE KEYS */;
INSERT INTO `secteur_activite` VALUES (1,'Agroalimentaire'),(2,'Banque / Assurance'),(3,'Bois / Papier / Carton / Imprimerie'),(4,'BTP / Matériaux de construction'),(5,'Chimie / Parachimie'),(6,'Commerce / Négoce / Distribution'),(7,'Edition / Communication / Multimedia'),(8,'Electronique / Electricité'),(9,'Etudes et conseils'),(10,'Industrie pharmaceutique'),(11,'Informatique et Telecoms'),(12,'Machines et équipements / Automobile'),(13,'Métallurgie / Travail du métal'),(14,'Plastique / Caoutchouc'),(15,'Services aux entreprises'),(16,'Textile / Habillement / Chaussure'),(17,'Transport / Logistique');
/*!40000 ALTER TABLE `secteur_activite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `societe`
--

DROP TABLE IF EXISTS `societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systeme_comptable_id` int(11) DEFAULT NULL,
  `forme_juridique_id` int(11) DEFAULT NULL,
  `secteur_activite_id` int(11) DEFAULT NULL,
  `monnaie_id` int(11) DEFAULT NULL,
  `pays_id` int(11) DEFAULT NULL,
  `raisonSociale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permalien` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `capital_social` int(11) DEFAULT NULL,
  `dateDeCreation` datetime NOT NULL,
  `activitePrincipale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_19653DBDE48E9A13` (`logo`),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `societe`
--

LOCK TABLES `societe` WRITE;
/*!40000 ALTER TABLE `societe` DISABLE KEYS */;
INSERT INTO `societe` VALUES (1,1,2,11,112,51,'SYKAMAH','sykamah',10000000,'2018-07-01 00:00:00','Développement web',NULL),(2,1,1,11,112,51,'Elikett','elikett',1000000,'2013-01-01 00:00:00','Sites',NULL),(3,2,2,11,105,22,'web','web',5000,'2013-01-01 00:00:00','developpement','5c1d1faa220a80.56709430.png');
/*!40000 ALTER TABLE `societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systeme_comptable`
--

DROP TABLE IF EXISTS `systeme_comptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `systeme_comptable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69EEE1DBA4D60759` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systeme_comptable`
--

LOCK TABLES `systeme_comptable` WRITE;
/*!40000 ALTER TABLE `systeme_comptable` DISABLE KEYS */;
INSERT INTO `systeme_comptable` VALUES (2,'Belgique'),(3,'France'),(1,'OHADA');
/*!40000 ALTER TABLE `systeme_comptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tva`
--

DROP TABLE IF EXISTS `tva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type_de_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FAE7AA84FF7747B4` (`titre`),
  UNIQUE KEY `UNIQ_FAE7AA8477153098` (`code`),
  UNIQUE KEY `UNIQ_FAE7AA8493B1868E` (`prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_de_documents`
--

LOCK TABLES `type_de_documents` WRITE;
/*!40000 ALTER TABLE `type_de_documents` DISABLE KEYS */;
INSERT INTO `type_de_documents` VALUES (1,'Facture','FACT','F'),(2,'Pro-forma','CUST_ORDER','PF'),(3,'Commande Fournisseur','SUPP_ORDER','CF'),(4,'Devis','QUOT','D'),(5,'Bon de livraison','DELV','BL'),(6,'Bon de reception','RCPT','BR'),(7,'Depenses','DEP','DP'),(8,'Apports financiers','AP_F','AF');
/*!40000 ALTER TABLE `type_de_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unite`
--

DROP TABLE IF EXISTS `unite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `unite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `nom` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `complete` tinyint(1) NOT NULL,
  `facebook_authorisation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_authorisation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenoms` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_host` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `genre` tinyint(1) DEFAULT NULL,
  `adresse` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastactiondate` datetime DEFAULT NULL,
  `usertype` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'stefann.sasori@gmail.com','stefann.sasori@gmail.com','stefann.sasori@gmail.com','stefann.sasori@gmail.com',1,'J9lEDza2bCXYKmC7UeqmxTQbh5JX.FipJzPet1Fb4X0','O5lcEks3xeBnE+drxafWW/iP+9D19CWMajXIALZ0NdY45+q4jBwzcL2nLxe1d5FCaPfFF1RcI6QAqYkMo0NyqQ==','2018-11-29 20:40:20',NULL,NULL,'a:0:{}',NULL,1,NULL,NULL,NULL,'local',NULL,NULL,NULL,NULL,'2018-11-29 20:40:30',NULL,'default.png',NULL,NULL,NULL),(2,'angemartialkoffi@gmail.com','angemartialkoffi@gmail.com','angemartialkoffi@gmail.com','angemartialkoffi@gmail.com',1,'ghdWDX1Ir2YIynLw9JixcSeORGoxWdBxJWLz0x8PFTo','bzUCkKQ2TokhiBwho57s+aUi2qYCMBuMDxAnUfgA9l8IF0mkF/piFm03NGNul2G5L/MSws2t3DCu16kC1x/v3w==','2018-12-21 18:20:24',NULL,NULL,'a:0:{}',NULL,1,NULL,NULL,NULL,'local',NULL,NULL,NULL,NULL,'2018-12-21 19:03:40',NULL,'default.png',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_parameter`
--

DROP TABLE IF EXISTS `user_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2A771CF4A76ED395` (`user_id`),
  CONSTRAINT `FK_2A771CF4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_parameter`
--

LOCK TABLES `user_parameter` WRITE;
/*!40000 ALTER TABLE `user_parameter` DISABLE KEYS */;
INSERT INTO `user_parameter` VALUES (1,1,'1','chat'),(2,1,'1','chrono'),(3,1,'1','battle'),(4,2,'1','chat'),(5,2,'1','chrono'),(6,2,'1','battle');
/*!40000 ALTER TABLE `user_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utilisateur_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_636ECA2FA76ED395` (`user_id`),
  KEY `IDX_636ECA2FFCF77503` (`societe_id`),
  CONSTRAINT `FK_636ECA2FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_636ECA2FFCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur_societe`
--

LOCK TABLES `utilisateur_societe` WRITE;
/*!40000 ALTER TABLE `utilisateur_societe` DISABLE KEYS */;
INSERT INTO `utilisateur_societe` VALUES (1,1,2),(2,2,3);
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

-- Dump completed on 2018-12-21 19:10:51
