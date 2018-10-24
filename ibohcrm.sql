-- MySQL dump 10.16  Distrib 10.1.33-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: ibohcrm
-- ------------------------------------------------------
-- Server version	10.1.33-MariaDB

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
  CONSTRAINT `FK_23A0E661C946EBC` FOREIGN KEY (`classification_article_id`) REFERENCES `classification_article` (`id`),
  CONSTRAINT `FK_23A0E664D79775F` FOREIGN KEY (`tva_id`) REFERENCES `tva` (`id`),
  CONSTRAINT `FK_23A0E669EEA350B` FOREIGN KEY (`nature_article_id`) REFERENCES `nature_article` (`id`),
  CONSTRAINT `FK_23A0E66EC4A74AB` FOREIGN KEY (`unite_id`) REFERENCES `unite` (`id`),
  CONSTRAINT `FK_23A0E66F851745A` FOREIGN KEY (`classification_vente_id`) REFERENCES `classification_vente` (`id`),
  CONSTRAINT `FK_23A0E66FAEE5B63` FOREIGN KEY (`id_famille`) REFERENCES `famille_article` (`id`),
  CONSTRAINT `FK_23A0E66FB0D31D6` FOREIGN KEY (`marge_id`) REFERENCES `marge` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,16,1,'INF-1','Ordinateur MSI','1000','350000',8,1,1,1,2);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_article`
--

LOCK TABLES `classification_article` WRITE;
/*!40000 ALTER TABLE `classification_article` DISABLE KEYS */;
INSERT INTO `classification_article` VALUES (1,'01-matières premières'),(2,'02-études et prestations de service'),(3,'03-électricité '),(4,'04-eau'),(5,'05-gaz'),(6,'06-carburant'),(7,'07-petits équipements et fournitures'),(8,'08-achat de marchandises'),(9,'09-entretien'),(10,'10-assurance'),(11,'11-location'),(12,'12-honoraires et commissions'),(13,'13-publicité'),(14,'14-frais de déplacements / restaurants / hôtel / péage'),(15,'15-téléphone et frais postaux '),(16,'16-impôts et taxes'),(17,'17-frais bancaires');
/*!40000 ALTER TABLE `classification_article` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A2B07288AEA34913` (`reference`),
  KEY `IDX_A2B07288EAFB552E` (`type_de_documents_id`),
  KEY `IDX_A2B072881265D67A` (`conditions_de_reglements_id`),
  KEY `IDX_A2B072888776F13D` (`mode_de_paiement_id`),
  KEY `IDX_A2B072889BEA957A` (`entite_id`),
  CONSTRAINT `FK_A2B072881265D67A` FOREIGN KEY (`conditions_de_reglements_id`) REFERENCES `conditions_de_reglements` (`id`),
  CONSTRAINT `FK_A2B072888776F13D` FOREIGN KEY (`mode_de_paiement_id`) REFERENCES `mode_de_paiement` (`id`),
  CONSTRAINT `FK_A2B072889BEA957A` FOREIGN KEY (`entite_id`) REFERENCES `entite` (`id`),
  CONSTRAINT `FK_A2B07288EAFB552E` FOREIGN KEY (`type_de_documents_id`) REFERENCES `type_de_documents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,1,5,5,'2018-08-15 20:48:36','location de vehicules','2018-08-16 20:48:36',2,'oups demain je vais au champs',NULL,'F-20180815-1',1050,1212,0,162,1,'2018-08-23 21:12:06'),(2,1,3,2,'2018-08-16 10:30:29','materiel de construction','2018-08-24 10:30:29',15,'la durée de validité de la présente facture est de 15 jours passé ce délai les prix peuvent varier',NULL,'F-20180816-2',0,0,-500,0,1,'2018-08-25 12:33:37'),(3,2,3,4,'2018-08-15 13:33:25','1020','2018-08-30 13:33:25',4,'2541',NULL,'CC-20180817-1',750000,885000,885000,135000,1,'0000-00-00 00:00:00'),(4,2,3,4,'2018-08-23 12:40:26','vente d\'ordinateurs','2018-08-18 12:40:26',5,'vente ordinateurs',NULL,'CC-20180817-2',1253000,1253540,1253540,540,1,'0000-00-00 00:00:00'),(5,2,2,4,'2018-08-17 18:53:23','vente telephones','2018-08-22 18:53:23',5,'je vends plus',NULL,'CC-20180817-3',6280000,6780400,6780400,500400,1,'0000-00-00 00:00:00'),(6,2,2,2,'2018-08-21 12:45:46','location de vehicules','2018-08-08 12:45:46',25,'présente facture vailde pdt 25 jrs',NULL,'CC-20180821-4',8400000,9912000,9912000,1512000,1,'0000-00-00 00:00:00'),(7,3,7,2,'2018-08-21 13:00:24','test352','2018-08-23 13:00:24',1,'test reussi',NULL,'CF-20180821-1',2250000,2655000,2655000,405000,1,'0000-00-00 00:00:00');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1A2918274DE7DC5C` (`adresse_id`),
  KEY `IDX_1A29182739194ABF` (`civilite_id`),
  KEY `IDX_1A2918279AEE68EB` (`forme_juridique_id`),
  KEY `IDX_1A291827EC514E12` (`coordonnees_banque_id`),
  CONSTRAINT `FK_1A29182739194ABF` FOREIGN KEY (`civilite_id`) REFERENCES `civilite` (`id`),
  CONSTRAINT `FK_1A2918274DE7DC5C` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`),
  CONSTRAINT `FK_1A2918279AEE68EB` FOREIGN KEY (`forme_juridique_id`) REFERENCES `forme_juridique` (`id`),
  CONSTRAINT `FK_1A291827EC514E12` FOREIGN KEY (`coordonnees_banque_id`) REFERENCES `coordonnees_banque` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entite`
--

LOCK TABLES `entite` WRITE;
/*!40000 ALTER TABLE `entite` DISABLE KEYS */;
INSERT INTO `entite` VALUES (1,NULL,4,1,1,'','','BCEAO',NULL,NULL,'');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `famille_article`
--

LOCK TABLES `famille_article` WRITE;
/*!40000 ALTER TABLE `famille_article` DISABLE KEYS */;
INSERT INTO `famille_article` VALUES (1,'Electromenager','ELM'),(2,'Informatique','INF'),(3,'Materiel BTP','BTP'),(4,'Automobile','AUTO');
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
  `numeroCompte` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `debit` decimal(2,0) NOT NULL,
  `credit` decimal(2,0) NOT NULL,
  PRIMARY KEY (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_349F3CAEFF7747B4` (`titre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (4,'Angleterre'),(2,'Belgique'),(8,'Burkina Faso'),(1,'Côte d\'Ivoire'),(3,'France'),(6,'Ghana'),(10,'Guinée Bissau '),(9,'Guinée Conakry'),(7,'Mali'),(5,'Suisse');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-24 20:17:08
