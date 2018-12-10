-- MySQL dump 10.16  Distrib 10.1.36-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: facturation
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,3,'avenue sart paradis 55',NULL,'Wepion','5100','22444547','01024246',NULL);
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
  `adresse_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
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
  `unite_id` int(11) DEFAULT NULL,
  `nature_article_id` int(11) DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `designation` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `quantite` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prixUnitaire` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `classification_article_id` int(11) DEFAULT NULL,
  `classification_vente_id` int(11) DEFAULT NULL,
  `marge_id` int(11) DEFAULT NULL,
  `tva_id` int(11) DEFAULT NULL,
  `id_famille` int(11) NOT NULL,
  `societe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_23A0E66AEA34913` (`reference`),
  UNIQUE KEY `UNIQ_23A0E668BF24A79` (`quantite`),
  UNIQUE KEY `UNIQ_23A0E669EF3DE33` (`prixUnitaire`),
  UNIQUE KEY `UNIQ_23A0E66FB0D31D6` (`marge_id`),
  KEY `IDX_23A0E66EC4A74AB` (`unite_id`),
  KEY `IDX_23A0E669EEA350B` (`nature_article_id`),
  KEY `IDX_23A0E661C946EBC` (`classification_article_id`),
  KEY `IDX_23A0E66F851745A` (`classification_vente_id`),
  KEY `IDX_23A0E664D79775F` (`tva_id`),
  KEY `IDX_23A0E66FAEE5B63` (`id_famille`),
  KEY `IDX_23A0E66FCF77503` (`societe_id`),
  CONSTRAINT `FK_23A0E661C946EBC` FOREIGN KEY (`classification_article_id`) REFERENCES `classification_article` (`id`),
  CONSTRAINT `FK_23A0E664D79775F` FOREIGN KEY (`tva_id`) REFERENCES `tva` (`id`),
  CONSTRAINT `FK_23A0E669EEA350B` FOREIGN KEY (`nature_article_id`) REFERENCES `nature_article` (`id`),
  CONSTRAINT `FK_23A0E66EC4A74AB` FOREIGN KEY (`unite_id`) REFERENCES `unite` (`id`),
  CONSTRAINT `FK_23A0E66F851745A` FOREIGN KEY (`classification_vente_id`) REFERENCES `classification_vente` (`id`),
  CONSTRAINT `FK_23A0E66FAEE5B63` FOREIGN KEY (`id_famille`) REFERENCES `famille_article` (`id`),
  CONSTRAINT `FK_23A0E66FB0D31D6` FOREIGN KEY (`marge_id`) REFERENCES `marge` (`id`),
  CONSTRAINT `FK_23A0E66FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,16,1,'INF-1','Ordinateur MSI','1000','350000',8,1,1,1,2,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `civilite`
--

LOCK TABLES `civilite` WRITE;
/*!40000 ALTER TABLE `civilite` DISABLE KEYS */;
INSERT INTO `civilite` VALUES (8,'docteur'),(2,'madame'),(5,'madame & monsieur'),(3,'mademoiselle'),(6,'maître'),(1,'monsieur'),(4,'monsieur & madame'),(7,'professeur');
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
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `compte_comptable_id` int(11) NOT NULL,
  `systeme_comptable_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_article`
--

LOCK TABLES `classification_article` WRITE;
/*!40000 ALTER TABLE `classification_article` DISABLE KEYS */;
INSERT INTO `classification_article` VALUES (1,'01-matières premières',0,0),(2,'02-études et prestations de service',0,0),(3,'03-électricité ',0,0),(4,'04-eau',0,0),(5,'05-gaz',0,0),(6,'06-carburant',0,0),(7,'07-petits équipements et fournitures',0,0),(8,'08-achat de marchandises',0,0),(9,'09-entretien',0,0),(10,'10-assurance',0,0),(11,'11-location',0,0),(12,'12-honoraires et commissions',0,0),(13,'13-publicité',0,0),(14,'14-frais de déplacements / restaurants / hôtel / péage',0,0),(15,'15-téléphone et frais postaux ',0,0),(16,'16-impôts et taxes',0,0),(17,'17-frais bancaires',0,0);
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
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_vente`
--

LOCK TABLES `classification_vente` WRITE;
/*!40000 ALTER TABLE `classification_vente` DISABLE KEYS */;
INSERT INTO `classification_vente` VALUES (1,'vente de marchandise'),(2,'frais de port'),(3,'travaux réalisés'),(4,'produits finis');
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generated_by_id` int(11) DEFAULT NULL,
  `societe_id` int(11) DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `recipient_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `montant` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `societe_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions_de_reglements`
--

LOCK TABLES `conditions_de_reglements` WRITE;
/*!40000 ALTER TABLE `conditions_de_reglements` DISABLE KEYS */;
INSERT INTO `conditions_de_reglements` VALUES (3,'15 jours'),(5,'30 jours'),(6,'45 jours'),(7,'60 jours'),(8,'90 jours'),(2,'à la commande'),(1,'à la réception'),(4,'fin du mois');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordonnees_banque`
--

LOCK TABLES `coordonnees_banque` WRITE;
/*!40000 ALTER TABLE `coordonnees_banque` DISABLE KEYS */;
INSERT INTO `coordonnees_banque` VALUES (1,NULL,NULL,NULL,NULL,NULL);
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
  `conditions_de_reglements_id` int(11) DEFAULT NULL,
  `mode_de_paiement_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `objet` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateDeLivraison` datetime NOT NULL,
  `dureeDeValidite` int(11) NOT NULL,
  `commentaire` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tauxDePenalite` int(11) DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `montant_ht` double NOT NULL,
  `montant_ttc` double NOT NULL,
  `reste` double NOT NULL,
  `tva` double NOT NULL,
  `entite_id` int(11) DEFAULT NULL,
  `modified_at` datetime NOT NULL,
  `societe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A2B07288AEA34913` (`reference`),
  KEY `IDX_A2B07288EAFB552E` (`type_de_documents_id`),
  KEY `IDX_A2B072881265D67A` (`conditions_de_reglements_id`),
  KEY `IDX_A2B072888776F13D` (`mode_de_paiement_id`),
  KEY `IDX_A2B072889BEA957A` (`entite_id`),
  KEY `IDX_A2B07288FCF77503` (`societe_id`),
  CONSTRAINT `FK_A2B072881265D67A` FOREIGN KEY (`conditions_de_reglements_id`) REFERENCES `conditions_de_reglements` (`id`),
  CONSTRAINT `FK_A2B072888776F13D` FOREIGN KEY (`mode_de_paiement_id`) REFERENCES `mode_de_paiement` (`id`),
  CONSTRAINT `FK_A2B072889BEA957A` FOREIGN KEY (`entite_id`) REFERENCES `entite` (`id`),
  CONSTRAINT `FK_A2B07288EAFB552E` FOREIGN KEY (`type_de_documents_id`) REFERENCES `type_de_documents` (`id`),
  CONSTRAINT `FK_A2B07288FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,1,5,5,'2018-08-15 20:48:36','location de vehicules','2018-08-16 20:48:36',2,'oups demain je vais au champs',NULL,'F-20180815-1',1050,1212,0,162,1,'2018-08-23 21:12:06',NULL),(2,1,3,2,'2018-08-16 10:30:29','materiel de construction','2018-08-24 10:30:29',15,'la durée de validité de la présente facture est de 15 jours passé ce délai les prix peuvent varier',NULL,'F-20180816-2',0,0,-500,0,1,'2018-08-25 12:33:37',NULL),(3,2,3,4,'2018-08-15 13:33:25','1020','2018-08-30 13:33:25',4,'2541',NULL,'CC-20180817-1',750000,885000,885000,135000,1,'0000-00-00 00:00:00',NULL),(4,2,3,4,'2018-08-23 12:40:26','vente d\'ordinateurs','2018-08-18 12:40:26',5,'vente ordinateurs',NULL,'CC-20180817-2',1253000,1253540,1253540,540,1,'0000-00-00 00:00:00',NULL),(5,2,2,4,'2018-08-17 18:53:23','vente telephones','2018-08-22 18:53:23',5,'je vends plus',NULL,'CC-20180817-3',6280000,6780400,6780400,500400,1,'0000-00-00 00:00:00',NULL),(6,2,2,2,'2018-08-21 12:45:46','location de vehicules','2018-08-08 12:45:46',25,'présente facture vailde pdt 25 jrs',NULL,'CC-20180821-4',8400000,9912000,9912000,1512000,1,'0000-00-00 00:00:00',NULL),(7,3,7,2,'2018-08-21 13:00:24','test352','2018-08-23 13:00:24',1,'test reussi',NULL,'CF-20180821-1',2250000,2655000,2655000,405000,1,'0000-00-00 00:00:00',NULL);
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
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenoms` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `raisonSociale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siteWeb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fonction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `societe_id` int(11) DEFAULT NULL,
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
INSERT INTO `entite` VALUES (1,NULL,4,1,1,'','','BCEAO',NULL,NULL,'',NULL);
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
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `societe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CE500488FCF77503` (`societe_id`),
  CONSTRAINT `FK_CE500488FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `famille_article`
--

LOCK TABLES `famille_article` WRITE;
/*!40000 ALTER TABLE `famille_article` DISABLE KEYS */;
INSERT INTO `famille_article` VALUES (1,'Electromenager','ELM',NULL),(2,'Informatique','INF',NULL),(3,'Materiel BTP','BTP',NULL),(4,'Automobile','AUTO',NULL);
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
-- Table structure for table `fournisseur_classification_article`
--

DROP TABLE IF EXISTS `fournisseur_classification_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur_classification_article` (
  `fournisseur_id` int(11) NOT NULL,
  `classification_article_id` int(11) NOT NULL,
  PRIMARY KEY (`fournisseur_id`,`classification_article_id`),
  KEY `IDX_716866D5670C757F` (`fournisseur_id`),
  KEY `IDX_716866D51C946EBC` (`classification_article_id`),
  CONSTRAINT `FK_716866D51C946EBC` FOREIGN KEY (`classification_article_id`) REFERENCES `classification_article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_716866D5670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur_classification_article`
--

LOCK TABLES `fournisseur_classification_article` WRITE;
/*!40000 ALTER TABLE `fournisseur_classification_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `fournisseur_classification_article` ENABLE KEYS */;
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
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prixUnitaire` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unite_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `quantite` double NOT NULL,
  `tva_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_611F5A29C33F7837` (`document_id`),
  KEY `IDX_611F5A294D79775F` (`tva_id`),
  KEY `IDX_611F5A29EC4A74AB` (`unite_id`),
  CONSTRAINT `FK_611F5A294D79775F` FOREIGN KEY (`tva_id`) REFERENCES `tva` (`id`),
  CONSTRAINT `FK_611F5A29C33F7837` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_611F5A29EC4A74AB` FOREIGN KEY (`unite_id`) REFERENCES `unite` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_facture`
--

LOCK TABLES `ligne_facture` WRITE;
/*!40000 ALTER TABLE `ligne_facture` DISABLE KEYS */;
INSERT INTO `ligne_facture` VALUES (1,'loc-2018-0001','test 1','150',15,1,2,1),(2,'g-5874','test 2','150',15,1,1,NULL),(3,'loc-2018-0001','Joli tv de la mort qui tue','150',5,1,2,1),(4,'loc-2018-0001','je t\'adore de la mort qui tue','150',12,1,2,1),(5,'loc-2018-0001','Je t\'aime depuis hier mais je suis faché aujourd\'hui','1500',7,NULL,2,1),(6,'g-5874','heyyy Hier nuit Ado a daman la femmede Ango yeaaaaaaaaaah','280000',5,NULL,1,1),(7,'k25','Heyyyyyyyyy hefsn;sdkfufskjxchksfj sqkjwxcbnsdq huskjq Je t\'adore','1500',3,NULL,7,1),(8,'loc-2018-0001','je t\'aore de lamort qui tue','1500',12,NULL,7,1),(9,'loc-2018-0001','Hey de la mort qui tue il y a une jolie femme qui aime manger les mange mil hihihi','250000',12,NULL,7,1),(10,'g-5874','Hey de la mort qui tue il y a une joliemange mil hihihi','280000',3,NULL,1,NULL),(11,'g-5874','Un homme battu par sa femme','280000',4,NULL,1,1),(12,'test-001','viande','300000',6,NULL,2,1),(13,'BS123123','Denzel Washington en bikini','15000',5,NULL,2,1),(14,'cns-001','carreaux italien','9500',13,NULL,302,1),(15,'cns-002','carreaux espagnol','8500',13,NULL,250,1),(16,'loc-2018-0001','kiytre','150000',1,NULL,7,1),(17,'111','bgf-rtv','1200000',15,NULL,7,1),(18,'kij','mpl','200',2,NULL,1,NULL),(19,'loc-2018-0001','martial','1500',16,NULL,1,1),(20,'fgt','dfghjkl','1000',16,NULL,2,NULL),(21,'ghy','ertyuio','1000',16,NULL,1,1),(22,'k25','fghytr','150000',NULL,NULL,7,1),(23,'hgyt','ghyrea','21457',16,NULL,7,1),(24,'vbfg','azerrty','280000',16,NULL,2,1),(25,'odr-001','ordinateur  core i5','350000',16,NULL,15,1),(26,'ord-002','ordinateurs core i3','280000',16,NULL,10,NULL),(27,'tel-0212','iphone','250000',16,5,10,1),(28,'tel','nokia 1100','280000',NULL,5,1,1),(29,'258','samsung s9','350000',16,5,10,NULL),(30,'loc-2018-0001','gftredf','1200000',16,6,7,1),(31,'loc-2018-0001','carton de petit pois&nbsp;','150000',16,3,5,1),(32,'k25','tst','150000',9,7,15,1),(33,'k25','jhuyy','1500',13,4,2,1),(34,'moi','toi','250000',16,4,5,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marge`
--

LOCK TABLES `marge` WRITE;
/*!40000 ALTER TABLE `marge` DISABLE KEYS */;
INSERT INTO `marge` VALUES (1,'303092.1459492888',3030.303030303,1.1666666666667,0.98989898989899);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode_de_paiement`
--

LOCK TABLES `mode_de_paiement` WRITE;
/*!40000 ALTER TABLE `mode_de_paiement` DISABLE KEYS */;
INSERT INTO `mode_de_paiement` VALUES (4,'carte bancaire'),(2,'chèque'),(5,'contre-remboursement'),(1,'espèces'),(3,'virement bancaire');
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nature_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nature_article`
--

LOCK TABLES `nature_article` WRITE;
/*!40000 ALTER TABLE `nature_article` DISABLE KEYS */;
INSERT INTO `nature_article` VALUES (1,'produit'),(2,'service');
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
  `date` datetime NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `debit` decimal(2,0) NOT NULL,
  `credit` decimal(2,0) NOT NULL,
  `compte_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
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
  `document_id` int(11) DEFAULT NULL,
  `montant` double NOT NULL,
  `date` datetime NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mode_de_paiement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B1DC7A1EC33F7837` (`document_id`),
  KEY `IDX_B1DC7A1E8776F13D` (`mode_de_paiement_id`),
  CONSTRAINT `FK_B1DC7A1E8776F13D` FOREIGN KEY (`mode_de_paiement_id`) REFERENCES `mode_de_paiement` (`id`),
  CONSTRAINT `FK_B1DC7A1EC33F7837` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiement`
--

LOCK TABLES `paiement` WRITE;
/*!40000 ALTER TABLE `paiement` DISABLE KEYS */;
INSERT INTO `paiement` VALUES (3,1,1000,'2018-08-23 20:49:19',NULL,NULL),(4,1,200,'2018-08-23 20:56:40',NULL,NULL),(5,1,12,'2018-08-23 21:12:06','1er versement',4),(6,2,500,'2018-08-25 12:33:37','1er versement',2);
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
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `systeme_comptable_id` int(11) DEFAULT NULL,
  `iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
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
INSERT INTO `pays` VALUES (1,'Afghanistan',NULL,'AF'),(2,'Afrique du Sud',NULL,'ZA'),(3,'Albanie',NULL,'AL'),(4,'Algérie',NULL,'DZ'),(5,'Allemagne',NULL,'DE'),(6,'Andorre',NULL,'AD'),(7,'Angola',NULL,'AO'),(8,'Anguilla',NULL,'AI'),(9,'Antarctique',NULL,'AQ'),(10,'Antigua-et-Barbuda',NULL,'AG'),(11,'Arabie saoudite',NULL,'SA'),(12,'Argentine',NULL,'AR'),(13,'Arménie',NULL,'AM'),(14,'Aruba',NULL,'AW'),(15,'Australie',NULL,'AU'),(16,'Autriche',NULL,'AT'),(17,'Azerbaïdjan',NULL,'AZ'),(18,'Bahamas',NULL,'BS'),(19,'Bahreïn',NULL,'BH'),(20,'Bangladesh',NULL,'BD'),(21,'Barbade',NULL,'BB'),(22,'Belgique',NULL,'BE'),(23,'Belize',NULL,'BZ'),(24,'Bénin',NULL,'BJ'),(25,'Bermudes',NULL,'BM'),(26,'Bhoutan',NULL,'BT'),(27,'Biélorussie',NULL,'BY'),(28,'Bolivie',NULL,'BO'),(29,'Bosnie-Herzégovine',NULL,'BA'),(30,'Botswana',NULL,'BW'),(31,'Brésil',NULL,'BR'),(32,'Brunéi Darussalam',NULL,'BN'),(33,'Bulgarie',NULL,'BG'),(34,'Burkina Faso',NULL,'BF'),(35,'Burundi',NULL,'BI'),(36,'Cambodge',NULL,'KH'),(37,'Cameroun',NULL,'CM'),(38,'Canada',NULL,'CA'),(39,'Cap-Vert',NULL,'CV'),(40,'Ceuta et Melilla',NULL,'EA'),(41,'Chili',NULL,'CL'),(42,'Chine',NULL,'CN'),(43,'Chypre',NULL,'CY'),(44,'Colombie',NULL,'CO'),(45,'Comores',NULL,'KM'),(46,'Congo-Brazzaville',NULL,'CG'),(47,'Congo-Kinshasa',NULL,'CD'),(48,'Corée du Nord',NULL,'KP'),(49,'Corée du Sud',NULL,'KR'),(50,'Costa Rica',NULL,'CR'),(51,'Côte d?Ivoire',NULL,'CI'),(52,'Croatie',NULL,'HR'),(53,'Cuba',NULL,'CU'),(54,'Curaçao',NULL,'CW'),(55,'Danemark',NULL,'DK'),(56,'Diego Garcia',NULL,'DG'),(57,'Djibouti',NULL,'DJ'),(58,'Dominique',NULL,'DM'),(59,'Égypte',NULL,'EG'),(60,'El Salvador',NULL,'SV'),(61,'Émirats arabes unis',NULL,'AE'),(62,'Équateur',NULL,'EC'),(63,'Érythrée',NULL,'ER'),(64,'Espagne',NULL,'ES'),(65,'Estonie',NULL,'EE'),(66,'État de la Cité du Vatican',NULL,'VA'),(67,'États fédérés de Micronésie',NULL,'FM'),(68,'États-Unis',NULL,'US'),(69,'Éthiopie',NULL,'ET'),(70,'Eurozone',NULL,'EZ'),(71,'Fidji',NULL,'FJ'),(72,'Finlande',NULL,'FI'),(73,'France',NULL,'FR'),(74,'Gabon',NULL,'GA'),(75,'Gambie',NULL,'GM'),(76,'Géorgie',NULL,'GE'),(77,'Géorgie du Sud et îles Sandwich du Sud',NULL,'GS'),(78,'Ghana',NULL,'GH'),(79,'Gibraltar',NULL,'GI'),(80,'Grèce',NULL,'GR'),(81,'Grenade',NULL,'GD'),(82,'Groenland',NULL,'GL'),(83,'Guadeloupe',NULL,'GP'),(84,'Guam',NULL,'GU'),(85,'Guatemala',NULL,'GT'),(86,'Guernesey',NULL,'GG'),(87,'Guinée',NULL,'GN'),(88,'Guinée équatoriale',NULL,'GQ'),(89,'Guinée-Bissau',NULL,'GW'),(90,'Guyana',NULL,'GY'),(91,'Guyane française',NULL,'GF'),(92,'Haïti',NULL,'HT'),(93,'Honduras',NULL,'HN'),(94,'Hongrie',NULL,'HU'),(95,'Île Christmas',NULL,'CX'),(96,'Île de l?Ascension',NULL,'AC'),(97,'Île de Man',NULL,'IM'),(98,'Île Norfolk',NULL,'NF'),(99,'Îles Åland',NULL,'AX'),(100,'Îles Caïmans',NULL,'KY'),(101,'Îles Canaries',NULL,'IC'),(102,'Îles Cocos',NULL,'CC'),(103,'Îles Cook',NULL,'CK'),(104,'Îles Féroé',NULL,'FO'),(105,'Îles Malouines',NULL,'FK'),(106,'Îles Mariannes du Nord',NULL,'MP'),(107,'Îles Marshall',NULL,'MH'),(108,'Îles mineures éloignées des États-Unis',NULL,'UM'),(109,'Îles Pitcairn',NULL,'PN'),(110,'Îles Salomon',NULL,'SB'),(111,'Îles Turques-et-Caïques',NULL,'TC'),(112,'Îles Vierges britanniques',NULL,'VG'),(113,'Îles Vierges des États-Unis',NULL,'VI'),(114,'Inde',NULL,'IN'),(115,'Indonésie',NULL,'ID'),(116,'Irak',NULL,'IQ'),(117,'Iran',NULL,'IR'),(118,'Irlande',NULL,'IE'),(119,'Islande',NULL,'IS'),(120,'Israël',NULL,'IL'),(121,'Italie',NULL,'IT'),(122,'Jamaïque',NULL,'JM'),(123,'Japon',NULL,'JP'),(124,'Jersey',NULL,'JE'),(125,'Jordanie',NULL,'JO'),(126,'Kazakhstan',NULL,'KZ'),(127,'Kenya',NULL,'KE'),(128,'Kirghizistan',NULL,'KG'),(129,'Kiribati',NULL,'KI'),(130,'Kosovo',NULL,'XK'),(131,'Koweït',NULL,'KW'),(132,'La Réunion',NULL,'RE'),(133,'Laos',NULL,'LA'),(134,'Lesotho',NULL,'LS'),(135,'Lettonie',NULL,'LV'),(136,'Liban',NULL,'LB'),(137,'Libéria',NULL,'LR'),(138,'Libye',NULL,'LY'),(139,'Liechtenstein',NULL,'LI'),(140,'Lituanie',NULL,'LT'),(141,'Luxembourg',NULL,'LU'),(142,'Macédoine',NULL,'MK'),(143,'Madagascar',NULL,'MG'),(144,'Malaisie',NULL,'MY'),(145,'Malawi',NULL,'MW'),(146,'Maldives',NULL,'MV'),(147,'Mali',NULL,'ML'),(148,'Malte',NULL,'MT'),(149,'Maroc',NULL,'MA'),(150,'Martinique',NULL,'MQ'),(151,'Maurice',NULL,'MU'),(152,'Mauritanie',NULL,'MR'),(153,'Mayotte',NULL,'YT'),(154,'Mexique',NULL,'MX'),(155,'Moldavie',NULL,'MD'),(156,'Monaco',NULL,'MC'),(157,'Mongolie',NULL,'MN'),(158,'Monténégro',NULL,'ME'),(159,'Montserrat',NULL,'MS'),(160,'Mozambique',NULL,'MZ'),(161,'Myanmar (Birmanie)',NULL,'MM'),(162,'Namibie',NULL,'NA'),(163,'Nations Unies',NULL,'UN'),(164,'Nauru',NULL,'NR'),(165,'Népal',NULL,'NP'),(166,'Nicaragua',NULL,'NI'),(167,'Niger',NULL,'NE'),(168,'Nigéria',NULL,'NG'),(169,'Niue',NULL,'NU'),(170,'Norvège',NULL,'NO'),(171,'Nouvelle-Calédonie',NULL,'NC'),(172,'Nouvelle-Zélande',NULL,'NZ'),(173,'Oman',NULL,'OM'),(174,'Ouganda',NULL,'UG'),(175,'Ouzbékistan',NULL,'UZ'),(176,'Pakistan',NULL,'PK'),(177,'Palaos',NULL,'PW'),(178,'Panama',NULL,'PA'),(179,'Papouasie-Nouvelle-Guinée',NULL,'PG'),(180,'Paraguay',NULL,'PY'),(181,'Pays-Bas',NULL,'NL'),(182,'Pays-Bas caribéens',NULL,'BQ'),(183,'Pérou',NULL,'PE'),(184,'Philippines',NULL,'PH'),(185,'Pologne',NULL,'PL'),(186,'Polynésie française',NULL,'PF'),(187,'Porto Rico',NULL,'PR'),(188,'Portugal',NULL,'PT'),(189,'Qatar',NULL,'QA'),(190,'R.A.S. chinoise de Hong Kong',NULL,'HK'),(191,'R.A.S. chinoise de Macao',NULL,'MO'),(192,'République centrafricaine',NULL,'CF'),(193,'République dominicaine',NULL,'DO'),(194,'Roumanie',NULL,'RO'),(195,'Royaume-Uni',NULL,'GB'),(196,'Russie',NULL,'RU'),(197,'Rwanda',NULL,'RW'),(198,'Sahara occidental',NULL,'EH'),(199,'Saint-Barthélemy',NULL,'BL'),(200,'Saint-Christophe-et-Niévès',NULL,'KN'),(201,'Saint-Marin',NULL,'SM'),(202,'Saint-Martin',NULL,'MF'),(203,'Saint-Martin (partie néerlandaise)',NULL,'SX'),(204,'Saint-Pierre-et-Miquelon',NULL,'PM'),(205,'Saint-Vincent-et-les-Grenadines',NULL,'VC'),(206,'Sainte-Hélène',NULL,'SH'),(207,'Sainte-Lucie',NULL,'LC'),(208,'Samoa',NULL,'WS'),(209,'Samoa américaines',NULL,'AS'),(210,'Sao Tomé-et-Principe',NULL,'ST'),(211,'Sénégal',NULL,'SN'),(212,'Serbie',NULL,'RS'),(213,'Seychelles',NULL,'SC'),(214,'Sierra Leone',NULL,'SL'),(215,'Singapour',NULL,'SG'),(216,'Slovaquie',NULL,'SK'),(217,'Slovénie',NULL,'SI'),(218,'Somalie',NULL,'SO'),(219,'Soudan',NULL,'SD'),(220,'Soudan du Sud',NULL,'SS'),(221,'Sri Lanka',NULL,'LK'),(222,'Suède',NULL,'SE'),(223,'Suisse',NULL,'CH'),(224,'Suriname',NULL,'SR'),(225,'Svalbard et Jan Mayen',NULL,'SJ'),(226,'Swaziland',NULL,'SZ'),(227,'Syrie',NULL,'SY'),(228,'Tadjikistan',NULL,'TJ'),(229,'Taïwan',NULL,'TW'),(230,'Tanzanie',NULL,'TZ'),(231,'Tchad',NULL,'TD'),(232,'Tchéquie',NULL,'CZ'),(233,'Terres australes françaises',NULL,'TF'),(234,'Territoire britannique de l?océan Indien',NULL,'IO'),(235,'Territoires palestiniens',NULL,'PS'),(236,'Thaïlande',NULL,'TH'),(237,'Timor oriental',NULL,'TL'),(238,'Togo',NULL,'TG'),(239,'Tokélaou',NULL,'TK'),(240,'Tonga',NULL,'TO'),(241,'Trinité-et-Tobago',NULL,'TT'),(242,'Tristan da Cunha',NULL,'TA'),(243,'Tunisie',NULL,'TN'),(244,'Turkménistan',NULL,'TM'),(245,'Turquie',NULL,'TR'),(246,'Tuvalu',NULL,'TV'),(247,'Ukraine',NULL,'UA'),(248,'Uruguay',NULL,'UY'),(249,'Vanuatu',NULL,'VU'),(250,'Venezuela',NULL,'VE'),(251,'Vietnam',NULL,'VN'),(252,'Wallis-et-Futuna',NULL,'WF'),(253,'Yémen',NULL,'YE'),(254,'Zambie',NULL,'ZM'),(255,'Zimbabwe',NULL,'ZW');
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
  `raisonSociale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permalien` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `capital_social` int(11) DEFAULT NULL,
  `dateDeCreation` datetime NOT NULL,
  `activitePrincipale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pays_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tva`
--

LOCK TABLES `tva` WRITE;
/*!40000 ALTER TABLE `tva` DISABLE KEYS */;
INSERT INTO `tva` VALUES (1,18);
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unite`
--

LOCK TABLES `unite` WRITE;
/*!40000 ALTER TABLE `unite` DISABLE KEYS */;
INSERT INTO `unite` VALUES (1,'A (année)'),(2,'cent (centaine)'),(3,'dix (dizaine)'),(4,'forfait'),(5,'g (gramme)'),(6,'kg (kilogramme)'),(7,'ha (hectare)'),(8,'hl (hectolitre)'),(9,'l (litre)'),(10,'h (heure)'),(11,'km (kilomètre)'),(12,'m (mètre)'),(13,'m² (mètre carré)'),(14,'m3 (mètre cube)'),(15,'t (tonne)'),(16,'u (unité)');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'stefann.sasori@gmail.com','stefann.sasori@gmail.com','stefann.sasori@gmail.com','stefann.sasori@gmail.com',1,'jEYVEgMbSyqSyVIwZP/gfkNrNSVihheG8W9eydn6MbY','DnT2cxgYtf+E1uQCMOHVw4PSSTXgRig2ai9aV0peojKgk4vMBJKHoo8PaxVEHwBowGIwoa/UL0ofqkfIqgNANA==','2018-11-06 22:10:53',NULL,NULL,'a:0:{}',NULL,1,NULL,NULL,NULL,'local',NULL,NULL,NULL,NULL,'2018-11-14 00:22:09',NULL,'default.png',NULL,NULL,NULL),(5,'angemartialkoffi@outlook.fr','angemartialkoffi@outlook.fr','angemartialkoffi@outlook.fr','angemartialkoffi@outlook.fr',1,'bCcjvbDwWa1781WSr.mLiFeFVkCB9ySmsKi.XH3Epto','3Cz6INq42uHxp7/3YawTga/uz1/Wzh8cEhoM4BEkyTI26cV1tD/sWBwX0mMzlOLFrvF8Gd8j+BxyiAhROsdHmA==','2018-11-21 16:32:11','_qRZZvb1FQt1MnUn7R3O59Z00VRhg9BnL5ew3lBpJKE',NULL,'a:0:{}',NULL,1,NULL,NULL,NULL,'local',NULL,NULL,NULL,NULL,'2018-11-21 16:32:21',NULL,'default.png',NULL,NULL,NULL),(6,'angemartialkoffi@gmail.com','angemartialkoffi@gmail.com','angemartialkoffi@gmail.com','angemartialkoffi@gmail.com',1,'i3KUyI7bvyixZuSD8wU.U/YoQuYRpzaOQcLTKkG4MQ0','BYTXyOiItf00Ua13ID7mxlOa/ffiVR0TKXsozRi8RfxjGHIbn/MKyhsyxZ/0R/Kpq/sauJN7XZ8OzCoD6igRxA==','2018-11-16 16:39:12',NULL,NULL,'a:0:{}',NULL,1,NULL,NULL,NULL,'local',NULL,NULL,NULL,NULL,'2018-11-16 17:21:35',NULL,'default.png',NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_parameter`
--

LOCK TABLES `user_parameter` WRITE;
/*!40000 ALTER TABLE `user_parameter` DISABLE KEYS */;
INSERT INTO `user_parameter` VALUES (1,1,'1','chat'),(2,1,'1','chrono'),(3,1,'1','battle'),(4,3,'1','chat'),(5,3,'1','chrono'),(6,3,'1','battle'),(7,4,'1','chat'),(8,4,'1','chrono'),(9,4,'1','battle'),(10,5,'1','chat'),(11,5,'1','chrono'),(12,5,'1','battle'),(13,6,'1','chat'),(14,6,'1','chrono'),(15,6,'1','battle');
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

-- Dump completed on 2018-11-29 16:51:41
