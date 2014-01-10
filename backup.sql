-- MySQL dump 10.13  Distrib 5.1.72, for Win32 (ia32)
--
-- Host: localhost    Database: prod_osrs
-- ------------------------------------------------------
-- Server version	5.1.72-community

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
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `input_name` varchar(255) NOT NULL,
  `length` bigint(20) NOT NULL,
  `lnk_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `poster_class` varchar(255) NOT NULL,
  `poster_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8AF75923BE8D343C` (`lnk_id`),
  CONSTRAINT `FK8AF75923BE8D343C` FOREIGN KEY (`lnk_id`) REFERENCES `attachment_link` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment_link`
--

DROP TABLE IF EXISTS `attachment_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `reference_class` varchar(255) NOT NULL,
  `reference_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment_link`
--

LOCK TABLES `attachment_link` WRITE;
/*!40000 ALTER TABLE `attachment_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `district_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_created_id` bigint(20) DEFAULT NULL,
  `user_updated_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK597C48D64847CFA` (`user_updated_id`),
  KEY `FK597C48DCBA08216` (`district_id`),
  KEY `FK597C48DC7C493AD` (`user_created_id`),
  CONSTRAINT `FK597C48DC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK597C48D64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK597C48DCBA08216` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,0,'ASKACH','2013-12-03 10:23:13','Chandarpur',1,'2013-12-03 10:23:13','Chandarpur',1,1),(2,0,'ASJOTI','2013-12-03 10:23:13','Titabor',2,'2013-12-03 10:23:13','Titabor',1,1);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinates`
--

DROP TABLE IF EXISTS `coordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `accuracy` double NOT NULL,
  `altitude` double NOT NULL,
  `altitude_accuracy` double NOT NULL,
  `heading` double NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `speed` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinates`
--

LOCK TABLES `coordinates` WRITE;
/*!40000 ALTER TABLE `coordinates` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordinates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo`
--

DROP TABLE IF EXISTS `demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `college` int(11) NOT NULL,
  `district_name` varchar(255) NOT NULL,
  `primary_school` int(11) NOT NULL,
  `secondary_school` int(11) NOT NULL,
  `senior_secondary_school` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo`
--

LOCK TABLES `demo` WRITE;
/*!40000 ALTER TABLE `demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `user_created_id` bigint(20) DEFAULT NULL,
  `user_updated_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1139338EF971AE7E` (`state_id`),
  KEY `FK1139338E64847CFA` (`user_updated_id`),
  KEY `FK1139338EC7C493AD` (`user_created_id`),
  CONSTRAINT `FK1139338EC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1139338E64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1139338EF971AE7E` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,0,'ASKA','2013-12-03 10:23:13','Kamrup','2013-12-03 10:23:13','Kamrup',1,1,1),(2,0,'ASJO','2013-12-03 10:23:13','Jorhat','2013-12-03 10:23:13','Jorhat',1,1,1);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `college_total_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `edu1` varchar(255) DEFAULT NULL,
  `edu10` int(11) DEFAULT NULL,
  `edu11` int(11) DEFAULT NULL,
  `edu12` int(11) DEFAULT NULL,
  `edu13` int(11) DEFAULT NULL,
  `edu14` int(11) DEFAULT NULL,
  `edu15` int(11) DEFAULT NULL,
  `edu16` int(11) DEFAULT NULL,
  `edu17` int(11) DEFAULT NULL,
  `edu2` varchar(255) DEFAULT NULL,
  `edu3` int(11) DEFAULT NULL,
  `edu4` int(11) DEFAULT NULL,
  `edu5` int(11) DEFAULT NULL,
  `edu6` int(11) DEFAULT NULL,
  `edu7` int(11) DEFAULT NULL,
  `edu8` int(11) DEFAULT NULL,
  `edu9` int(11) DEFAULT NULL,
  `high_school_total_id` bigint(20) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `middle_total_id` bigint(20) DEFAULT NULL,
  `month` int(11) NOT NULL,
  `no_of_enrolment_in_college_id` bigint(20) DEFAULT NULL,
  `no_of_enrolment_in_other_tech_course_id` bigint(20) DEFAULT NULL,
  `pre_primary_total_id` bigint(20) DEFAULT NULL,
  `primary_total_id` bigint(20) DEFAULT NULL,
  `senior_sec_school_total_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEEAB67A83746EB9E` (`village_id`),
  KEY `FKEEAB67A848BAC236` (`pre_primary_total_id`),
  KEY `FKEEAB67A88FBC61E7` (`middle_total_id`),
  KEY `FKEEAB67A85E26EB0C` (`no_of_enrolment_in_other_tech_course_id`),
  KEY `FKEEAB67A864847CFA` (`user_updated_id`),
  KEY `FKEEAB67A8C7C493AD` (`user_created_id`),
  KEY `FKEEAB67A8B7C7BC25` (`college_total_id`),
  KEY `FKEEAB67A832D24CC0` (`no_of_enrolment_in_college_id`),
  KEY `FKEEAB67A8E0833A4B` (`high_school_total_id`),
  KEY `FKEEAB67A84AD09E6B` (`senior_sec_school_total_id`),
  KEY `FKEEAB67A8DF75D81A` (`primary_total_id`),
  CONSTRAINT `FKEEAB67A8DF75D81A` FOREIGN KEY (`primary_total_id`) REFERENCES `no_of_enrolment_in_edu` (`id`),
  CONSTRAINT `FKEEAB67A832D24CC0` FOREIGN KEY (`no_of_enrolment_in_college_id`) REFERENCES `no_of_enrolment_in_college` (`id`),
  CONSTRAINT `FKEEAB67A83746EB9E` FOREIGN KEY (`village_id`) REFERENCES `village` (`id`),
  CONSTRAINT `FKEEAB67A848BAC236` FOREIGN KEY (`pre_primary_total_id`) REFERENCES `no_of_enrolment_in_edu` (`id`),
  CONSTRAINT `FKEEAB67A84AD09E6B` FOREIGN KEY (`senior_sec_school_total_id`) REFERENCES `no_of_enrolment_in_edu` (`id`),
  CONSTRAINT `FKEEAB67A85E26EB0C` FOREIGN KEY (`no_of_enrolment_in_other_tech_course_id`) REFERENCES `no_of_enrolment_in_other_tech_course` (`id`),
  CONSTRAINT `FKEEAB67A864847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKEEAB67A88FBC61E7` FOREIGN KEY (`middle_total_id`) REFERENCES `no_of_enrolment_in_edu` (`id`),
  CONSTRAINT `FKEEAB67A8B7C7BC25` FOREIGN KEY (`college_total_id`) REFERENCES `no_of_enrolment_in_edu` (`id`),
  CONSTRAINT `FKEEAB67A8C7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKEEAB67A8E0833A4B` FOREIGN KEY (`high_school_total_id`) REFERENCES `no_of_enrolment_in_edu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,4,NULL,'2014-01-05 11:58:59',NULL,45,4,4,32,6,8,9,10,NULL,2,3,3,4,6,7,9,NULL,'2014-01-05 11:59:46',NULL,1,NULL,NULL,NULL,NULL,NULL,'CP',1,1,8,2014);
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_no_of_enrolment_in_edu`
--

DROP TABLE IF EXISTS `education_no_of_enrolment_in_edu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_no_of_enrolment_in_edu` (
  `education_college_id` bigint(20) DEFAULT NULL,
  `no_of_enrolment_in_edu_id` bigint(20) DEFAULT NULL,
  `education_high_school_id` bigint(20) DEFAULT NULL,
  `education_middle_id` bigint(20) DEFAULT NULL,
  `education_pre_primary_id` bigint(20) DEFAULT NULL,
  `education_primary_id` bigint(20) DEFAULT NULL,
  `education_senior_sec_school_id` bigint(20) DEFAULT NULL,
  KEY `FKB3BA63B837CC0C06` (`education_senior_sec_school_id`),
  KEY `FKB3BA63B898A84526` (`education_high_school_id`),
  KEY `FKB3BA63B8751B8074` (`education_middle_id`),
  KEY `FKB3BA63B8166DC760` (`no_of_enrolment_in_edu_id`),
  KEY `FKB3BA63B84F930600` (`education_college_id`),
  KEY `FKB3BA63B8C372D951` (`education_pre_primary_id`),
  KEY `FKB3BA63B86B2E7DB5` (`education_primary_id`),
  CONSTRAINT `FKB3BA63B86B2E7DB5` FOREIGN KEY (`education_primary_id`) REFERENCES `education` (`id`),
  CONSTRAINT `FKB3BA63B8166DC760` FOREIGN KEY (`no_of_enrolment_in_edu_id`) REFERENCES `no_of_enrolment_in_edu` (`id`),
  CONSTRAINT `FKB3BA63B837CC0C06` FOREIGN KEY (`education_senior_sec_school_id`) REFERENCES `education` (`id`),
  CONSTRAINT `FKB3BA63B84F930600` FOREIGN KEY (`education_college_id`) REFERENCES `education` (`id`),
  CONSTRAINT `FKB3BA63B8751B8074` FOREIGN KEY (`education_middle_id`) REFERENCES `education` (`id`),
  CONSTRAINT `FKB3BA63B898A84526` FOREIGN KEY (`education_high_school_id`) REFERENCES `education` (`id`),
  CONSTRAINT `FKB3BA63B8C372D951` FOREIGN KEY (`education_pre_primary_id`) REFERENCES `education` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_no_of_enrolment_in_edu`
--

LOCK TABLES `education_no_of_enrolment_in_edu` WRITE;
/*!40000 ALTER TABLE `education_no_of_enrolment_in_edu` DISABLE KEYS */;
/*!40000 ALTER TABLE `education_no_of_enrolment_in_edu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_asset`
--

DROP TABLE IF EXISTS `file_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_asset` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner_group` varchar(7) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7ED2366D1DC72AF6` (`user_id`),
  CONSTRAINT `FK7ED2366D1DC72AF6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_asset`
--

LOCK TABLES `file_asset` WRITE;
/*!40000 ALTER TABLE `file_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_asset_user`
--

DROP TABLE IF EXISTS `file_asset_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_asset_user` (
  `file_asset_share_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  KEY `FKD9916A5D6A11A45` (`file_asset_share_id`),
  KEY `FKD9916A5D1DC72AF6` (`user_id`),
  CONSTRAINT `FKD9916A5D1DC72AF6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKD9916A5D6A11A45` FOREIGN KEY (`file_asset_share_id`) REFERENCES `file_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_asset_user`
--

LOCK TABLES `file_asset_user` WRITE;
/*!40000 ALTER TABLE `file_asset_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_asset_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_position`
--

DROP TABLE IF EXISTS `geo_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `coords_id` bigint(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF483E6573589C2DE` (`coords_id`),
  CONSTRAINT `FKF483E6573589C2DE` FOREIGN KEY (`coords_id`) REFERENCES `coordinates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_position`
--

LOCK TABLES `geo_position` WRITE;
/*!40000 ALTER TABLE `geo_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_panchayat`
--

DROP TABLE IF EXISTS `gram_panchayat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gram_panchayat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `block_id` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_created_id` bigint(20) DEFAULT NULL,
  `user_updated_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB18D074564847CFA` (`user_updated_id`),
  KEY `FKB18D0745C7C493AD` (`user_created_id`),
  KEY `FKB18D0745824FDCFE` (`block_id`),
  CONSTRAINT `FKB18D0745824FDCFE` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`),
  CONSTRAINT `FKB18D074564847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKB18D0745C7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_panchayat`
--

LOCK TABLES `gram_panchayat` WRITE;
/*!40000 ALTER TABLE `gram_panchayat` DISABLE KEYS */;
INSERT INTO `gram_panchayat` VALUES (1,0,2,'01','2013-12-03 10:23:13','Rangjan','2013-12-03 10:23:13','Rangjan',1,1),(2,0,2,'02','2013-12-03 10:23:13','Bebejia','2013-12-03 10:23:13','Bebejia',1,1),(3,0,2,'03','2013-12-03 10:23:13','Bokahola','2013-12-03 10:23:13','Bokahola',1,1),(4,0,2,'04','2013-12-03 10:23:13','Charaipani','2013-12-03 10:23:13','Charaipani',1,1),(5,0,2,'05','2013-12-03 10:23:13','Kachukhat','2013-12-03 10:23:13','Kachukhat',1,1),(6,0,2,'06','2013-12-03 10:23:13','Turung','2013-12-03 10:23:13','Turung',1,1),(7,0,2,'07','2013-12-03 10:23:13','Birinasyak','2013-12-03 10:23:13','Birinasyak',1,1),(8,0,2,'08','2013-12-03 10:23:13','Namchungi','2013-12-03 10:23:13','Namchungi',1,1),(9,0,2,'09','2013-12-03 10:23:13','Melamati','2013-12-03 10:23:13','Melamati',1,1),(10,0,2,'10','2013-12-03 10:23:13','Tengajan','2013-12-03 10:23:13','Tengajan',1,1),(11,0,2,'11','2013-12-03 10:23:13','Rajabahar','2013-12-03 10:23:13','Rajabahar',1,1),(12,0,2,'12','2013-12-03 10:23:13','Madhapur','2013-12-03 10:23:13','Madhapur',1,1),(13,0,2,'13','2013-12-03 10:23:13','Ekarani','2013-12-03 10:23:13','Ekarani',1,1),(14,0,2,'14','2013-12-03 10:23:13','Borhola','2013-12-03 10:23:13','Borhola',1,1),(15,0,2,'15','2013-12-03 10:23:13','Bekajan','2013-12-03 10:23:13','Bekajan',1,1),(16,0,2,'16','2013-12-03 10:23:13','Rajgangjuri','2013-12-03 10:23:13','Rajgangjuri',1,1),(17,0,1,'01','2013-12-03 10:23:13','Amsing','2013-12-03 10:23:13','Amsing',1,1),(18,0,1,'02','2013-12-03 10:23:13','Panikhaity','2013-12-03 10:23:13','Panikhaity',1,1),(19,0,1,'04','2013-12-03 10:23:13','Pachim Mayong','2013-12-03 10:23:13','Pachim Mayong',1,1),(20,0,1,'03','2013-12-03 10:23:13','Chandarpur','2013-12-03 10:23:13','Chandarpur',1,1);
/*!40000 ALTER TABLE `gram_panchayat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_and_family_welfare`
--

DROP TABLE IF EXISTS `health_and_family_welfare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `health_and_family_welfare` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `ayur_center_id` bigint(20) DEFAULT NULL,
  `comm_health_center_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `family_wel_center_id` bigint(20) DEFAULT NULL,
  `gov_dispensaries_id` bigint(20) DEFAULT NULL,
  `gov_hospitals_id` bigint(20) DEFAULT NULL,
  `health39` int(11) DEFAULT NULL,
  `health40` int(11) DEFAULT NULL,
  `health41` int(11) DEFAULT NULL,
  `health42` int(11) DEFAULT NULL,
  `health43` int(11) DEFAULT NULL,
  `health44` int(11) DEFAULT NULL,
  `health45` int(11) DEFAULT NULL,
  `health46` int(11) DEFAULT NULL,
  `health47` int(11) DEFAULT NULL,
  `health48` int(11) DEFAULT NULL,
  `health49` int(11) DEFAULT NULL,
  `health50` int(11) DEFAULT NULL,
  `health51` int(11) DEFAULT NULL,
  `health52` int(11) DEFAULT NULL,
  `health53` int(11) DEFAULT NULL,
  `health54` int(11) DEFAULT NULL,
  `health55` int(11) DEFAULT NULL,
  `health56` int(11) DEFAULT NULL,
  `health57` int(11) DEFAULT NULL,
  `health58` int(11) DEFAULT NULL,
  `health59` int(11) DEFAULT NULL,
  `health60` int(11) DEFAULT NULL,
  `health61` int(11) DEFAULT NULL,
  `health62` int(11) DEFAULT NULL,
  `health63` int(11) DEFAULT NULL,
  `health64` int(11) DEFAULT NULL,
  `health65` int(11) DEFAULT NULL,
  `health66` int(11) DEFAULT NULL,
  `health67` int(11) DEFAULT NULL,
  `health68` int(11) DEFAULT NULL,
  `health69` int(11) DEFAULT NULL,
  `health70` int(11) DEFAULT NULL,
  `health71` int(11) DEFAULT NULL,
  `homeo_cells_id` bigint(20) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `other_centers_id` bigint(20) DEFAULT NULL,
  `prim_health_center_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `sub_center_id` bigint(20) DEFAULT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK683F5CDC3746EB9E` (`village_id`),
  KEY `FK683F5CDC7E858739` (`family_wel_center_id`),
  KEY `FK683F5CDC2739C5FB` (`other_centers_id`),
  KEY `FK683F5CDCBEDA4FE8` (`homeo_cells_id`),
  KEY `FK683F5CDC183B5725` (`comm_health_center_id`),
  KEY `FK683F5CDC64847CFA` (`user_updated_id`),
  KEY `FK683F5CDC3C3BCACB` (`prim_health_center_id`),
  KEY `FK683F5CDCE547647B` (`gov_dispensaries_id`),
  KEY `FK683F5CDCFB445936` (`sub_center_id`),
  KEY `FK683F5CDCC7C493AD` (`user_created_id`),
  KEY `FK683F5CDCB2C560E2` (`gov_hospitals_id`),
  KEY `FK683F5CDC75AB118B` (`ayur_center_id`),
  CONSTRAINT `FK683F5CDC75AB118B` FOREIGN KEY (`ayur_center_id`) REFERENCES `hospital` (`id`),
  CONSTRAINT `FK683F5CDC183B5725` FOREIGN KEY (`comm_health_center_id`) REFERENCES `hospital` (`id`),
  CONSTRAINT `FK683F5CDC2739C5FB` FOREIGN KEY (`other_centers_id`) REFERENCES `hospital` (`id`),
  CONSTRAINT `FK683F5CDC3746EB9E` FOREIGN KEY (`village_id`) REFERENCES `village` (`id`),
  CONSTRAINT `FK683F5CDC3C3BCACB` FOREIGN KEY (`prim_health_center_id`) REFERENCES `hospital` (`id`),
  CONSTRAINT `FK683F5CDC64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK683F5CDC7E858739` FOREIGN KEY (`family_wel_center_id`) REFERENCES `hospital` (`id`),
  CONSTRAINT `FK683F5CDCB2C560E2` FOREIGN KEY (`gov_hospitals_id`) REFERENCES `hospital` (`id`),
  CONSTRAINT `FK683F5CDCBEDA4FE8` FOREIGN KEY (`homeo_cells_id`) REFERENCES `hospital` (`id`),
  CONSTRAINT `FK683F5CDCC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK683F5CDCE547647B` FOREIGN KEY (`gov_dispensaries_id`) REFERENCES `hospital` (`id`),
  CONSTRAINT `FK683F5CDCFB445936` FOREIGN KEY (`sub_center_id`) REFERENCES `hospital` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_and_family_welfare`
--

LOCK TABLES `health_and_family_welfare` WRITE;
/*!40000 ALTER TABLE `health_and_family_welfare` DISABLE KEYS */;
INSERT INTO `health_and_family_welfare` VALUES (1,1,7,5,'2014-01-05 11:59:46',6,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,'2014-01-05 11:59:47',1,9,3,'CP',4,1,1,8,2014);
/*!40000 ALTER TABLE `health_and_family_welfare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `no_of_beds` int(11) DEFAULT NULL,
  `no_of_doctors` int(11) DEFAULT NULL,
  `no_of_female_cases_treated` int(11) DEFAULT NULL,
  `no_of_male_cases_treated` int(11) DEFAULT NULL,
  `no_of_nurses` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEDE6FE3A64847CFA` (`user_updated_id`),
  KEY `FKEDE6FE3AC7C493AD` (`user_created_id`),
  CONSTRAINT `FKEDE6FE3AC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKEDE6FE3A64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,0,'2014-01-05 11:59:46','2014-01-05 11:59:46',NULL,NULL,NULL,NULL,NULL,'govHospitals',1,1),(2,0,'2014-01-05 11:59:46','2014-01-05 11:59:46',NULL,NULL,NULL,NULL,NULL,'govDispensaries',1,1),(3,0,'2014-01-05 11:59:46','2014-01-05 11:59:46',NULL,NULL,NULL,NULL,NULL,'primHealthCenter',1,1),(4,0,'2014-01-05 11:59:46','2014-01-05 11:59:46',NULL,NULL,NULL,NULL,NULL,'subCenter',1,1),(5,0,'2014-01-05 11:59:46','2014-01-05 11:59:46',NULL,NULL,NULL,NULL,NULL,'commHealthCenter',1,1),(6,0,'2014-01-05 11:59:46','2014-01-05 11:59:46',NULL,NULL,NULL,NULL,NULL,'familyWelCenter',1,1),(7,0,'2014-01-05 11:59:46','2014-01-05 11:59:46',NULL,NULL,NULL,NULL,NULL,'ayurCenter',1,1),(8,0,'2014-01-05 11:59:46','2014-01-05 11:59:46',NULL,NULL,NULL,NULL,NULL,'homeoCells',1,1),(9,0,'2014-01-05 11:59:46','2014-01-05 11:59:46',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_progress_records`
--

DROP TABLE IF EXISTS `in_progress_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `in_progress_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAA2BAE0A3746EB9E` (`village_id`),
  KEY `FKAA2BAE0A64847CFA` (`user_updated_id`),
  KEY `FKAA2BAE0AC7C493AD` (`user_created_id`),
  CONSTRAINT `FKAA2BAE0AC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKAA2BAE0A3746EB9E` FOREIGN KEY (`village_id`) REFERENCES `village` (`id`),
  CONSTRAINT `FKAA2BAE0A64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_progress_records`
--

LOCK TABLES `in_progress_records` WRITE;
/*!40000 ALTER TABLE `in_progress_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `in_progress_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infrastructural_facilities`
--

DROP TABLE IF EXISTS `infrastructural_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infrastructural_facilities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `isf1` varchar(255) DEFAULT NULL,
  `isf10` int(11) DEFAULT NULL,
  `isf11` int(11) DEFAULT NULL,
  `isf12` int(11) DEFAULT NULL,
  `isf13` int(11) DEFAULT NULL,
  `isf14` int(11) DEFAULT NULL,
  `isf15` int(11) DEFAULT NULL,
  `isf16` int(11) DEFAULT NULL,
  `isf17` int(11) DEFAULT NULL,
  `isf18` int(11) DEFAULT NULL,
  `isf19` int(11) DEFAULT NULL,
  `isf2` varchar(255) DEFAULT NULL,
  `isf20` int(11) DEFAULT NULL,
  `isf21` int(11) DEFAULT NULL,
  `isf22` int(11) DEFAULT NULL,
  `isf23` int(11) DEFAULT NULL,
  `isf24` int(11) DEFAULT NULL,
  `isf3` int(11) DEFAULT NULL,
  `isf4` int(11) DEFAULT NULL,
  `isf5` int(11) DEFAULT NULL,
  `isf6` int(11) DEFAULT NULL,
  `isf7` int(11) DEFAULT NULL,
  `isf8` int(11) DEFAULT NULL,
  `isf9` int(11) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1223CB533746EB9E` (`village_id`),
  KEY `FK1223CB5364847CFA` (`user_updated_id`),
  KEY `FK1223CB53C7C493AD` (`user_created_id`),
  CONSTRAINT `FK1223CB53C7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1223CB533746EB9E` FOREIGN KEY (`village_id`) REFERENCES `village` (`id`),
  CONSTRAINT `FK1223CB5364847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infrastructural_facilities`
--

LOCK TABLES `infrastructural_facilities` WRITE;
/*!40000 ALTER TABLE `infrastructural_facilities` DISABLE KEYS */;
INSERT INTO `infrastructural_facilities` VALUES (1,1,'2014-01-05 11:59:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-01-05 11:59:47',1,'CP',1,1,8,2014);
/*!40000 ALTER TABLE `infrastructural_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_of_enrolment_in_college`
--

DROP TABLE IF EXISTS `no_of_enrolment_in_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_of_enrolment_in_college` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `no_of_new_entrants_entry_boys` int(11) DEFAULT NULL,
  `no_of_new_entrants_entry_girls` int(11) DEFAULT NULL,
  `no_of_student_attending_boys` int(11) DEFAULT NULL,
  `no_of_student_attending_girls` int(11) DEFAULT NULL,
  `no_of_student_discontinued_studies_boys` int(11) DEFAULT NULL,
  `no_of_student_discontinued_studies_girls` int(11) DEFAULT NULL,
  `no_of_student_enrolled_boys` int(11) DEFAULT NULL,
  `no_of_student_enrolled_girls` int(11) DEFAULT NULL,
  `no_of_students_enrolled_in_university_boys` int(11) DEFAULT NULL,
  `no_of_students_enrolled_in_university_girls` int(11) DEFAULT NULL,
  `reason_of_discontinuation_economic` int(11) DEFAULT NULL,
  `reason_of_discontinuation_non_economic` int(11) DEFAULT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC5F025A23746EB9E` (`village_id`),
  KEY `FKC5F025A264847CFA` (`user_updated_id`),
  KEY `FKC5F025A2C7C493AD` (`user_created_id`),
  CONSTRAINT `FKC5F025A2C7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKC5F025A23746EB9E` FOREIGN KEY (`village_id`) REFERENCES `village` (`id`),
  CONSTRAINT `FKC5F025A264847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_of_enrolment_in_college`
--

LOCK TABLES `no_of_enrolment_in_college` WRITE;
/*!40000 ALTER TABLE `no_of_enrolment_in_college` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_of_enrolment_in_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_of_enrolment_in_edu`
--

DROP TABLE IF EXISTS `no_of_enrolment_in_edu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_of_enrolment_in_edu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `institution_type` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `new_entrants_boys` int(11) DEFAULT NULL,
  `new_entrants_girls` int(11) DEFAULT NULL,
  `no_child_never_enrolled` int(11) DEFAULT NULL,
  `no_of_teacher_female` int(11) DEFAULT NULL,
  `no_of_teacher_male` int(11) DEFAULT NULL,
  `reason_of_discontinuation_economic` int(11) DEFAULT NULL,
  `reason_of_discontinuation_non_economic` int(11) DEFAULT NULL,
  `student_attending_boys` int(11) DEFAULT NULL,
  `student_attending_girls` int(11) DEFAULT NULL,
  `student_discontinued_studies_boys` int(11) DEFAULT NULL,
  `student_discontinued_studies_girls` int(11) DEFAULT NULL,
  `student_enrolled_boys` int(11) DEFAULT NULL,
  `student_enrolled_girls` int(11) DEFAULT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK68DC09413746EB9E` (`village_id`),
  KEY `FK68DC094164847CFA` (`user_updated_id`),
  KEY `FK68DC0941C7C493AD` (`user_created_id`),
  CONSTRAINT `FK68DC0941C7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK68DC09413746EB9E` FOREIGN KEY (`village_id`) REFERENCES `village` (`id`),
  CONSTRAINT `FK68DC094164847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_of_enrolment_in_edu`
--

LOCK TABLES `no_of_enrolment_in_edu` WRITE;
/*!40000 ALTER TABLE `no_of_enrolment_in_edu` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_of_enrolment_in_edu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_of_enrolment_in_other_tech_course`
--

DROP TABLE IF EXISTS `no_of_enrolment_in_other_tech_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_of_enrolment_in_other_tech_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `no_of_student_enrolled_in_agri_msc_boys` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_agri_msc_girls` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_be_btech_boys` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_be_btech_girls` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_bvsc_boys` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_bvsc_girls` int(11) DEFAULT NULL,
  `no_of_student_enrolled_initiboys` int(11) DEFAULT NULL,
  `no_of_student_enrolled_initigirls` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_mbbs_boys` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_mbbs_girls` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_polytech_deploma_boys` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_polytech_deploma_girls` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_vocational_course_boys` int(11) DEFAULT NULL,
  `no_of_student_enrolled_in_vocational_course_girls` int(11) DEFAULT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCFEEDD803746EB9E` (`village_id`),
  KEY `FKCFEEDD8064847CFA` (`user_updated_id`),
  KEY `FKCFEEDD80C7C493AD` (`user_created_id`),
  CONSTRAINT `FKCFEEDD80C7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKCFEEDD803746EB9E` FOREIGN KEY (`village_id`) REFERENCES `village` (`id`),
  CONSTRAINT `FKCFEEDD8064847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_of_enrolment_in_other_tech_course`
--

LOCK TABLES `no_of_enrolment_in_other_tech_course` WRITE;
/*!40000 ALTER TABLE `no_of_enrolment_in_other_tech_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_of_enrolment_in_other_tech_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_code`
--

DROP TABLE IF EXISTS `registration_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `token` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_code`
--

LOCK TABLES `registration_code` WRITE;
/*!40000 ALTER TABLE `registration_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authority` (`authority`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,0,'ROLE_ADMIN'),(2,0,'ROLE_STATE_ADMIN'),(3,0,'ROLE_DATA_ENTRY_OPERATOR'),(4,0,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_created_id` bigint(20) DEFAULT NULL,
  `user_updated_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK68AC49164847CFA` (`user_updated_id`),
  KEY `FK68AC491C7C493AD` (`user_created_id`),
  CONSTRAINT `FK68AC491C7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK68AC49164847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,0,'AS','2013-12-03 10:23:13','Assam','2013-12-03 10:23:13','Assam',1,1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `block_id` bigint(20) DEFAULT NULL,
  `district_id` bigint(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `panchayat_id` bigint(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `user_profile_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK36EBCB854AAB27` (`user_profile_id`),
  KEY `FK36EBCBF971AE7E` (`state_id`),
  KEY `FK36EBCB347B7C67` (`panchayat_id`),
  KEY `FK36EBCBCBA08216` (`district_id`),
  KEY `FK36EBCB824FDCFE` (`block_id`),
  CONSTRAINT `FK36EBCB824FDCFE` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`),
  CONSTRAINT `FK36EBCB347B7C67` FOREIGN KEY (`panchayat_id`) REFERENCES `gram_panchayat` (`id`),
  CONSTRAINT `FK36EBCB854AAB27` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`),
  CONSTRAINT `FK36EBCBCBA08216` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `FK36EBCBF971AE7E` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'\0','\0',NULL,NULL,'admin@damyant.com','',NULL,'741695438818797a70f9866d0251b87b83f343920dc214ebc6b5f3bdfcb284f1','\0',NULL,1,'user_admin'),(2,0,'\0','\0',NULL,NULL,'admin@damyant.com','',NULL,'741695438818797a70f9866d0251b87b83f343920dc214ebc6b5f3bdfcb284f1','\0',NULL,NULL,'user_hq'),(3,0,'\0','\0',NULL,NULL,'admin@damyant.com','',NULL,'5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0',NULL,NULL,'user_deo'),(4,0,'\0','\0',NULL,NULL,'admin@damyant.com','',NULL,'5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0',NULL,NULL,'user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `address` longtext,
  `city` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `home_phone` varchar(10) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `middle_name` varchar(64) DEFAULT NULL,
  `mobile_phone` varchar(10) DEFAULT NULL,
  `postal_code` varchar(40) DEFAULT NULL,
  `profile_name` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `street` varchar(64) DEFAULT NULL,
  `work_phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,1,NULL,NULL,NULL,'admin',NULL,NULL,'2013-12-06 12:42:20',NULL,'1234567890',NULL,'user_admin',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
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
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK143BF46A789C6716` (`role_id`),
  KEY `FK143BF46A1DC72AF6` (`user_id`),
  CONSTRAINT `FK143BF46A1DC72AF6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK143BF46A789C6716` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `village`
--

DROP TABLE IF EXISTS `village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `village` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `gram_panchayat_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(255) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1B70A4AC64847CFA` (`user_updated_id`),
  KEY `FK1B70A4ACC7C493AD` (`user_created_id`),
  KEY `FK1B70A4ACD5FA214F` (`gram_panchayat_id`),
  CONSTRAINT `FK1B70A4AC64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1B70A4ACC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1B70A4ACD5FA214F` FOREIGN KEY (`gram_panchayat_id`) REFERENCES `gram_panchayat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `village`
--

LOCK TABLES `village` WRITE;
/*!40000 ALTER TABLE `village` DISABLE KEYS */;
INSERT INTO `village` VALUES (1,0,'293947','2013-12-03 10:23:13','No.1 Moran Gaon',1,'2013-12-03 10:23:13','No.1 Moran Gaon',1,1),(2,0,'293948','2013-12-03 10:23:13','No.2 Moran Gaon',1,'2013-12-03 10:23:13','No.2 Moran Gaon',1,1),(3,0,'293949','2013-12-03 10:23:13','Karangakhat Gaon',1,'2013-12-03 10:23:13','Karangakhat Gaon',1,1),(4,0,'293950','2013-12-03 10:23:13','Buruk Boruah Gaon',1,'2013-12-03 10:23:13','Buruk Boruah Gaon',1,1),(5,0,'293951','2013-12-03 10:23:13','Sonari Gaon',1,'2013-12-03 10:23:13','Sonari Gaon',1,1),(6,0,'293952','2013-12-03 10:23:13','Khatuwal Gaon',1,'2013-12-03 10:23:13','Khatuwal Gaon',1,1),(7,0,'293945','2013-12-03 10:23:13','Hatichungi Moran Gaon',1,'2013-12-03 10:23:13','Hatichungi Moran Gaon',1,1),(8,0,'293946','2013-12-03 10:23:13','Chowdang Gaon',1,'2013-12-03 10:23:13','Chowdang Gaon',1,1),(9,0,'293953','2013-12-03 10:23:13','Hitachungi Gaon',1,'2013-12-03 10:23:13','Hitachungi Gaon',1,1),(10,0,'293954','2013-12-03 10:23:13','Dolakasaria Gaon',1,'2013-12-03 10:23:13','Dolakasaria Gaon',1,1),(11,0,'293990','2013-12-03 10:23:13','Deogharia Lakheraj',2,'2013-12-03 10:23:13','Deogharia Lakheraj',1,1),(12,0,'293991','2013-12-03 10:23:13','Deogharia Grant',2,'2013-12-03 10:23:13','Deogharia Grant',1,1),(13,0,'293992','2013-12-03 10:23:13','Deogharia Gaon',2,'2013-12-03 10:23:13','Deogharia Gaon',1,1),(14,0,'293958','2013-12-03 10:23:13','Handique Gaon',2,'2013-12-03 10:23:13','Handique Gaon',1,1),(15,0,'293959','2013-12-03 10:23:13','Dakhinapat Gaon',2,'2013-12-03 10:23:13','Dakhinapat Gaon',1,1),(16,0,'293960','2013-12-03 10:23:13','No.2 Mejenga Grant',2,'2013-12-03 10:23:13','No.2 Mejenga Grant',1,1),(17,0,'293961','2013-12-03 10:23:13','No.1 Mejenga Grant',2,'2013-12-03 10:23:13','No.1 Mejenga Grant',1,1),(18,0,'293962','2013-12-03 10:23:13','Bebejia Gaon',2,'2013-12-03 10:23:13','Bebejia Gaon',1,1),(19,0,'293975','2013-12-03 10:23:13','Tanti Gaon',2,'2013-12-03 10:23:13','Tanti Gaon',1,1),(20,0,'293957','2013-12-03 10:23:13','Borera Gaon',2,'2013-12-03 10:23:13','Borera Gaon',1,1),(21,0,'294008','2013-12-03 10:23:13','Bandar Chalia T.E.',4,'2013-12-03 10:23:13','Bandar Chalia T.E.',1,1),(22,0,'294009','2013-12-03 10:23:13','Swarnapur',4,'2013-12-03 10:23:13','Swarnapur',1,1),(23,0,'294013','2013-12-03 10:23:13','No.4 Charaipani Grant',4,'2013-12-03 10:23:13','No.4 Charaipani Grant',1,1),(24,0,'294014','2013-12-03 10:23:13','No.3 Charaipani Grant',4,'2013-12-03 10:23:13','No.3 Charaipani Grant',1,1),(25,0,'294015','2013-12-03 10:23:13','Bhagyalakhi',4,'2013-12-03 10:23:13','Bhagyalakhi',1,1),(26,0,'294011','2013-12-03 10:23:13','No.80 Grant',4,'2013-12-03 10:23:13','No.80 Grant',1,1),(27,0,'294017','2013-12-03 10:23:13','No.2 Charaipani Grant',4,'2013-12-03 10:23:13','No.2 Charaipani Grant',1,1),(28,0,'294022','2013-12-03 10:23:13','Charaipani Bosabari',4,'2013-12-03 10:23:13','Charaipani Bosabari',1,1),(29,0,'294020','2013-12-03 10:23:13','No.1 Charaipani Grant',4,'2013-12-03 10:23:13','No.1 Charaipani Grant',1,1),(30,0,'293998','2013-12-03 10:23:13','Gohainjan Grant',4,'2013-12-03 10:23:13','Gohainjan Grant',1,1),(31,0,'294003','2013-12-03 10:23:13','Adhalkata Gaon',5,'2013-12-03 10:23:13','Adhalkata Gaon',1,1),(32,0,'294004','2013-12-03 10:23:13','Khamjongia',5,'2013-12-03 10:23:13','Khamjongia',1,1),(33,0,'294006','2013-12-03 10:23:13','Paninora Gaon',5,'2013-12-03 10:23:13','Paninora Gaon',1,1),(34,0,'294007','2013-12-03 10:23:13','Bandar Chalia Gaon',5,'2013-12-03 10:23:13','Bandar Chalia Gaon',1,1),(35,0,'294002','2013-12-03 10:23:13','Khariakatia Gaon',5,'2013-12-03 10:23:13','Khariakatia Gaon',1,1),(36,0,'294005','2013-12-03 10:23:13','Karsoli Gaon',5,'2013-12-03 10:23:13','Karsoli Gaon',1,1),(37,0,'293999','2013-12-03 10:23:13','Kachukhat Lakheraj',5,'2013-12-03 10:23:13','Kachukhat Lakheraj',1,1),(38,0,'294023','2013-12-03 10:23:13','Mohimabari Gaon',6,'2013-12-03 10:23:13','Mohimabari Gaon',1,1),(39,0,'293993','2013-12-03 10:23:13','No.44 Turung Grant',6,'2013-12-03 10:23:13','No.44 Turung Grant',1,1),(40,0,'294010','2013-12-03 10:23:13','Hatipara Grant',6,'2013-12-03 10:23:13','Hatipara Grant',1,1),(41,0,'294012','2013-12-03 10:23:13','No.56 Grant',6,'2013-12-03 10:23:13','No.56 Grant',1,1),(42,0,'293979','2013-12-03 10:23:13','Dafalating Grant',7,'2013-12-03 10:23:13','Dafalating Grant',1,1),(43,0,'293980','2013-12-03 10:23:13','Dafalating T.E.',7,'2013-12-03 10:23:13','Dafalating T.E.',1,1),(44,0,'293981','2013-12-03 10:23:13','Mandal Gaon',7,'2013-12-03 10:23:13','Mandal Gaon',1,1),(45,0,'293983','2013-12-03 10:23:13','Moria Sayek',7,'2013-12-03 10:23:13','Moria Sayek',1,1),(46,0,'293984','2013-12-03 10:23:13','Birina Sayek',7,'2013-12-03 10:23:13','Birina Sayek',1,1),(47,0,'293987','2013-12-03 10:23:13','Thengal Gaon',7,'2013-12-03 10:23:13','Thengal Gaon',1,1),(48,0,'293988','2013-12-03 10:23:13','Bongal Gaon',7,'2013-12-03 10:23:13','Bongal Gaon',1,1),(49,0,'293963','2013-12-03 10:23:13','Bogar Gaon',8,'2013-12-03 10:23:13','Bogar Gaon',1,1),(50,0,'293964','2013-12-03 10:23:13','Baliporia Gaon',8,'2013-12-03 10:23:13','Baliporia Gaon',1,1),(51,0,'293965','2013-12-03 10:23:13','Kuhum Grant',8,'2013-12-03 10:23:13','Kuhum Grant',1,1),(52,0,'293966','2013-12-03 10:23:13','Kuhum Pukhuri',8,'2013-12-03 10:23:13','Kuhum Pukhuri',1,1),(53,0,'293967','2013-12-03 10:23:13','Borbam Chungi',8,'2013-12-03 10:23:13','Borbam Chungi',1,1),(54,0,'293968','2013-12-03 10:23:13','Chungi Gaon',8,'2013-12-03 10:23:13','Chungi Gaon',1,1),(55,0,'293969','2013-12-03 10:23:13','Namchungi',8,'2013-12-03 10:23:13','Namchungi',1,1),(56,0,'293970','2013-12-03 10:23:13','Mohanating Grant',8,'2013-12-03 10:23:13','Mohanating Grant',1,1),(57,0,'293985','2013-12-03 10:23:13','Kakatikuri',9,'2013-12-03 10:23:13','Kakatikuri',1,1),(58,0,'293976','2013-12-03 10:23:13','Potia Gaon',9,'2013-12-03 10:23:13','Potia Gaon',1,1),(59,0,'293977','2013-12-03 10:23:13','Kachari Gaon',9,'2013-12-03 10:23:13','Kachari Gaon',1,1),(60,0,'293978','2013-12-03 10:23:13','Garia Chalang',9,'2013-12-03 10:23:13','Garia Chalang',1,1),(61,0,'293971','2013-12-03 10:23:13','Dafalating Habi',9,'2013-12-03 10:23:13','Dafalating Habi',1,1),(62,0,'293972','2013-12-03 10:23:13','Khatuwal Gaon',9,'2013-12-03 10:23:13','Khatuwal Gaon',1,1),(63,0,'293973','2013-12-03 10:23:13','Chakial Gaon',9,'2013-12-03 10:23:13','Chakial Gaon',1,1),(64,0,'293974','2013-12-03 10:23:13','Alengi Gaon',9,'2013-12-03 10:23:13','Alengi Gaon',1,1),(65,0,'294027','2013-12-03 10:23:13','No.2 Madhapur',10,'2013-12-03 10:23:13','No.2 Madhapur',1,1),(66,0,'294035','2013-12-03 10:23:13','Tipomia Habi',10,'2013-12-03 10:23:13','Tipomia Habi',1,1),(67,0,'294036','2013-12-03 10:23:13','No.1 Madhapur',10,'2013-12-03 10:23:13','No.1 Madhapur',1,1),(68,0,'294037','2013-12-03 10:23:13','Rajabari Panjan',10,'2013-12-03 10:23:13','Rajabari Panjan',1,1),(69,0,'294016','2013-12-03 10:23:13','Medeluajan',10,'2013-12-03 10:23:13','Medeluajan',1,1),(70,0,'294018','2013-12-03 10:23:13','Phulbari',10,'2013-12-03 10:23:13','Phulbari',1,1),(71,0,'294019','2013-12-03 10:23:13','Tengajan Gaon',10,'2013-12-03 10:23:13','Tengajan Gaon',1,1),(72,0,'294021','2013-12-03 10:23:13','No.188 Grant',10,'2013-12-03 10:23:13','No.188 Grant',1,1),(73,0,'294042','2013-12-03 10:23:13','Chereli Gohain',11,'2013-12-03 10:23:13','Chereli Gohain',1,1),(74,0,'294043','2013-12-03 10:23:13','Sonowal Kachari',11,'2013-12-03 10:23:13','Sonowal Kachari',1,1),(75,0,'294044','2013-12-03 10:23:13','Gohain Gaon',11,'2013-12-03 10:23:13','Gohain Gaon',1,1),(76,0,'294045','2013-12-03 10:23:13','Abhaypuria',11,'2013-12-03 10:23:13','Abhaypuria',1,1),(77,0,'294055','2013-12-03 10:23:13','Kechabebejia',11,'2013-12-03 10:23:13','Kechabebejia',1,1),(78,0,'294038','2013-12-03 10:23:13','Rajabari',11,'2013-12-03 10:23:13','Rajabari',1,1),(79,0,'294039','2013-12-03 10:23:13','Gaharichowa',11,'2013-12-03 10:23:13','Gaharichowa',1,1),(80,0,'294033','2013-12-03 10:23:13','Rajabahar Gaon',11,'2013-12-03 10:23:13','Rajabahar Gaon',1,1),(81,0,'294034','2013-12-03 10:23:13','Turung Gaon',11,'2013-12-03 10:23:13','Turung Gaon',1,1),(82,0,'294030','2013-12-03 10:23:13','Salaguri Gaon',12,'2013-12-03 10:23:13','Salaguri Gaon',1,1),(83,0,'294031','2013-12-03 10:23:13','Saidal Kachari',12,'2013-12-03 10:23:13','Saidal Kachari',1,1),(84,0,'294032','2013-12-03 10:23:13','Tipomia',12,'2013-12-03 10:23:13','Tipomia',1,1),(85,0,'294024','2013-12-03 10:23:13','Charaipani Bongali',12,'2013-12-03 10:23:13','Charaipani Bongali',1,1),(86,0,'294025','2013-12-03 10:23:13','Dangdhora Grant',12,'2013-12-03 10:23:13','Dangdhora Grant',1,1),(87,0,'294026','2013-12-03 10:23:13','Christian Gaon',12,'2013-12-03 10:23:13','Christian Gaon',1,1),(88,0,'294028','2013-12-03 10:23:13','Kachari Gaon',12,'2013-12-03 10:23:13','Kachari Gaon',1,1),(89,0,'294029','2013-12-03 10:23:13','Lohang Bebejia',12,'2013-12-03 10:23:13','Lohang Bebejia',1,1),(90,0,'293989','2013-12-03 10:23:13','Lalung Gaon',12,'2013-12-03 10:23:13','Lalung Gaon',1,1),(91,0,'294046','2013-12-03 10:23:13','Kawrichuk',13,'2013-12-03 10:23:13','Kawrichuk',1,1),(92,0,'294048','2013-12-03 10:23:13','Mohimabari Habi',13,'2013-12-03 10:23:13','Mohimabari Habi',1,1),(93,0,'294049','2013-12-03 10:23:13','Bosa Gaon',13,'2013-12-03 10:23:13','Bosa Gaon',1,1),(94,0,'294050','2013-12-03 10:23:13','Bamun Gaon',13,'2013-12-03 10:23:13','Bamun Gaon',1,1),(95,0,'294051','2013-12-03 10:23:13','Ikarani Gaon',13,'2013-12-03 10:23:13','Ikarani Gaon',1,1),(96,0,'294053','2013-12-03 10:23:13','Moran Gaon',13,'2013-12-03 10:23:13','Moran Gaon',1,1),(97,0,'293982','2013-12-03 10:23:13','Nawpeta Gaon',13,'2013-12-03 10:23:13','Nawpeta Gaon',1,1),(98,0,'294056','2013-12-03 10:23:13','Khemakachari',14,'2013-12-03 10:23:13','Khemakachari',1,1),(99,0,'294057','2013-12-03 10:23:13','Borholla T.E.',14,'2013-12-03 10:23:13','Borholla T.E.',1,1),(100,0,'294061','2013-12-03 10:23:13','Borholla Grant',14,'2013-12-03 10:23:13','Borholla Grant',1,1),(101,0,'294062','2013-12-03 10:23:13','Orangial Gaon',14,'2013-12-03 10:23:13','Orangial Gaon',1,1),(102,0,'294064','2013-12-03 10:23:13','Bojalkata',14,'2013-12-03 10:23:13','Bojalkata',1,1),(103,0,'294040','2013-12-03 10:23:13','kaliapani T.E.',14,'2013-12-03 10:23:13','kaliapani T.E.',1,1),(104,0,'294054','2013-12-03 10:23:13','Tairakuri',14,'2013-12-03 10:23:13','Tairakuri',1,1),(105,0,'294041','2013-12-03 10:23:13','Cherelipather',14,'2013-12-03 10:23:13','Cherelipather',1,1),(106,0,'294052','2013-12-03 10:23:13','Nangal Gaon',14,'2013-12-03 10:23:13','Nangal Gaon',1,1),(107,0,'294058','2013-12-03 10:23:13','Garjan Gaon',15,'2013-12-03 10:23:13','Garjan Gaon',1,1),(108,0,'294059','2013-12-03 10:23:13','Sildubi',15,'2013-12-03 10:23:13','Sildubi',1,1),(109,0,'294060','2013-12-03 10:23:13','No.2 Kakadunga',15,'2013-12-03 10:23:13','No.2 Kakadunga',1,1),(110,0,'294068','2013-12-03 10:23:13','No.2 Block',15,'2013-12-03 10:23:13','No.2 Block',1,1),(111,0,'294069','2013-12-03 10:23:13','No.2 Block',15,'2013-12-03 10:23:13','No.2 Block',1,1),(112,0,'294070','2013-12-03 10:23:13','No.3 Block',15,'2013-12-03 10:23:13','No.3 Block',1,1),(113,0,'294071','2013-12-03 10:23:13','Halfmile Bell',15,'2013-12-03 10:23:13','Halfmile Bell',1,1),(114,0,'294072','2013-12-03 10:23:13','No.4 Block',15,'2013-12-03 10:23:13','No.4 Block',1,1),(115,0,'294073','2013-12-03 10:23:13','No.5 Block',15,'2013-12-03 10:23:13','No.5 Block',1,1),(116,0,'294063','2013-12-03 10:23:13','No.1 kakadunga',15,'2013-12-03 10:23:13','No.1 kakadunga',1,1),(117,0,'294074','2013-12-03 10:23:13','Annapurna',16,'2013-12-03 10:23:13','Annapurna',1,1),(118,0,'294075','2013-12-03 10:23:13','Torani Gaon',16,'2013-12-03 10:23:13','Torani Gaon',1,1),(119,0,'294076','2013-12-03 10:23:13','Nagabat Gaon',16,'2013-12-03 10:23:13','Nagabat Gaon',1,1),(120,0,'294077','2013-12-03 10:23:13','Sukanjun',16,'2013-12-03 10:23:13','Sukanjun',1,1),(121,0,'294065','2013-12-03 10:23:13','Raidangjuri',16,'2013-12-03 10:23:13','Raidangjuri',1,1),(122,0,'294066','2013-12-03 10:23:13','Matikhula Gaon',16,'2013-12-03 10:23:13','Matikhula Gaon',1,1),(123,0,'294067','2013-12-03 10:23:13','Miri Gaon',16,'2013-12-03 10:23:13','Miri Gaon',1,1),(124,0,'293994','2013-12-03 10:23:13','Rongdoikhat',3,'2013-12-03 10:23:13','Rongdoikhat',1,1),(125,0,'293996','2013-12-03 10:23:13','Leteku Gaon',3,'2013-12-03 10:23:13','Leteku Gaon',1,1),(126,0,'293997','2013-12-03 10:23:13','No.4 Grant',3,'2013-12-03 10:23:13','No.4 Grant',1,1),(127,0,'294000','2013-12-03 10:23:13','Letekujan Grant',3,'2013-12-03 10:23:13','Letekujan Grant',1,1),(128,0,'294001','2013-12-03 10:23:13','No.11 Grant',3,'2013-12-03 10:23:13','No.11 Grant',1,1),(129,0,'293955','2013-12-03 10:23:13','Dholi T.E.',3,'2013-12-03 10:23:13','Dholi T.E.',1,1),(130,0,'293943','2013-12-03 10:23:13','Kharikatia Grant',3,'2013-12-03 10:23:13','Kharikatia Grant',1,1),(131,0,'293956','2013-12-03 10:23:13','Bukaholla Grant',3,'2013-12-03 10:23:13','Bukaholla Grant',1,1),(132,0,'303','2013-12-03 10:23:13','Amsing Gaon',17,'2013-12-03 10:23:13','Amsing Gaon',1,1),(133,0,'439','2013-12-03 10:23:13','Amsing NC',17,'2013-12-03 10:23:13','Amsing NC',1,1),(134,0,'443','2013-12-03 10:23:13','Bojora NC',17,'2013-12-03 10:23:13','Bojora NC',1,1),(135,0,'444','2013-12-03 10:23:13','Bojora Goan',17,'2013-12-03 10:23:13','Bojora Goan',1,1),(136,0,'801','2013-12-03 10:23:13','Narengi',17,'2013-12-03 10:23:13','Narengi',1,1),(137,0,'629','2013-12-03 10:23:13','Jansimalu NC',17,'2013-12-03 10:23:13','Jansimalu NC',1,1),(138,0,'430','2013-12-03 10:23:13','Kalitakuchi NC',17,'2013-12-03 10:23:13','Kalitakuchi NC',1,1),(139,0,'582','2013-12-03 10:23:13','Panikhaiti Gaon',18,'2013-12-03 10:23:13','Paniklaiti Gaon',1,1),(140,0,'584','2013-12-03 10:23:13','Hajongbari',18,'2013-12-03 10:23:13','Hajongbari',1,1),(141,0,'585','2013-12-03 10:23:13','Barchapari',18,'2013-12-03 10:23:13','Barchapari',1,1),(142,0,'613','2013-12-03 10:23:13','Paniklaiti No.2',18,'2013-12-03 10:23:13','Paniklaiti No.2',1,1),(143,0,'614','2013-12-03 10:23:13','Kharghuli No.2',18,'2013-12-03 10:23:13','Kharghuli No.2',1,1),(144,0,'615','2013-12-03 10:23:13','Bonda Gaon',18,'2013-12-03 10:23:13','Bonda Gaon',1,1),(145,0,'616','2013-12-03 10:23:13','Bonda No.2',18,'2013-12-03 10:23:13','Bonda No.2',1,1),(146,0,'617','2013-12-03 10:23:13','Birkuchi No.2',18,'2013-12-03 10:23:13','Birkuchi No.2',1,1),(147,0,'619','2013-12-03 10:23:13','Khankar NC No.2',18,'2013-12-03 10:23:13','Khankar NC No.2',1,1),(148,0,'431','2013-12-03 10:23:13','No.1 Bonda Grant',18,'2013-12-03 10:23:13','No.1 Bonda Grant',1,1),(149,0,'432','2013-12-03 10:23:13','No.2 Bonda Grant',18,'2013-12-03 10:23:13','No.2 Bonda Grant',1,1),(150,0,'433','2013-12-03 10:23:13','Tintukura NC',18,'2013-12-03 10:23:13','Tintukura NC',1,1),(151,0,'435','2013-12-03 10:23:13','Hanjonbari NC',18,'2013-12-03 10:23:13','Hanjonbari NC',1,1),(152,0,'612','2013-12-03 10:23:13','Khankar No.2',18,'2013-12-03 10:23:13','Khankar No.2',1,1),(153,0,'581','2013-12-03 10:23:13','Kharghuli NC',18,'2013-12-03 10:23:13','Kharghuli NC',1,1),(154,0,'434','2013-12-03 10:23:13','Kharghuli No.2',18,'2013-12-03 10:23:13','Kharghuli No.2',1,1),(155,0,'583','2013-12-03 10:23:13','Khankar Gaon',18,'2013-12-03 10:23:13','Khankar Gaon',1,1),(156,0,'611','2013-12-03 10:23:13','Hajongbari No.2',18,'2013-12-03 10:23:13','Hajongbari No.2',1,1),(157,0,'588','2013-12-03 10:23:13','Chandrapur Gaon',19,'2013-12-03 10:23:13','Chandrapur Gaon',1,1),(158,0,'587','2013-12-03 10:23:13','Chandrapur No.2',19,'2013-12-03 10:23:13','Chandrapur No.2',1,1),(159,0,'601','2013-12-03 10:23:13','Missamari No.2',19,'2013-12-03 10:23:13','Missamari No.2',1,1),(160,0,'603','2013-12-03 10:23:13','Thakurkuchi No.2',19,'2013-12-03 10:23:13','Thakurkuchi No.2',1,1),(161,0,'602','2013-12-03 10:23:13','Thakurkuchi Gaon',19,'2013-12-03 10:23:13','Thakurkuchi Gaon',1,1),(162,0,'604','2013-12-03 10:23:13','Missamari Gaon',19,'2013-12-03 10:23:13','Missamari Gaon',1,1),(163,0,'605','2013-12-03 10:23:13','Niz Panbari',19,'2013-12-03 10:23:13','Niz Panbari',1,1),(164,0,'609','2013-12-03 10:23:13','Panbari No.2',19,'2013-12-03 10:23:13','Panbari No.2',1,1),(165,0,'618','2013-12-03 10:23:13','Thakurkuchi NC',19,'2013-12-03 10:23:13','Thakurkuchi NC',1,1),(166,0,'624','2013-12-03 10:23:13','Chandrapur Bagicha',19,'2013-12-03 10:23:13','Chandrapur Bagicha',1,1),(167,0,'623','2013-12-03 10:23:13','Borbilla bill',19,'2013-12-03 10:23:13','Borbilla bill',1,1),(168,0,'586','2013-12-03 10:23:13','Tatimara',19,'2013-12-03 10:23:13','Tatimara',1,1),(169,0,'625','2013-12-03 10:23:13','Ahorigog',19,'2013-12-03 10:23:13','Ahorigog',1,1),(170,0,'626','2013-12-03 10:23:13','Michamari',19,'2013-12-03 10:23:13','Michamari',1,1),(171,0,'627','2013-12-03 10:23:13','Niz Panbari NC',19,'2013-12-03 10:23:13','Niz Panbari NC',1,1),(172,0,'589','2013-12-03 10:23:13','Kajali Chawki',20,'2013-12-03 10:23:13','Kajali Chawki',1,1),(173,0,'591','2013-12-03 10:23:13','Hatibagara',20,'2013-12-03 10:23:13','Hatibagara',1,1),(174,0,'592','2013-12-03 10:23:13','Gobardhan Grant',20,'2013-12-03 10:23:13','Gobardhan Grant',1,1),(175,0,'593','2013-12-03 10:23:13','Gobardhan Pam',20,'2013-12-03 10:23:13','Gobardhan Pam',1,1),(176,0,'594','2013-12-03 10:23:13','Gobhali',20,'2013-12-03 10:23:13','Gobhali',1,1),(177,0,'595','2013-12-03 10:23:13','Dhamkhunda No.1',20,'2013-12-03 10:23:13','Dhamkhunda No.1',1,1),(178,0,'596','2013-12-03 10:23:13','Kamarpur Pathar',20,'2013-12-03 10:23:13','Kamarpur Pathar',1,1),(179,0,'597','2013-12-03 10:23:13','Kamarpur',20,'2013-12-03 10:23:13','Kamarpur',1,1),(180,0,'598','2013-12-03 10:23:13','Dhamkhunda No.2',20,'2013-12-03 10:23:13','Dhamkhunda No.2',1,1),(181,0,'599','2013-12-03 10:23:13','Dhipuji Pathar',20,'2013-12-03 10:23:13','Dhipuji Pathar',1,1),(182,0,'600','2013-12-03 10:23:13','Dhipujijan Pam',20,'2013-12-03 10:23:13','Dhipujijan Pam',1,1),(183,0,'670','2013-12-03 10:23:13','Mikir Pam',20,'2013-12-03 10:23:13','Mikir Pam',1,1);
/*!40000 ALTER TABLE `village` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-05 17:59:01
