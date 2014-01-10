Usage: mysqldump [OPTIONS] database [tables]
OR     mysqldump [OPTIONS] --databases [OPTIONS] DB1 [DB2 DB3...]
OR     mysqldump [OPTIONS] --all-databases [OPTIONS]
For more options, use mysqldump --help
-- MySQL dump 10.11
--
-- Host: localhost    Database: excise
-- ------------------------------------------------------
-- Server version	5.0.96-0ubuntu3

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
-- Table structure for table `account_head_details`
--

DROP TABLE IF EXISTS `account_head_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_head_details` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `account_head_amount` decimal(20,2) default NULL,
  `account_head_id` varchar(255) default NULL,
  `challan_collection_details_id` bigint(20) NOT NULL,
  `consumerid` int(11) NOT NULL,
  `consumer_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK1CB617B53B0DD7A3` (`challan_collection_details_id`),
  CONSTRAINT `FK1CB617B53B0DD7A3` FOREIGN KEY (`challan_collection_details_id`) REFERENCES `challan_collection_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_head_details`
--

LOCK TABLES `account_head_details` WRITE;
/*!40000 ALTER TABLE `account_head_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_head_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challan_collection_details`
--

DROP TABLE IF EXISTS `challan_collection_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challan_collection_details` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `account_head_amount` decimal(20,2) default NULL,
  `account_head_id` varchar(255) NOT NULL,
  `consumerid` varchar(255) NOT NULL,
  `consumer_name` varchar(255) NOT NULL,
  `data_entered_date` datetime NOT NULL,
  `data_entry_date` datetime NOT NULL,
  `district_id` varchar(255) NOT NULL,
  `district_office_id` bigint(20) NOT NULL,
  `treasure_id` int(11) NOT NULL,
  `liquor_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK169F25572A90965C` (`district_office_id`),
  CONSTRAINT `FK169F25572A90965C` FOREIGN KEY (`district_office_id`) REFERENCES `district_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challan_collection_details`
--

LOCK TABLES `challan_collection_details` WRITE;
/*!40000 ALTER TABLE `challan_collection_details` DISABLE KEYS */;
INSERT INTO `challan_collection_details` VALUES (161,0,'11111111.00','101','D1001','ABC - Distributor','2012-03-21 18:38:46','2012-03-21 00:00:00','Bongaigaon',1,1111,1),(162,0,'123456789.00','101','D1001','ABC - Distributor','2012-03-22 10:08:04','2012-03-22 00:00:00','Bongaigaon',1,111111,1),(163,0,'12345677.00','100','M1001','ABC - Manufacturer','2012-03-22 12:38:28','2012-03-22 00:00:00','Bongaigaon',1,12,1),(164,0,'123456.00','100','M1001','ABC - Manufacturer','2012-03-22 15:53:06','2012-03-22 00:00:00','Bongaigaon',1,123,1),(165,0,'12345678.00','101','D1001','ABC - Distributor','2012-03-22 16:37:18','2012-03-22 00:00:00','Kamrup',6,1234,1),(166,0,'12345.00','101','D1002','XYZ - Distributor','2012-03-22 16:39:09','2012-03-22 00:00:00','Kamrup',6,23,2),(167,0,'789456.00','100','M1001','ABC - Manufacturer','2012-03-22 16:40:45','2012-03-22 00:00:00','Kamrup',6,58,1);
/*!40000 ALTER TABLE `challan_collection_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumer` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `consumer_id` varchar(255) NOT NULL,
  `consumer_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
INSERT INTO `consumer` VALUES (1,0,'M1001','ABC - Manufacturer','Manufacturer'),(2,0,'M1002','XYZ - Manufacturer','Manufacturer'),(3,0,'D1001','ABC - Distributor','Distributor'),(4,0,'D1002','XYZ - Distributor','Distributor'),(5,0,'R1001','Retailer - A','Retailer'),(6,0,'R1002','Retailer - B','Retailer'),(7,0,'R1003','Retailer - C','Retailer'),(8,0,'R1004','Retailer - D','Retailer'),(9,0,'R1005','Retailer - E','Retailer'),(10,0,'R1006','Retailer - F','Retailer'),(11,0,'M1003','PQR-Manufacturer','Manufacturer'),(12,0,'M1004','EFG-Manufacturer','Manufacturer'),(13,0,'D1003','PQR-Distributor','Distributor'),(14,0,'D1004','EFG-Distributor','Distributor');
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district_office`
--

DROP TABLE IF EXISTS `district_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district_office` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `head_quarter_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district_office`
--

LOCK TABLES `district_office` WRITE;
/*!40000 ALTER TABLE `district_office` DISABLE KEYS */;
INSERT INTO `district_office` VALUES (1,0,1,'Bongaigaon'),(2,0,1,'Cachar'),(3,0,1,'Mushalpur'),(4,0,1,'Barpeta'),(5,0,1,'Darrang'),(6,0,1,'Kamrup');
/*!40000 ALTER TABLE `district_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `head_quarter`
--

DROP TABLE IF EXISTS `head_quarter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `head_quarter` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head_quarter`
--

LOCK TABLES `head_quarter` WRITE;
/*!40000 ALTER TABLE `head_quarter` DISABLE KEYS */;
INSERT INTO `head_quarter` VALUES (1,0,'Assam');
/*!40000 ALTER TABLE `head_quarter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `account_head_id` varchar(255) NOT NULL,
  `amount` decimal(20,2) default NULL,
  `consumer_id` varchar(255) NOT NULL,
  `consumer_name` varchar(255) NOT NULL,
  `data_entry_date` datetime NOT NULL,
  `district_name` varchar(255) NOT NULL,
  `district_office_id` bigint(20) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `treasury_challan_id` varchar(255) NOT NULL,
  `liquor_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK9F084412A90965C` (`district_office_id`),
  CONSTRAINT `FK9F084412A90965C` FOREIGN KEY (`district_office_id`) REFERENCES `district_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES (36,5,'101','12389456.00','D1001','ABC - Distributor','2012-03-22 00:00:00','Kamrup',6,'2010-2011','88',1),(37,0,'101','123.00','D1001','ABC - Distributor','2012-03-21 00:00:00','Bongaigaon',1,'2011-2012','34',1),(38,1,'101','478512369.00','D1002','XYZ - Distributor','2012-03-22 00:00:00','Kamrup',6,'2011-2012','25',1),(39,1,'100','12378546.00','M1001','ABC - Manufacturer','2012-03-22 00:00:00','Kamrup',6,'2011-2012','65',1),(40,0,'103','123698.00','R1003','Retailer - C','2012-03-22 00:00:00','Bongaigaon',1,'2010-2011','78',1),(41,1,'103','55556987.00','R1001','Retailer - A','2012-03-22 00:00:00','Kamrup',6,'2011-2012','33',1),(42,0,'100','888854621.00','M1002','XYZ - Manufacturer','2012-03-22 00:00:00','Kamrup',6,'2010-2011','41',1),(43,0,'103','254789631.00','R1002','Retailer - B','2012-03-22 00:00:00','Kamrup',6,'2010-2011','58',1),(44,0,'101','125478963.00','D1003','PQR-Distributor','2012-03-22 00:00:00','Kamrup',6,'2011-2012','73',2),(45,0,'101','8421563.00','D1004','EFG-Distributor','2012-03-22 00:00:00','Kamrup',6,'2010-2011','25',2);
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquor`
--

DROP TABLE IF EXISTS `liquor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquor` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `liquor_type` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquor`
--

LOCK TABLES `liquor` WRITE;
/*!40000 ALTER TABLE `liquor` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_code`
--

DROP TABLE IF EXISTS `registration_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_code` (
  `id` bigint(20) NOT NULL auto_increment,
  `date_created` datetime NOT NULL,
  `token` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_code`
--

LOCK TABLES `registration_code` WRITE;
/*!40000 ALTER TABLE `registration_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retailer`
--

DROP TABLE IF EXISTS `retailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retailer` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `account_headidexcise` decimal(20,2) default NULL,
  `account_headidvat` decimal(20,2) default NULL,
  `consumerid` varchar(255) NOT NULL,
  `consumer_name` varchar(255) NOT NULL,
  `data_entered_date` datetime NOT NULL,
  `data_entry_date` datetime NOT NULL,
  `districtid` varchar(255) NOT NULL,
  `district_office_id` bigint(20) NOT NULL,
  `treasuryid` varchar(255) NOT NULL,
  `liquor_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKEC95C8F02A90965C` (`district_office_id`),
  CONSTRAINT `FKEC95C8F02A90965C` FOREIGN KEY (`district_office_id`) REFERENCES `district_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailer`
--

LOCK TABLES `retailer` WRITE;
/*!40000 ALTER TABLE `retailer` DISABLE KEYS */;
INSERT INTO `retailer` VALUES (54,0,'2012312.00','1111111.00','122222','R1001','2012-03-21 15:36:01','2012-03-21 00:00:00','Bongaigaon',1,'Retailer - A',1),(55,0,'879.00','87689.00','799','R1001','2012-03-21 17:33:56','2012-03-06 00:00:00','Bongaigaon',1,'Retailer - A',1),(56,0,'8987.00','8987.00','87','R1002','2012-03-21 17:34:27','2012-03-08 00:00:00','Bongaigaon',1,'Retailer - B',1),(57,0,'4545.00','446.00','5465','R1001','2012-03-21 17:35:30','2012-03-02 00:00:00','Cachar',1,'Retailer - A',1),(58,0,'123.00','234.00','123','R1001','2012-03-21 18:39:24','2012-03-21 00:00:00','Bongaigaon',1,'Retailer - A',1),(59,0,'343554657.00','4368768.00','354','R1003','2012-03-22 10:09:25','2012-03-22 00:00:00','Cachar',1,'Retailer - C',1),(60,0,'1234.00','123456.00','12','R1001','2012-03-22 10:09:25','2012-03-22 00:00:00','Bongaigaon',1,'Retailer - A',1),(61,0,'12.00','343.00','23','R1001','2012-03-22 11:36:15','2012-03-22 00:00:00','Bongaigaon',1,'Retailer - A',1),(62,0,'1232.00','656.00','34','R1002','2012-03-22 11:36:15','2012-03-22 00:00:00','Cachar',1,'Retailer - B',1),(63,0,'123564789.00','44589612.00','12','R1001','2012-03-22 16:42:25','2012-03-22 00:00:00','Kamrup',6,'Retailer - A',1),(64,0,'4500000.00','450000.00','123456','R1005','2012-03-22 17:39:10','2012-03-21 00:00:00','Kamrup',6,'Retailer - E',1),(65,0,'2500000.00','250000.00','234567','R1001','2012-03-22 17:40:21','2012-03-21 00:00:00','Bongaigaon',1,'Retailer - A',1),(66,0,'45000.00','45000.00','123456','R1006','2012-03-24 15:49:37','2012-03-23 00:00:00','Kamrup',6,'Retailer - F',1),(67,0,'350000.00','350000.00','123456','R1006','2012-03-24 21:04:23','2012-03-23 00:00:00','Kamrup',6,'Retailer - F',1);
/*!40000 ALTER TABLE `retailer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `authority` (`authority`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,0,'ROLE_ADMIN'),(2,0,'ROLE_HEADQUARTER'),(3,0,'ROLE_DISTRICT'),(4,0,'ROLE_SUPERINTENDENT'),(5,0,'ROLE_DATAENTRY ');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superintendent_office`
--

DROP TABLE IF EXISTS `superintendent_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superintendent_office` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `district_office_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK917375972A90965C` (`district_office_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superintendent_office`
--

LOCK TABLES `superintendent_office` WRITE;
/*!40000 ALTER TABLE `superintendent_office` DISABLE KEYS */;
INSERT INTO `superintendent_office` VALUES (4,2,7,'Mushalpur'),(6,0,7,'Salbari'),(7,0,7,'Tamulpur'),(8,0,8,'Barpeta'),(9,0,8,'Bajali'),(10,0,9,'Bongaigaon'),(11,0,9,'North_Salmara'),(12,0,9,'Bijni'),(13,0,10,'Silchar'),(14,0,10,'Lakhipur'),(15,0,11,'Darrang'),(16,0,12,'Dhemaji'),(17,0,12,'Jonai'),(18,0,13,'Bilasipara'),(19,0,13,'Dhubri'),(20,0,13,'South Salmara-Mankachar'),(21,0,14,'Dibrugarh Sadar'),(22,0,15,'Goalpara'),(23,0,16,'Golaghat'),(24,0,16,'Bokakhat'),(25,0,16,'Dhansari'),(26,0,17,'Hailakandi'),(27,0,18,'Jorhat'),(28,0,18,'Titabor'),(29,0,18,'Majuli'),(30,0,19,'Guwahati'),(31,0,19,'Rangia'),(33,0,21,'Diphu'),(34,0,21,'Bokajan'),(35,0,21,'Hamran'),(36,0,22,'Karimganj(Sadar)'),(37,0,23,'Kokrajhar'),(38,0,23,'Gossaigaon'),(39,0,23,'Parbatjhora'),(40,0,24,'North Lakhimpur'),(41,0,24,'Dhakuakhana'),(42,0,25,'Nagaon'),(43,0,25,'Hojai'),(44,0,25,'Kaliabor'),(45,0,26,'Nalbari'),(46,0,27,'Haflong'),(47,0,27,'Maibang'),(48,0,28,'Sivasagar'),(49,0,28,'Nazira'),(50,0,28,'Sonari'),(51,0,29,'Tezpur'),(52,0,29,'Biswanath Chariali  '),(53,0,29,'Gohpur'),(54,0,30,'Tinsukia (Sadar)'),(55,0,30,'Sadiya'),(56,0,30,'Margherita '),(57,0,31,'Bhergaon'),(58,0,31,'Udalguri');
/*!40000 ALTER TABLE `superintendent_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `email` varchar(255) default NULL,
  `district_office_id` bigint(20) default NULL,
  `superintendent_office_id` bigint(20) default NULL,
  `head_quarter_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK36EBCB2A90965C` (`district_office_id`),
  CONSTRAINT `FK36EBCB2A90965C` FOREIGN KEY (`district_office_id`) REFERENCES `district_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','user_hq','challan.HeadQuarterWorker','abc@abc.com',NULL,NULL,1),(2,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Bongaigaon','challan.DistrictOfficeWorker',NULL,1,NULL,NULL),(3,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Cachar','challan.DistrictOfficeWorker',NULL,2,NULL,NULL),(4,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Mushalpur','challan.DistrictOfficeWorker',NULL,3,NULL,NULL),(5,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Barpeta','challan.DistrictOfficeWorker',NULL,4,NULL,NULL),(6,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Darrang','challan.DistrictOfficeWorker',NULL,5,NULL,NULL),(7,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','ud_Kamrup','challan.DistrictOfficeWorker',NULL,6,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user1`
--

DROP TABLE IF EXISTS `user1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user1` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `email` varchar(255) default NULL,
  `superintendent_office_id` bigint(20) default NULL,
  `district_office_id` bigint(20) default NULL,
  `head_quarter_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK36EBCB1B8EC708` (`superintendent_office_id`),
  KEY `FK36EBCB2A90965C` (`district_office_id`),
  KEY `FK36EBCB94E9B1B4` (`head_quarter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user1`
--

LOCK TABLES `user1` WRITE;
/*!40000 ALTER TABLE `user1` DISABLE KEYS */;
INSERT INTO `user1` VALUES (1,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','user_hq','challan.HeadQuarterWorker',NULL,NULL,NULL,1),(15,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Tamulpur','challan.SuperintendentOfficeWorker',NULL,7,NULL,NULL),(14,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Salbari','challan.SuperintendentOfficeWorker',NULL,6,NULL,NULL),(13,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Mushalpur','challan.SuperintendentOfficeWorker',NULL,4,NULL,NULL),(12,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Cachar','challan.DistrictOfficeWorker',NULL,NULL,10,NULL),(11,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Bongaigaon','challan.DistrictOfficeWorker',NULL,NULL,9,NULL),(10,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Barpeta','challan.DistrictOfficeWorker',NULL,NULL,8,NULL),(9,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Musalpur','challan.DistrictOfficeWorker',NULL,NULL,7,NULL),(16,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Barpeta','challan.SuperintendentOfficeWorker',NULL,8,NULL,NULL),(17,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Darrang','challan.DistrictOfficeWorker',NULL,NULL,11,NULL),(18,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Dhemaji','challan.DistrictOfficeWorker',NULL,NULL,12,NULL),(19,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Dhubri','challan.DistrictOfficeWorker',NULL,NULL,13,NULL),(20,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Dibrugarh','challan.DistrictOfficeWorker',NULL,NULL,14,NULL),(21,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Goalpara','challan.DistrictOfficeWorker',NULL,NULL,15,NULL),(22,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Golaghat','challan.DistrictOfficeWorker',NULL,NULL,16,NULL),(23,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Hailakandi','challan.DistrictOfficeWorker',NULL,NULL,17,NULL),(24,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Jorhat','challan.DistrictOfficeWorker',NULL,NULL,18,NULL),(25,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Kamrup','challan.DistrictOfficeWorker',NULL,NULL,19,NULL),(27,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Diphu','challan.DistrictOfficeWorker',NULL,NULL,21,NULL),(28,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Karimganj','challan.DistrictOfficeWorker',NULL,NULL,22,NULL),(29,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Kokrajhar','challan.DistrictOfficeWorker',NULL,NULL,23,NULL),(30,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Lakhimpur','challan.DistrictOfficeWorker',NULL,NULL,24,NULL),(31,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Nagaon','challan.DistrictOfficeWorker',NULL,NULL,25,NULL),(32,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Nalbari','challan.DistrictOfficeWorker',NULL,NULL,26,NULL),(33,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Haflong','challan.DistrictOfficeWorker',NULL,NULL,27,NULL),(34,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Sivasagar','challan.DistrictOfficeWorker',NULL,NULL,28,NULL),(35,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Tezpur','challan.DistrictOfficeWorker',NULL,NULL,29,NULL),(36,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Tinsukia','challan.DistrictOfficeWorker',NULL,NULL,30,NULL),(37,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','UD_Udalguri','challan.DistrictOfficeWorker',NULL,NULL,31,NULL),(38,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Bajali','challan.SuperintendentOfficeWorker',NULL,9,NULL,NULL),(39,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Bongaigaon','challan.SuperintendentOfficeWorker',NULL,10,NULL,NULL),(40,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_NorthSalmara','challan.SuperintendentOfficeWorker',NULL,11,NULL,NULL),(41,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Bijni','challan.SuperintendentOfficeWorker',NULL,12,NULL,NULL),(42,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Silchar','challan.SuperintendentOfficeWorker',NULL,13,NULL,NULL),(43,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Lakhipur','challan.SuperintendentOfficeWorker',NULL,14,NULL,NULL),(44,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Darrang','challan.SuperintendentOfficeWorker',NULL,15,NULL,NULL),(45,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Dhemaji','challan.SuperintendentOfficeWorker',NULL,16,NULL,NULL),(46,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Jonai','challan.SuperintendentOfficeWorker',NULL,17,NULL,NULL),(47,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Bilasipara','challan.SuperintendentOfficeWorker',NULL,18,NULL,NULL),(48,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Dhubri','challan.SuperintendentOfficeWorker',NULL,19,NULL,NULL),(49,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_SouthSalmaraMankachar','challan.SuperintendentOfficeWorker',NULL,20,NULL,NULL),(50,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_DibrugarhSadar','challan.SuperintendentOfficeWorker',NULL,21,NULL,NULL),(51,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Goalpara','challan.SuperintendentOfficeWorker',NULL,22,NULL,NULL),(52,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Golaghat','challan.SuperintendentOfficeWorker',NULL,23,NULL,NULL),(53,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Bokakhat','challan.SuperintendentOfficeWorker',NULL,24,NULL,NULL),(54,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Dhansari','challan.SuperintendentOfficeWorker',NULL,25,NULL,NULL),(55,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Hailakandi','challan.SuperintendentOfficeWorker',NULL,17,NULL,NULL),(56,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Jorhat','challan.SuperintendentOfficeWorker',NULL,18,NULL,NULL),(57,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Kamrup','challan.SuperintendentOfficeWorker',NULL,19,NULL,NULL),(58,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Majuli','challan.SuperintendentOfficeWorker',NULL,29,NULL,NULL),(59,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Guwahati','challan.SuperintendentOfficeWorker',NULL,30,NULL,NULL),(60,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Rangia','challan.SuperintendentOfficeWorker',NULL,31,NULL,NULL),(62,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Diphu','challan.SuperintendentOfficeWorker',NULL,33,NULL,NULL),(63,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Bokajan','challan.SuperintendentOfficeWorker',NULL,34,NULL,NULL),(64,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Hamran','challan.SuperintendentOfficeWorker',NULL,35,NULL,NULL),(65,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_KarimganjSadar','challan.SuperintendentOfficeWorker',NULL,36,NULL,NULL),(66,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Kokrajhar','challan.SuperintendentOfficeWorker',NULL,37,NULL,NULL),(67,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Gossaigaon','challan.SuperintendentOfficeWorker',NULL,38,NULL,NULL),(68,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Parbatjhora','challan.SuperintendentOfficeWorker',NULL,39,NULL,NULL),(69,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_NorthLakhimpur','challan.SuperintendentOfficeWorker',NULL,40,NULL,NULL),(70,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Dhakuakhana','challan.SuperintendentOfficeWorker',NULL,41,NULL,NULL),(71,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Nagaon','challan.SuperintendentOfficeWorker',NULL,42,NULL,NULL),(72,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Hojai','challan.SuperintendentOfficeWorker',NULL,43,NULL,NULL),(73,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Kaliabor','challan.SuperintendentOfficeWorker',NULL,44,NULL,NULL),(74,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Nalbari','challan.SuperintendentOfficeWorker',NULL,45,NULL,NULL),(75,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Haflong','challan.SuperintendentOfficeWorker',NULL,46,NULL,NULL),(76,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Maibang','challan.SuperintendentOfficeWorker',NULL,47,NULL,NULL),(77,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Sivasagar','challan.SuperintendentOfficeWorker',NULL,48,NULL,NULL),(78,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Nazira','challan.SuperintendentOfficeWorker',NULL,49,NULL,NULL),(79,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Sonari','challan.SuperintendentOfficeWorker',NULL,50,NULL,NULL),(80,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Tezpur','challan.SuperintendentOfficeWorker',NULL,51,NULL,NULL),(81,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Biswanath','challan.SuperintendentOfficeWorker',NULL,52,NULL,NULL),(82,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Gohpur','challan.SuperintendentOfficeWorker',NULL,53,NULL,NULL),(83,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_TinsukiaSadar','challan.SuperintendentOfficeWorker',NULL,54,NULL,NULL),(84,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Sadiya','challan.SuperintendentOfficeWorker',NULL,55,NULL,NULL),(85,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Margherita','challan.SuperintendentOfficeWorker',NULL,56,NULL,NULL),(86,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Bhergaon','challan.SuperintendentOfficeWorker',NULL,57,NULL,NULL),(87,0,'\0','\0','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0','US_Udalguri','challan.SuperintendentOfficeWorker',NULL,58,NULL,NULL);
/*!40000 ALTER TABLE `user1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`role_id`,`user_id`),
  KEY `FK143BF46ABA855FEC` (`role_id`),
  KEY `FK143BF46A5FB023CC` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(4,3),(4,5),(4,6),(4,7),(4,13),(4,14),(4,15),(4,16),(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(4,44),(4,45),(4,46),(4,47),(4,48),(4,49),(4,50),(4,51),(4,52),(4,53),(4,54),(4,55),(4,56),(4,57),(4,58),(4,59),(4,60),(4,61),(4,62),(4,63),(4,64),(4,65),(4,66),(4,67),(4,68),(4,69),(4,70),(4,71),(4,72),(4,73),(4,74),(4,75),(4,76),(4,77),(4,78),(4,79),(4,80),(4,81),(4,82),(4,83),(4,84),(4,85),(4,86),(4,87);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-27  4:54:03
