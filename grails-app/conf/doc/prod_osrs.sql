-- MySQL dump 10.11
--
-- Host: localhost    Database: prod_osrs
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
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `content_type` varchar(255) default NULL,
  `date_created` datetime NOT NULL,
  `ext` varchar(255) default NULL,
  `input_name` varchar(255) NOT NULL,
  `length` bigint(20) NOT NULL,
  `lnk_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `poster_class` varchar(255) NOT NULL,
  `poster_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK8AF75923BE8D343C` (`lnk_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (1,1,'text/plain','2012-10-09 02:01:11','txt','doucment.main',7911,1,'Log','unknown',0),(2,1,'text/plain','2012-10-09 02:14:37','txt','doucment.main',1370,2,'HELP','unknown',0),(3,1,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2012-10-09 02:17:02','docx','doucment.main',14860,3,'TDDDamyant','unknown',0);
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment_link`
--

DROP TABLE IF EXISTS `attachment_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment_link` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `reference_class` varchar(255) NOT NULL,
  `reference_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment_link`
--

LOCK TABLES `attachment_link` WRITE;
/*!40000 ALTER TABLE `attachment_link` DISABLE KEYS */;
INSERT INTO `attachment_link` VALUES (1,0,'com.osrs.FileAsset',1),(2,0,'com.osrs.FileAsset',2),(3,0,'com.osrs.FileAsset',3);
/*!40000 ALTER TABLE `attachment_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `district_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK597C48D64847CFA` (`user_updated_id`),
  KEY `FK597C48DCBA08216` (`district_id`),
  KEY `FK597C48DC7C493AD` (`user_created_id`),
  CONSTRAINT `FK597C48D64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK597C48DC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK597C48DCBA08216` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,0,'ASBABA','2012-09-26 17:43:23','barpeta block',1,'2012-09-26 17:43:23','Barpeta',1,1),(2,0,'ASBABL','2012-09-26 17:53:58','Bajali',1,'2012-09-26 17:53:58','Bajali',1,1),(3,0,'ASBOBM','2012-09-26 18:04:06','Boitamari',2,'2012-09-26 18:04:06','Boitamari',1,1),(4,0,'ASBODG','2012-09-26 18:11:44','Dangtol',2,'2012-09-26 18:11:44','Dangtol',1,1);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinates`
--

DROP TABLE IF EXISTS `coordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinates` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `accuracy` double NOT NULL,
  `altitude` double NOT NULL,
  `altitude_accuracy` double NOT NULL,
  `heading` double NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `speed` double NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `college` int(11) NOT NULL,
  `district_name` varchar(255) NOT NULL,
  `primary_school` int(11) NOT NULL,
  `secondary_school` int(11) NOT NULL,
  `senior_secondary_school` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK1139338EF971AE7E` (`state_id`),
  KEY `FK1139338E64847CFA` (`user_updated_id`),
  KEY `FK1139338EC7C493AD` (`user_created_id`),
  CONSTRAINT `FK1139338E64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1139338EC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1139338EF971AE7E` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,0,'ASBA','2012-09-26 17:42:28','barpeta district','2012-09-26 17:42:28','Barpeta',1,1,1),(2,0,'ASBO','2012-09-26 18:03:39','Bongaigaon','2012-09-26 18:03:39','Bongaigaon',1,1,1);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `college_total_id` bigint(20) default NULL,
  `date_created` datetime NOT NULL,
  `edu1` varchar(255) default NULL,
  `edu10` int(11) default NULL,
  `edu11` int(11) default NULL,
  `edu12` int(11) default NULL,
  `edu13` int(11) default NULL,
  `edu14` int(11) default NULL,
  `edu15` int(11) default NULL,
  `edu16` int(11) default NULL,
  `edu17` int(11) default NULL,
  `edu2` varchar(255) default NULL,
  `edu3` int(11) default NULL,
  `edu4` int(11) default NULL,
  `edu5` int(11) default NULL,
  `edu6` int(11) default NULL,
  `edu7` int(11) default NULL,
  `edu8` int(11) default NULL,
  `edu9` int(11) default NULL,
  `high_school_total_id` bigint(20) default NULL,
  `last_updated` datetime NOT NULL,
  `middle_total_id` bigint(20) default NULL,
  `month` int(11) NOT NULL,
  `no_of_enrolment_in_college_id` bigint(20) default NULL,
  `no_of_enrolment_in_other_tech_course_id` bigint(20) default NULL,
  `pre_primary_total_id` bigint(20) default NULL,
  `primary_total_id` bigint(20) default NULL,
  `senior_sec_school_total_id` bigint(20) default NULL,
  `status` varchar(255) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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
  KEY `FKEEAB67A8DF75D81A` (`primary_total_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,11,NULL,'2012-10-04 03:58:54',NULL,88,75,26,55,24,23,87,10,NULL,200,144,1,1,1,1,1,NULL,'2012-10-04 04:06:20',NULL,1,1,1,NULL,NULL,NULL,'CP',1,1,12,2012),(2,11,NULL,'2012-10-04 04:20:40',NULL,266,145,52,26,55,45,25,35,NULL,95,55,1,1,1,1,1,NULL,'2012-10-04 04:25:31',NULL,1,3,3,NULL,NULL,NULL,'CP',1,1,18,2012),(3,0,NULL,'2012-10-04 04:23:52',NULL,12,23,45,56,78,89,90,98,NULL,12,14,1,1,1,1,1,NULL,'2012-10-04 04:23:52',NULL,1,2,2,NULL,NULL,NULL,'CP',4,4,1,1990),(4,2,NULL,'2012-10-04 04:26:30',NULL,12,22,34,55,45,44,34,33,NULL,12,22,1,1,1,1,1,NULL,'2012-10-04 04:28:06',NULL,1,NULL,NULL,NULL,NULL,NULL,'CP',1,1,13,2012),(5,11,NULL,'2012-10-04 04:35:34',NULL,25,45,26,12,10,10,5,5,NULL,86,73,1,1,1,1,1,NULL,'2012-10-04 04:41:15',NULL,1,4,4,NULL,NULL,NULL,'CP',1,1,14,2012),(6,11,NULL,'2012-10-04 04:53:12',NULL,23,55,56,67,44,43,22,13,NULL,56,55,1,1,1,1,1,NULL,'2012-10-04 04:57:42',NULL,1,5,5,NULL,NULL,NULL,'CP',1,1,7,2012),(7,11,NULL,'2012-10-04 05:04:03',NULL,140,99,58,54,45,25,10,10,NULL,58,55,1,1,1,1,1,NULL,'2012-10-04 05:10:18',NULL,1,6,6,NULL,NULL,NULL,'CP',1,1,6,2012),(8,11,NULL,'2012-10-04 05:18:43',NULL,56,55,54,45,44,58,45,40,NULL,55,65,1,1,1,1,1,NULL,'2012-10-04 05:26:45',NULL,1,7,7,NULL,NULL,NULL,'CP',1,1,8,2012),(9,11,NULL,'2012-10-04 05:33:46',NULL,88,78,58,88,78,56,55,88,NULL,45,55,1,1,1,1,1,NULL,'2012-10-04 05:39:03',NULL,1,8,8,NULL,NULL,NULL,'CP',1,1,10,2012),(10,11,NULL,'2012-10-04 05:43:43',NULL,58,55,45,55,45,4,5,22,NULL,67,66,1,1,1,1,1,NULL,'2012-10-04 05:51:33',NULL,1,9,9,NULL,NULL,NULL,'CP',2,2,28,2012),(11,11,NULL,'2012-10-04 05:53:58',NULL,5,5,5,5,5,5,5,5,NULL,25,26,1,1,1,1,1,NULL,'2012-10-04 06:00:47',NULL,1,10,10,NULL,NULL,NULL,'CP',2,2,29,2012),(12,11,NULL,'2012-10-04 06:04:21',NULL,25,14,11,10,11,10,11,10,NULL,25,25,1,1,1,1,1,NULL,'2012-10-04 06:10:33',NULL,1,11,11,NULL,NULL,NULL,'CP',2,2,30,2012),(13,0,NULL,'2012-10-04 06:07:48',NULL,12,96,85,74,23,12,85,90,NULL,63,85,1,1,1,1,1,NULL,'2012-10-04 06:07:48',NULL,2,12,12,NULL,NULL,NULL,'CP',4,4,1,1990),(14,0,NULL,'2012-10-04 06:20:08',NULL,12,65,96,88,93,87,66,79,NULL,22,33,1,1,1,1,1,NULL,'2012-10-04 06:20:08',NULL,4,13,13,NULL,NULL,NULL,'CP',4,4,1,1990),(15,15,NULL,'2012-10-04 08:23:39',NULL,5,6,6,4,6,5,8,9,NULL,5,123,2,1,1,1,1,NULL,'2012-10-09 07:24:47',NULL,1,15,15,NULL,NULL,NULL,'CP',2,2,38,2012),(16,0,NULL,'2012-10-04 08:26:30',NULL,23,96,85,74,52,63,74,80,NULL,63,12,1,1,1,1,1,NULL,'2012-10-04 08:26:30',NULL,6,14,14,NULL,NULL,NULL,'CP',4,4,1,1990),(17,0,NULL,'2012-10-05 02:17:36',NULL,9,9,6,6,6,NULL,NULL,6,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-05 02:17:36',NULL,9,16,16,NULL,NULL,NULL,'CP',4,4,1,2012),(18,0,NULL,'2012-10-05 02:26:20',NULL,85,96,87,80,54,52,53,51,NULL,12,32,1,1,1,1,1,NULL,'2012-10-05 02:26:20',NULL,12,17,17,NULL,NULL,NULL,'CP',4,4,1,1990),(19,2,NULL,'2012-10-05 03:09:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,'2012-10-05 03:11:02',NULL,1,NULL,NULL,NULL,NULL,NULL,'IP',4,4,36,1993),(20,0,NULL,'2012-10-05 05:36:21',NULL,12,98,65,74,12,35,98,85,NULL,52,96,1,1,1,1,1,NULL,'2012-10-05 05:36:21',NULL,10,18,18,NULL,NULL,NULL,'CP',4,4,1,1990),(21,0,NULL,'2012-10-05 06:31:15',NULL,52,960,85,74,65,87,59,80,NULL,12,32,1,1,1,1,1,NULL,'2012-10-05 06:31:15',NULL,9,19,19,NULL,NULL,NULL,'CP',4,4,1,1990),(22,0,NULL,'2012-10-05 07:41:43',NULL,53,55,89,74,12,32,85,96,NULL,12,63,1,1,1,1,1,NULL,'2012-10-05 07:41:43',NULL,12,20,20,NULL,NULL,NULL,'CP',4,4,29,1990),(23,0,NULL,'2012-10-05 08:24:06',NULL,866,874,647,147,985,788,807,805,NULL,85,96,1,1,1,1,1,NULL,'2012-10-05 08:24:06',NULL,1,21,21,NULL,NULL,NULL,'CP',4,4,2,1990),(24,0,NULL,'2012-10-05 08:43:39',NULL,63,98,28,74,9,6,8,5,NULL,82,98,1,1,1,1,1,NULL,'2012-10-05 08:43:39',NULL,12,22,22,NULL,NULL,NULL,'CP',4,4,3,1991),(25,0,NULL,'2012-10-06 03:32:53',NULL,2,5,8,8,8,5,5,8,NULL,54,123,1,NULL,NULL,NULL,NULL,NULL,'2012-10-06 03:32:53',NULL,4,23,23,NULL,NULL,NULL,'CP',4,4,1,1999),(26,11,NULL,'2012-10-09 01:35:22',NULL,10,12,5,8,8,11,14,11,NULL,12,144,1,1,1,1,1,NULL,'2012-10-09 02:17:27',NULL,1,24,24,NULL,NULL,NULL,'CP',1,1,31,2012),(27,11,NULL,'2012-10-09 02:34:55',NULL,25,11,26,55,44,10,14,5,NULL,25,55,1,1,1,1,1,NULL,'2012-10-09 02:41:06',NULL,1,25,25,NULL,NULL,NULL,'CP',1,1,39,2012),(28,11,NULL,'2012-10-09 02:55:23',NULL,88,11,11,55,11,10,5,10,NULL,200,144,1,1,1,1,1,NULL,'2012-10-09 03:31:34',NULL,1,26,26,NULL,NULL,NULL,'CP',1,1,40,2012),(29,11,NULL,'2012-10-09 05:15:07',NULL,25,11,11,10,11,10,5,10,NULL,86,99,1,1,1,1,1,NULL,'2012-10-09 06:37:52',NULL,1,27,27,NULL,NULL,NULL,'CP',1,1,41,2012);
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_no_of_enrolment_in_edu`
--

DROP TABLE IF EXISTS `education_no_of_enrolment_in_edu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_no_of_enrolment_in_edu` (
  `education_college_id` bigint(20) default NULL,
  `no_of_enrolment_in_edu_id` bigint(20) default NULL,
  `education_high_school_id` bigint(20) default NULL,
  `education_middle_id` bigint(20) default NULL,
  `education_pre_primary_id` bigint(20) default NULL,
  `education_primary_id` bigint(20) default NULL,
  `education_senior_sec_school_id` bigint(20) default NULL,
  KEY `FKB3BA63B837CC0C06` (`education_senior_sec_school_id`),
  KEY `FKB3BA63B898A84526` (`education_high_school_id`),
  KEY `FKB3BA63B8751B8074` (`education_middle_id`),
  KEY `FKB3BA63B8166DC760` (`no_of_enrolment_in_edu_id`),
  KEY `FKB3BA63B84F930600` (`education_college_id`),
  KEY `FKB3BA63B8C372D951` (`education_pre_primary_id`),
  KEY `FKB3BA63B86B2E7DB5` (`education_primary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_no_of_enrolment_in_edu`
--

LOCK TABLES `education_no_of_enrolment_in_edu` WRITE;
/*!40000 ALTER TABLE `education_no_of_enrolment_in_edu` DISABLE KEYS */;
INSERT INTO `education_no_of_enrolment_in_edu` VALUES (NULL,1,NULL,NULL,1,NULL,NULL),(NULL,2,NULL,NULL,NULL,1,NULL),(NULL,3,NULL,1,NULL,NULL,NULL),(NULL,4,1,NULL,NULL,NULL,NULL),(NULL,5,NULL,NULL,NULL,NULL,1),(NULL,6,NULL,NULL,2,NULL,NULL),(NULL,7,NULL,NULL,NULL,2,NULL),(NULL,8,NULL,2,NULL,NULL,NULL),(NULL,9,2,NULL,NULL,NULL,NULL),(NULL,14,NULL,NULL,3,NULL,NULL),(NULL,11,NULL,NULL,3,NULL,NULL),(NULL,13,NULL,NULL,3,NULL,NULL),(NULL,10,NULL,NULL,3,NULL,NULL),(NULL,12,NULL,NULL,3,NULL,NULL),(NULL,15,NULL,NULL,NULL,NULL,2),(NULL,16,NULL,NULL,5,NULL,NULL),(NULL,17,NULL,NULL,NULL,5,NULL),(NULL,18,NULL,5,NULL,NULL,NULL),(NULL,19,5,NULL,NULL,NULL,NULL),(NULL,20,NULL,NULL,NULL,NULL,5),(NULL,21,NULL,NULL,6,NULL,NULL),(NULL,22,NULL,NULL,NULL,6,NULL),(NULL,23,NULL,6,NULL,NULL,NULL),(NULL,24,6,NULL,NULL,NULL,NULL),(NULL,25,NULL,NULL,NULL,NULL,6),(NULL,26,NULL,NULL,7,NULL,NULL),(NULL,27,NULL,NULL,NULL,7,NULL),(NULL,28,NULL,7,NULL,NULL,NULL),(NULL,29,7,NULL,NULL,NULL,NULL),(NULL,30,NULL,NULL,NULL,NULL,7),(NULL,31,NULL,NULL,8,NULL,NULL),(NULL,32,NULL,NULL,NULL,8,NULL),(NULL,33,NULL,8,NULL,NULL,NULL),(NULL,34,8,NULL,NULL,NULL,NULL),(NULL,35,NULL,NULL,NULL,NULL,8),(NULL,36,NULL,NULL,9,NULL,NULL),(NULL,37,NULL,NULL,NULL,9,NULL),(NULL,38,NULL,9,NULL,NULL,NULL),(NULL,39,9,NULL,NULL,NULL,NULL),(NULL,40,NULL,NULL,NULL,NULL,9),(NULL,41,NULL,NULL,10,NULL,NULL),(NULL,42,NULL,NULL,NULL,10,NULL),(NULL,43,NULL,10,NULL,NULL,NULL),(NULL,44,10,NULL,NULL,NULL,NULL),(NULL,45,NULL,NULL,NULL,NULL,10),(NULL,46,NULL,NULL,11,NULL,NULL),(NULL,47,NULL,NULL,NULL,11,NULL),(NULL,48,NULL,11,NULL,NULL,NULL),(NULL,49,11,NULL,NULL,NULL,NULL),(NULL,50,NULL,NULL,NULL,NULL,11),(NULL,51,NULL,NULL,12,NULL,NULL),(NULL,52,NULL,NULL,NULL,12,NULL),(NULL,53,NULL,12,NULL,NULL,NULL),(NULL,54,12,NULL,NULL,NULL,NULL),(NULL,60,NULL,NULL,NULL,NULL,12),(NULL,62,NULL,NULL,14,NULL,NULL),(NULL,65,NULL,NULL,14,NULL,NULL),(NULL,63,NULL,NULL,14,NULL,NULL),(NULL,61,NULL,NULL,14,NULL,NULL),(NULL,64,NULL,NULL,14,NULL,NULL),(NULL,71,NULL,NULL,15,NULL,NULL),(NULL,72,NULL,NULL,15,NULL,NULL),(NULL,73,NULL,NULL,NULL,15,NULL),(NULL,74,NULL,15,NULL,NULL,NULL),(NULL,75,15,NULL,NULL,NULL,NULL),(NULL,76,NULL,NULL,NULL,NULL,15),(NULL,80,18,NULL,NULL,NULL,NULL),(NULL,79,NULL,18,NULL,NULL,NULL),(NULL,77,NULL,NULL,18,NULL,NULL),(NULL,78,NULL,NULL,NULL,18,NULL),(NULL,81,NULL,NULL,NULL,NULL,18),(NULL,85,20,NULL,NULL,NULL,NULL),(NULL,84,NULL,20,NULL,NULL,NULL),(NULL,82,NULL,NULL,20,NULL,NULL),(NULL,83,NULL,NULL,NULL,20,NULL),(NULL,86,NULL,NULL,NULL,NULL,20),(NULL,90,21,NULL,NULL,NULL,NULL),(NULL,89,NULL,21,NULL,NULL,NULL),(NULL,87,NULL,NULL,21,NULL,NULL),(NULL,88,NULL,NULL,NULL,21,NULL),(NULL,91,NULL,NULL,NULL,NULL,21),(NULL,95,22,NULL,NULL,NULL,NULL),(NULL,94,NULL,22,NULL,NULL,NULL),(NULL,92,NULL,NULL,22,NULL,NULL),(NULL,93,NULL,NULL,NULL,22,NULL),(NULL,96,NULL,NULL,NULL,NULL,22),(NULL,100,23,NULL,NULL,NULL,NULL),(NULL,99,NULL,23,NULL,NULL,NULL),(NULL,97,NULL,NULL,23,NULL,NULL),(NULL,98,NULL,NULL,NULL,23,NULL),(NULL,101,NULL,NULL,NULL,NULL,23),(NULL,105,24,NULL,NULL,NULL,NULL),(NULL,104,NULL,24,NULL,NULL,NULL),(NULL,102,NULL,NULL,24,NULL,NULL),(NULL,103,NULL,NULL,NULL,24,NULL),(NULL,106,NULL,NULL,NULL,NULL,24),(NULL,107,NULL,NULL,25,NULL,NULL),(NULL,108,NULL,NULL,26,NULL,NULL),(NULL,109,NULL,NULL,NULL,26,NULL),(NULL,110,NULL,26,NULL,NULL,NULL),(NULL,111,26,NULL,NULL,NULL,NULL),(NULL,112,NULL,NULL,NULL,NULL,26),(NULL,113,NULL,NULL,27,NULL,NULL),(NULL,114,NULL,NULL,NULL,27,NULL),(NULL,115,NULL,27,NULL,NULL,NULL),(NULL,116,27,NULL,NULL,NULL,NULL),(NULL,117,NULL,NULL,NULL,NULL,27),(NULL,118,NULL,NULL,28,NULL,NULL),(NULL,119,NULL,NULL,NULL,28,NULL),(NULL,120,NULL,28,NULL,NULL,NULL),(NULL,121,28,NULL,NULL,NULL,NULL),(NULL,122,NULL,NULL,NULL,NULL,28),(NULL,123,NULL,NULL,29,NULL,NULL),(NULL,124,NULL,NULL,NULL,29,NULL),(NULL,125,NULL,29,NULL,NULL,NULL),(NULL,126,29,NULL,NULL,NULL,NULL),(NULL,127,NULL,NULL,NULL,NULL,29);
/*!40000 ALTER TABLE `education_no_of_enrolment_in_edu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_asset`
--

DROP TABLE IF EXISTS `file_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_asset` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `comment` varchar(255) default NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner_group` varchar(7) default NULL,
  `uri` varchar(255) default NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK7ED2366D1DC72AF6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_asset`
--

LOCK TABLES `file_asset` WRITE;
/*!40000 ALTER TABLE `file_asset` DISABLE KEYS */;
INSERT INTO `file_asset` VALUES (1,0,'OSRS log file','2012-10-09 02:01:10','2012-10-09 02:01:10','OSRS Log ','Public',NULL,3),(2,1,'Help document for reference.','2012-10-09 02:14:37','2012-10-09 02:14:57','Help document','Share',NULL,3),(3,0,'Test Driven Development document','2012-10-09 02:17:02','2012-10-09 02:17:02','Test DD doc','Public',NULL,4);
/*!40000 ALTER TABLE `file_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_asset_user`
--

DROP TABLE IF EXISTS `file_asset_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_asset_user` (
  `file_asset_share_id` bigint(20) default NULL,
  `user_id` bigint(20) default NULL,
  KEY `FKD9916A5D6A11A45` (`file_asset_share_id`),
  KEY `FKD9916A5D1DC72AF6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_asset_user`
--

LOCK TABLES `file_asset_user` WRITE;
/*!40000 ALTER TABLE `file_asset_user` DISABLE KEYS */;
INSERT INTO `file_asset_user` VALUES (2,1),(2,2),(2,4);
/*!40000 ALTER TABLE `file_asset_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_position`
--

DROP TABLE IF EXISTS `geo_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_position` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `coords_id` bigint(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FKF483E6573589C2DE` (`coords_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_position`
--

LOCK TABLES `geo_position` WRITE;
/*!40000 ALTER TABLE `geo_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_and_family_welfare`
--

DROP TABLE IF EXISTS `health_and_family_welfare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `health_and_family_welfare` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `ayur_center_id` bigint(20) default NULL,
  `comm_health_center_id` bigint(20) default NULL,
  `date_created` datetime NOT NULL,
  `family_wel_center_id` bigint(20) default NULL,
  `gov_dispensaries_id` bigint(20) default NULL,
  `gov_hospitals_id` bigint(20) default NULL,
  `health39` int(11) default NULL,
  `health40` int(11) default NULL,
  `health41` int(11) default NULL,
  `health42` int(11) default NULL,
  `health43` int(11) default NULL,
  `health44` int(11) default NULL,
  `health45` int(11) default NULL,
  `health46` int(11) default NULL,
  `health47` int(11) default NULL,
  `health48` int(11) default NULL,
  `health49` int(11) default NULL,
  `health50` int(11) default NULL,
  `health51` int(11) default NULL,
  `health52` int(11) default NULL,
  `health53` int(11) default NULL,
  `health54` int(11) default NULL,
  `health55` int(11) default NULL,
  `health56` int(11) default NULL,
  `health57` int(11) default NULL,
  `health58` int(11) default NULL,
  `health59` int(11) default NULL,
  `health60` int(11) default NULL,
  `health61` int(11) default NULL,
  `health62` int(11) default NULL,
  `health63` int(11) default NULL,
  `health64` int(11) default NULL,
  `health65` int(11) default NULL,
  `health66` int(11) default NULL,
  `health67` int(11) default NULL,
  `health68` int(11) default NULL,
  `health69` int(11) default NULL,
  `health70` int(11) default NULL,
  `health71` int(11) default NULL,
  `homeo_cells_id` bigint(20) default NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `other_centers_id` bigint(20) default NULL,
  `prim_health_center_id` bigint(20) default NULL,
  `status` varchar(255) NOT NULL,
  `sub_center_id` bigint(20) default NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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
  KEY `FK683F5CDC75AB118B` (`ayur_center_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_and_family_welfare`
--

LOCK TABLES `health_and_family_welfare` WRITE;
/*!40000 ALTER TABLE `health_and_family_welfare` DISABLE KEYS */;
INSERT INTO `health_and_family_welfare` VALUES (1,17,7,5,'2012-10-04 03:53:18',6,2,1,95,55,85,60,14,10,15,5,9,2,20,10,25,8,14,88,38,15,25,44,89,99,256,155,85,54,58,38,88,86,57,41,25,8,'2012-10-04 04:06:20',1,9,3,'CP',4,1,1,12,2012),(2,16,16,14,'2012-10-04 04:15:53',15,11,10,68,55,250,144,25,14,10,20,11,19,14,11,2,5,9,2,25,22,24,22,85,47,35,25,44,88,45,68,55,47,45,58,44,17,'2012-10-04 04:25:31',1,18,12,'CP',13,1,1,18,2012),(3,0,25,23,'2012-10-04 04:23:52',24,20,19,30,94,13,25,28,56,74,95,36,15,87,37,80,94,70,96,12,98,65,76,80,90,58,90,88,33,87,96,99,36,77,80,50,26,'2012-10-04 04:23:52',1,NULL,21,'CP',22,4,4,1,1990),(4,1,33,31,'2012-10-04 04:26:15',32,28,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,'2012-10-04 04:26:30',1,35,29,'CP',30,1,1,13,2012),(5,16,42,40,'2012-10-04 04:30:58',41,37,36,87,77,85,66,86,58,45,44,25,26,24,30,12,14,13,25,66,58,54,45,25,68,89,88,74,58,47,65,55,47,58,84,45,43,'2012-10-04 04:41:15',1,44,38,'CP',39,1,1,14,2012),(6,15,51,49,'2012-10-04 04:43:31',50,46,45,88,66,88,78,34,55,32,7,34,12,11,23,7,6,54,66,45,6,14,44,89,88,99,34,44,44,44,67,66,66,77,56,44,52,'2012-10-04 04:57:42',1,53,47,'CP',48,1,1,7,2012),(7,16,60,58,'2012-10-04 04:59:00',59,55,54,95,66,55,34,24,10,13,25,14,11,25,13,25,5,9,35,9,54,5,25,98,99,35,55,78,45,55,35,45,55,65,55,45,61,'2012-10-04 05:10:18',1,62,56,'CP',57,1,1,6,2012),(8,17,69,67,'2012-10-04 05:13:10',68,64,63,87,58,55,55,26,15,12,12,1,2,5,9,12,14,1,2,22,25,24,21,36,58,88,58,78,58,78,36,56,55,45,44,58,70,'2012-10-04 05:26:45',1,71,65,'CP',66,1,1,8,2012),(9,16,78,76,'2012-10-04 05:29:55',77,73,72,99,88,55,55,15,14,22,24,25,14,15,12,14,12,12,14,25,22,23,25,125,144,99,88,58,45,77,55,48,44,45,45,48,79,'2012-10-04 05:39:03',1,80,74,'CP',75,1,1,10,2012),(10,15,87,85,'2012-10-04 05:47:44',86,82,81,NULL,NULL,34,34,3,3,4,6,6,5,6,5,6,5,6,5,8,8,9,8,85,45,26,55,25,44,25,65,66,54,58,54,55,88,'2012-10-04 05:51:33',1,89,83,'CP',84,2,2,28,2012),(11,18,96,94,'2012-10-04 05:57:40',95,91,90,89,88,25,22,9,8,9,8,9,8,9,8,9,8,9,8,9,56,8,5,88,88,26,55,65,65,65,25,25,25,25,2,52,97,'2012-10-04 06:00:47',1,98,92,'CP',93,2,2,29,2012),(12,18,105,103,'2012-10-04 06:08:05',104,100,99,98,88,25,24,12,11,10,10,1,0,5,6,5,6,5,6,6,5,64,5,89,88,25,44,54,54,44,88,54,55,56,55,55,106,'2012-10-04 06:10:33',1,107,101,'CP',102,2,2,30,2012),(13,0,114,112,'2012-10-04 07:29:27',113,109,108,21,36,23,65,56,98,63,74,85,25,96,41,21,72,35,88,52,93,74,15,52,36,58,96,74,80,97,85,96,39,41,82,34,115,'2012-10-04 07:29:27',5,NULL,110,'CP',111,4,4,1,1990),(14,15,122,120,'2012-10-04 08:37:14',121,117,116,12,21,87,34,45,12,32,23,12,21,22,54,33,12,13,51,23,11,21,9,13,21,NULL,NULL,NULL,NULL,NULL,213,122,213,123,212,212,123,'2012-10-09 07:24:47',1,124,118,'CP',119,2,2,38,2012),(15,0,131,129,'2012-10-04 08:40:51',130,126,125,569,64,563,541,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,56,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,132,'2012-10-04 08:40:51',6,NULL,127,'CP',128,4,4,1,1990),(16,0,139,137,'2012-10-05 02:17:36',138,134,133,NULL,NULL,9,6,6,6,6,6,6,6,6,NULL,NULL,6,6,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,140,'2012-10-05 02:17:36',9,NULL,135,'CP',136,4,4,1,2012),(17,0,147,145,'2012-10-05 02:26:20',146,142,141,75,95,56,98,12,32,96,85,74,82,37,46,80,93,12,29,53,96,78,45,85,68,74,58,63,12,90,25,98,74,80,83,12,148,'2012-10-05 02:26:20',12,NULL,143,'CP',144,4,4,1,1990),(18,0,155,153,'2012-10-05 05:36:21',154,150,149,12,32,56,97,23,98,65,75,48,12,35,87,80,82,94,76,23,98,65,74,23,80,85,96,41,70,32,85,96,26,54,74,82,156,'2012-10-05 05:36:21',10,NULL,151,'CP',152,4,4,1,1990),(19,0,163,161,'2012-10-05 07:41:43',162,158,157,53,80,96,85,32,65,98,47,85,96,36,51,45,49,90,28,86,65,54,90,53,98,52,98,74,41,31,96,36,85,74,14,20,164,'2012-10-05 07:41:43',12,NULL,159,'CP',160,4,4,29,1990),(20,0,171,169,'2012-10-06 03:32:53',170,166,165,NULL,NULL,55,44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,172,'2012-10-06 03:32:53',4,NULL,167,'CP',168,4,4,1,1999),(21,16,179,177,'2012-10-09 02:01:57',178,174,173,88,58,66,77,5,10,6,6,4,2,1,5,8,4,6,5,10,5,8,5,85,99,25,155,78,45,44,65,55,55,25,41,45,180,'2012-10-09 02:17:28',1,181,175,'CP',176,1,1,31,2012),(22,16,188,186,'2012-10-09 02:28:48',187,183,182,88,55,88,58,12,10,10,11,11,2,11,2,3,6,13,14,9,5,8,5,85,88,99,55,44,44,25,25,55,47,58,2,55,189,'2012-10-09 02:41:06',1,190,184,'CP',185,1,1,39,2012),(23,16,197,195,'2012-10-09 03:08:51',196,192,191,95,58,85,34,12,11,10,11,11,11,11,12,2,11,1,14,9,5,8,5,89,88,99,55,44,44,25,65,66,55,45,2,25,198,'2012-10-09 03:31:34',1,199,193,'CP',194,1,1,40,2012),(24,16,206,204,'2012-10-09 04:05:00',205,201,200,88,55,25,34,12,10,10,11,11,11,11,5,3,4,6,3,9,5,8,5,89,99,25,88,44,44,25,65,66,55,58,41,45,207,'2012-10-09 06:37:52',1,208,202,'CP',203,1,1,41,2012);
/*!40000 ALTER TABLE `health_and_family_welfare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `no_of_beds` int(11) default NULL,
  `no_of_doctors` int(11) default NULL,
  `no_of_female_cases_treated` int(11) default NULL,
  `no_of_male_cases_treated` int(11) default NULL,
  `no_of_nurses` int(11) default NULL,
  `type` varchar(255) default NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FKEDE6FE3A64847CFA` (`user_updated_id`),
  KEY `FKEDE6FE3AC7C493AD` (`user_created_id`)
) ENGINE=MyISAM AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,1,'2012-10-04 03:53:18','2012-10-04 03:55:21',70,35,60,40,15,'govHospitals',1,1),(2,1,'2012-10-04 03:53:18','2012-10-04 03:55:41',99,77,28,55,22,'govDispensaries',1,1),(3,1,'2012-10-04 03:53:18','2012-10-04 03:56:06',150,88,99,105,44,'primHealthCenter',1,1),(4,1,'2012-10-04 03:53:18','2012-10-04 03:56:27',147,85,99,92,55,'subCenter',1,1),(5,1,'2012-10-04 03:53:18','2012-10-04 03:56:52',200,77,144,158,33,'commHealthCenter',1,1),(6,1,'2012-10-04 03:53:18','2012-10-04 03:57:13',198,83,160,147,49,'familyWelCenter',1,1),(7,1,'2012-10-04 03:53:18','2012-10-04 03:57:33',NULL,55,88,42,NULL,'ayurCenter',1,1),(8,1,'2012-10-04 03:53:18','2012-10-04 03:57:54',NULL,55,44,25,NULL,'homeoCells',1,1),(9,0,'2012-10-04 03:53:18','2012-10-04 03:53:18',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(10,1,'2012-10-04 04:15:53','2012-10-04 04:17:41',264,258,140,200,46,'govHospitals',1,1),(11,1,'2012-10-04 04:15:53','2012-10-04 04:17:55',200,99,133,147,25,'govDispensaries',1,1),(12,1,'2012-10-04 04:15:53','2012-10-04 04:18:12',254,76,152,114,55,'primHealthCenter',1,1),(13,1,'2012-10-04 04:15:53','2012-10-04 04:18:27',246,95,142,225,55,'subCenter',1,1),(14,1,'2012-10-04 04:15:53','2012-10-04 04:19:17',145,95,145,100,25,'commHealthCenter',1,1),(15,1,'2012-10-04 04:15:53','2012-10-04 04:18:50',187,88,147,220,54,'familyWelCenter',1,1),(16,1,'2012-10-04 04:15:53','2012-10-04 04:19:36',NULL,58,14,55,NULL,'ayurCenter',1,1),(17,1,'2012-10-04 04:15:53','2012-10-04 04:19:44',NULL,99,44,25,NULL,'homeoCells',1,1),(18,0,'2012-10-04 04:15:53','2012-10-04 04:15:53',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(19,0,'2012-10-04 04:23:52','2012-10-04 04:23:52',NULL,NULL,NULL,NULL,NULL,'govHospitals',4,4),(20,0,'2012-10-04 04:23:52','2012-10-04 04:23:52',NULL,NULL,NULL,NULL,NULL,'govDispensaries',4,4),(21,0,'2012-10-04 04:23:52','2012-10-04 04:23:52',NULL,NULL,NULL,NULL,NULL,'primHealthCenter',4,4),(22,0,'2012-10-04 04:23:52','2012-10-04 04:23:52',NULL,NULL,NULL,NULL,NULL,'subCenter',4,4),(23,0,'2012-10-04 04:23:52','2012-10-04 04:23:52',NULL,NULL,NULL,NULL,NULL,'commHealthCenter',4,4),(24,0,'2012-10-04 04:23:52','2012-10-04 04:23:52',NULL,NULL,NULL,NULL,NULL,'familyWelCenter',4,4),(25,0,'2012-10-04 04:23:52','2012-10-04 04:23:52',NULL,NULL,NULL,NULL,NULL,'ayurCenter',4,4),(26,0,'2012-10-04 04:23:52','2012-10-04 04:23:52',NULL,NULL,NULL,NULL,NULL,'homeoCells',4,4),(27,0,'2012-10-04 04:26:15','2012-10-04 04:26:15',NULL,NULL,NULL,NULL,NULL,'govHospitals',1,1),(28,0,'2012-10-04 04:26:15','2012-10-04 04:26:15',NULL,NULL,NULL,NULL,NULL,'govDispensaries',1,1),(29,0,'2012-10-04 04:26:15','2012-10-04 04:26:15',NULL,NULL,NULL,NULL,NULL,'primHealthCenter',1,1),(30,0,'2012-10-04 04:26:15','2012-10-04 04:26:15',NULL,NULL,NULL,NULL,NULL,'subCenter',1,1),(31,0,'2012-10-04 04:26:15','2012-10-04 04:26:15',NULL,NULL,NULL,NULL,NULL,'commHealthCenter',1,1),(32,0,'2012-10-04 04:26:15','2012-10-04 04:26:15',NULL,NULL,NULL,NULL,NULL,'familyWelCenter',1,1),(33,0,'2012-10-04 04:26:15','2012-10-04 04:26:15',NULL,NULL,NULL,NULL,NULL,'ayurCenter',1,1),(34,0,'2012-10-04 04:26:15','2012-10-04 04:26:15',NULL,NULL,NULL,NULL,NULL,'homeoCells',1,1),(35,0,'2012-10-04 04:26:15','2012-10-04 04:26:15',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(36,1,'2012-10-04 04:30:58','2012-10-04 04:32:14',254,76,156,261,55,'govHospitals',1,1),(37,1,'2012-10-04 04:30:58','2012-10-04 04:32:44',189,58,200,164,23,'govDispensaries',1,1),(38,1,'2012-10-04 04:30:58','2012-10-04 04:33:05',289,68,145,245,77,'primHealthCenter',1,1),(39,1,'2012-10-04 04:30:58','2012-10-04 04:33:20',298,59,155,124,55,'subCenter',1,1),(40,1,'2012-10-04 04:30:58','2012-10-04 04:33:34',258,365,145,200,254,'commHealthCenter',1,1),(41,1,'2012-10-04 04:30:58','2012-10-04 04:33:57',264,68,154,147,25,'familyWelCenter',1,1),(42,1,'2012-10-04 04:30:58','2012-10-04 04:34:12',NULL,65,45,58,NULL,'ayurCenter',1,1),(43,1,'2012-10-04 04:30:58','2012-10-04 04:34:34',NULL,58,44,44,NULL,'homeoCells',1,1),(44,0,'2012-10-04 04:30:58','2012-10-04 04:30:58',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(45,1,'2012-10-04 04:43:31','2012-10-04 04:46:30',156,99,167,221,45,'govHospitals',1,1),(46,1,'2012-10-04 04:43:31','2012-10-04 04:47:02',256,56,345,123,68,'govDispensaries',1,1),(47,1,'2012-10-04 04:43:31','2012-10-04 04:48:18',156,67,24,134,23,'primHealthCenter',1,1),(48,1,'2012-10-04 04:43:31','2012-10-04 04:49:50',145,69,134,34,55,'subCenter',1,1),(49,1,'2012-10-04 04:43:31','2012-10-04 04:51:58',256,134,34,123,67,'commHealthCenter',1,1),(50,0,'2012-10-04 04:43:31','2012-10-04 04:43:31',NULL,NULL,NULL,NULL,NULL,'familyWelCenter',1,1),(51,1,'2012-10-04 04:43:31','2012-10-04 04:52:10',NULL,23,56,33,NULL,'ayurCenter',1,1),(52,1,'2012-10-04 04:43:31','2012-10-04 04:52:19',NULL,55,54,45,NULL,'homeoCells',1,1),(53,0,'2012-10-04 04:43:31','2012-10-04 04:43:31',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(54,1,'2012-10-04 04:59:00','2012-10-04 05:00:45',254,99,256,145,85,'govHospitals',1,1),(55,1,'2012-10-04 04:59:00','2012-10-04 05:01:08',154,64,354,200,20,'govDispensaries',1,1),(56,1,'2012-10-04 04:59:00','2012-10-04 05:01:51',164,89,120,148,99,'primHealthCenter',1,1),(57,1,'2012-10-04 04:59:00','2012-10-04 05:02:08',264,100,154,254,98,'subCenter',1,1),(58,1,'2012-10-04 04:59:00','2012-10-04 05:02:25',147,58,85,56,44,'commHealthCenter',1,1),(59,1,'2012-10-04 04:59:00','2012-10-04 05:02:43',168,87,177,144,54,'familyWelCenter',1,1),(60,1,'2012-10-04 04:59:00','2012-10-04 05:02:57',NULL,85,66,50,NULL,'ayurCenter',1,1),(61,1,'2012-10-04 04:59:00','2012-10-04 05:03:07',NULL,147,47,55,NULL,'homeoCells',1,1),(62,0,'2012-10-04 04:59:00','2012-10-04 04:59:00',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(63,1,'2012-10-04 05:13:10','2012-10-04 05:14:24',222,254,264,145,145,'govHospitals',1,1),(64,1,'2012-10-04 05:13:10','2012-10-04 05:15:45',254,154,122,154,144,'govDispensaries',1,1),(65,1,'2012-10-04 05:13:10','2012-10-04 05:16:23',254,154,154,254,99,'primHealthCenter',1,1),(66,1,'2012-10-04 05:13:10','2012-10-04 05:16:40',289,154,254,354,144,'subCenter',1,1),(67,1,'2012-10-04 05:13:10','2012-10-04 05:16:56',154,154,145,244,254,'commHealthCenter',1,1),(68,1,'2012-10-04 05:13:10','2012-10-04 05:17:34',254,154,155,145,99,'familyWelCenter',1,1),(69,1,'2012-10-04 05:13:10','2012-10-04 05:17:45',NULL,88,25,54,NULL,'ayurCenter',1,1),(70,1,'2012-10-04 05:13:10','2012-10-04 05:17:55',NULL,154,45,22,NULL,'homeoCells',1,1),(71,0,'2012-10-04 05:13:10','2012-10-04 05:13:10',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(72,1,'2012-10-04 05:29:55','2012-10-04 05:31:07',233,254,144,154,116,'govHospitals',1,1),(73,1,'2012-10-04 05:29:55','2012-10-04 05:31:23',135,154,154,144,144,'govDispensaries',1,1),(74,1,'2012-10-04 05:29:55','2012-10-04 05:31:36',144,254,144,122,154,'primHealthCenter',1,1),(75,1,'2012-10-04 05:29:55','2012-10-04 05:31:50',45,99,88,55,88,'subCenter',1,1),(76,1,'2012-10-04 05:29:55','2012-10-04 05:32:10',145,125,44,88,111,'commHealthCenter',1,1),(77,1,'2012-10-04 05:29:55','2012-10-04 05:32:24',254,154,155,145,89,'familyWelCenter',1,1),(78,1,'2012-10-04 05:29:55','2012-10-04 05:32:36',NULL,254,145,444,NULL,'ayurCenter',1,1),(79,1,'2012-10-04 05:29:55','2012-10-04 05:32:46',NULL,264,145,144,NULL,'homeoCells',1,1),(80,0,'2012-10-04 05:29:55','2012-10-04 05:29:55',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(81,1,'2012-10-04 05:47:44','2012-10-04 05:48:33',154,88,222,111,75,'govHospitals',2,2),(82,1,'2012-10-04 05:47:44','2012-10-04 05:48:47',266,254,144,154,148,'govDispensaries',2,2),(83,1,'2012-10-04 05:47:44','2012-10-04 05:49:02',145,154,145,225,22,'primHealthCenter',2,2),(84,1,'2012-10-04 05:47:44','2012-10-04 05:49:16',154,88,45,111,58,'subCenter',2,2),(85,1,'2012-10-04 05:47:44','2012-10-04 05:49:27',255,154,145,245,145,'commHealthCenter',2,2),(86,1,'2012-10-04 05:47:44','2012-10-04 05:49:45',254,265,155,145,100,'familyWelCenter',2,2),(87,1,'2012-10-04 05:47:44','2012-10-04 05:50:05',NULL,154,222,111,NULL,'ayurCenter',2,2),(88,1,'2012-10-04 05:47:44','2012-10-04 05:50:15',NULL,265,115,11,NULL,'homeoCells',2,2),(89,0,'2012-10-04 05:47:44','2012-10-04 05:47:44',NULL,NULL,NULL,NULL,NULL,'otherCenters',2,2),(90,1,'2012-10-04 05:57:40','2012-10-04 05:58:21',125,125,111,254,144,'govHospitals',2,2),(91,1,'2012-10-04 05:57:40','2012-10-04 05:58:34',144,254,222,125,125,'govDispensaries',2,2),(92,1,'2012-10-04 05:57:40','2012-10-04 05:58:48',222,154,154,145,25,'primHealthCenter',2,2),(93,1,'2012-10-04 05:57:40','2012-10-04 05:58:59',254,88,55,55,55,'subCenter',2,2),(94,1,'2012-10-04 05:57:40','2012-10-04 05:59:17',222,254,355,25,154,'commHealthCenter',2,2),(95,1,'2012-10-04 05:57:40','2012-10-04 05:59:28',254,154,111,154,22,'familyWelCenter',2,2),(96,1,'2012-10-04 05:57:40','2012-10-04 05:59:38',NULL,245,111,154,NULL,'ayurCenter',2,2),(97,1,'2012-10-04 05:57:40','2012-10-04 05:59:47',NULL,154,254,222,NULL,'homeoCells',2,2),(98,0,'2012-10-04 05:57:40','2012-10-04 05:57:40',NULL,NULL,NULL,NULL,NULL,'otherCenters',2,2),(99,1,'2012-10-04 06:08:05','2012-10-04 06:08:41',111,254,12,254,154,'govHospitals',2,2),(100,1,'2012-10-04 06:08:05','2012-10-04 06:08:50',254,154,222,145,111,'govDispensaries',2,2),(101,1,'2012-10-04 06:08:05','2012-10-04 06:08:59',145,154,12,154,111,'primHealthCenter',2,2),(102,1,'2012-10-04 06:08:05','2012-10-04 06:09:11',145,254,145,111,254,'subCenter',2,2),(103,1,'2012-10-04 06:08:05','2012-10-04 06:09:25',111,254,111,254,145,'commHealthCenter',2,2),(104,1,'2012-10-04 06:08:05','2012-10-04 06:09:34',154,254,111,145,111,'familyWelCenter',2,2),(105,1,'2012-10-04 06:08:05','2012-10-04 06:09:42',NULL,154,154,22,NULL,'ayurCenter',2,2),(106,1,'2012-10-04 06:08:05','2012-10-04 06:09:50',NULL,154,45,45,NULL,'homeoCells',2,2),(107,0,'2012-10-04 06:08:05','2012-10-04 06:08:05',NULL,NULL,NULL,NULL,NULL,'otherCenters',2,2),(108,0,'2012-10-04 07:29:26','2012-10-04 07:29:26',98,52,70,74,63,'govHospitals',4,4),(109,0,'2012-10-04 07:29:26','2012-10-04 07:29:26',85,23,74,80,96,'govDispensaries',4,4),(110,0,'2012-10-04 07:29:26','2012-10-04 07:29:26',84,32,94,85,88,'primHealthCenter',4,4),(111,0,'2012-10-04 07:29:26','2012-10-04 07:29:26',99,23,94,75,80,'subCenter',4,4),(112,0,'2012-10-04 07:29:26','2012-10-04 07:29:26',86,56,95,74,96,'commHealthCenter',4,4),(113,0,'2012-10-04 07:29:26','2012-10-04 07:29:26',12,85,74,32,36,'familyWelCenter',4,4),(114,0,'2012-10-04 07:29:27','2012-10-04 07:29:27',NULL,96,74,88,NULL,'ayurCenter',4,4),(115,0,'2012-10-04 07:29:27','2012-10-04 07:29:27',NULL,23,96,64,NULL,'homeoCells',4,4),(116,1,'2012-10-04 08:37:14','2012-10-04 08:38:55',123,5,321,432,12,'govHospitals',2,2),(117,1,'2012-10-04 08:37:14','2012-10-04 08:39:16',12,1,98,123,5,'govDispensaries',2,2),(118,1,'2012-10-04 08:37:14','2012-10-04 08:39:41',98,4,211,312,15,'primHealthCenter',2,2),(119,1,'2012-10-04 08:37:14','2012-10-04 08:40:06',15,2,111,123,8,'subCenter',2,2),(120,1,'2012-10-04 08:37:14','2012-10-04 08:40:30',11,2,121,123,4,'commHealthCenter',2,2),(121,1,'2012-10-04 08:37:14','2012-10-04 08:40:50',15,2,124,213,5,'familyWelCenter',2,2),(122,1,'2012-10-04 08:37:14','2012-10-04 08:41:03',NULL,1,121,123,NULL,'ayurCenter',2,2),(123,0,'2012-10-04 08:37:14','2012-10-04 08:37:14',NULL,NULL,NULL,NULL,NULL,'homeoCells',2,2),(124,0,'2012-10-04 08:37:14','2012-10-04 08:37:14',NULL,NULL,NULL,NULL,NULL,'otherCenters',2,2),(125,0,'2012-10-04 08:40:51','2012-10-04 08:40:51',NULL,NULL,NULL,NULL,NULL,'govHospitals',4,4),(126,0,'2012-10-04 08:40:51','2012-10-04 08:40:51',NULL,NULL,NULL,NULL,NULL,'govDispensaries',4,4),(127,0,'2012-10-04 08:40:51','2012-10-04 08:40:51',NULL,NULL,NULL,NULL,NULL,'primHealthCenter',4,4),(128,0,'2012-10-04 08:40:51','2012-10-04 08:40:51',NULL,NULL,NULL,NULL,NULL,'subCenter',4,4),(129,0,'2012-10-04 08:40:51','2012-10-04 08:40:51',NULL,NULL,NULL,NULL,NULL,'commHealthCenter',4,4),(130,0,'2012-10-04 08:40:51','2012-10-04 08:40:51',NULL,NULL,NULL,NULL,NULL,'familyWelCenter',4,4),(131,0,'2012-10-04 08:40:51','2012-10-04 08:40:51',NULL,NULL,NULL,NULL,NULL,'ayurCenter',4,4),(132,0,'2012-10-04 08:40:51','2012-10-04 08:40:51',NULL,863,369,463,NULL,'homeoCells',4,4),(133,0,'2012-10-05 02:17:36','2012-10-05 02:17:36',NULL,NULL,NULL,NULL,NULL,'govHospitals',4,4),(134,0,'2012-10-05 02:17:36','2012-10-05 02:17:36',NULL,NULL,NULL,NULL,NULL,'govDispensaries',4,4),(135,0,'2012-10-05 02:17:36','2012-10-05 02:17:36',NULL,NULL,NULL,NULL,NULL,'primHealthCenter',4,4),(136,0,'2012-10-05 02:17:36','2012-10-05 02:17:36',NULL,NULL,NULL,NULL,NULL,'subCenter',4,4),(137,0,'2012-10-05 02:17:36','2012-10-05 02:17:36',NULL,NULL,NULL,NULL,NULL,'commHealthCenter',4,4),(138,0,'2012-10-05 02:17:36','2012-10-05 02:17:36',65,6,5,5,6,'familyWelCenter',4,4),(139,0,'2012-10-05 02:17:36','2012-10-05 02:17:36',NULL,NULL,NULL,NULL,NULL,'ayurCenter',4,4),(140,0,'2012-10-05 02:17:36','2012-10-05 02:17:36',NULL,6,9659,3,NULL,'homeoCells',4,4),(141,0,'2012-10-05 02:26:20','2012-10-05 02:26:20',85,25,32,74,96,'govHospitals',4,4),(142,0,'2012-10-05 02:26:20','2012-10-05 02:26:20',36,58,42,74,96,'govDispensaries',4,4),(143,0,'2012-10-05 02:26:20','2012-10-05 02:26:20',75,31,45,80,85,'primHealthCenter',4,4),(144,0,'2012-10-05 02:26:20','2012-10-05 02:26:20',74,13,80,43,98,'subCenter',4,4),(145,0,'2012-10-05 02:26:20','2012-10-05 02:26:20',58,52,12,74,36,'commHealthCenter',4,4),(146,0,'2012-10-05 02:26:20','2012-10-05 02:26:20',85,78,34,12,90,'familyWelCenter',4,4),(147,0,'2012-10-05 02:26:20','2012-10-05 02:26:20',NULL,58,30,96,NULL,'ayurCenter',4,4),(148,0,'2012-10-05 02:26:20','2012-10-05 02:26:20',NULL,25,89,64,NULL,'homeoCells',4,4),(149,0,'2012-10-05 05:36:21','2012-10-05 05:36:21',85,23,12,74,96,'govHospitals',4,4),(150,0,'2012-10-05 05:36:21','2012-10-05 05:36:21',70,28,91,45,98,'govDispensaries',4,4),(151,0,'2012-10-05 05:36:21','2012-10-05 05:36:21',87,42,35,52,90,'primHealthCenter',4,4),(152,0,'2012-10-05 05:36:21','2012-10-05 05:36:21',87,85,98,89,93,'subCenter',4,4),(153,0,'2012-10-05 05:36:21','2012-10-05 05:36:21',65,56,58,54,45,'commHealthCenter',4,4),(154,0,'2012-10-05 05:36:21','2012-10-05 05:36:21',75,86,32,12,95,'familyWelCenter',4,4),(155,0,'2012-10-05 05:36:21','2012-10-05 05:36:21',NULL,58,97,72,NULL,'ayurCenter',4,4),(156,0,'2012-10-05 05:36:21','2012-10-05 05:36:21',NULL,23,74,85,NULL,'homeoCells',4,4),(157,0,'2012-10-05 07:41:43','2012-10-05 07:41:43',84,66,94,28,68,'govHospitals',4,4),(158,0,'2012-10-05 07:41:43','2012-10-05 07:41:43',74,86,808,15,98,'govDispensaries',4,4),(159,0,'2012-10-05 07:41:43','2012-10-05 07:41:43',80,86,31,70,54,'primHealthCenter',4,4),(160,0,'2012-10-05 07:41:43','2012-10-05 07:41:43',73,26,85,37,54,'subCenter',4,4),(161,0,'2012-10-05 07:41:43','2012-10-05 07:41:43',90,98,14,74,52,'commHealthCenter',4,4),(162,0,'2012-10-05 07:41:43','2012-10-05 07:41:43',28,93,30,10,87,'familyWelCenter',4,4),(163,0,'2012-10-05 07:41:43','2012-10-05 07:41:43',NULL,56,47,55,NULL,'ayurCenter',4,4),(164,0,'2012-10-05 07:41:43','2012-10-05 07:41:43',NULL,83,74,50,NULL,'homeoCells',4,4),(165,0,'2012-10-06 03:32:53','2012-10-06 03:32:53',NULL,NULL,NULL,NULL,NULL,'govHospitals',4,4),(166,0,'2012-10-06 03:32:53','2012-10-06 03:32:53',NULL,NULL,NULL,NULL,NULL,'govDispensaries',4,4),(167,0,'2012-10-06 03:32:53','2012-10-06 03:32:53',NULL,NULL,NULL,NULL,NULL,'primHealthCenter',4,4),(168,0,'2012-10-06 03:32:53','2012-10-06 03:32:53',NULL,NULL,NULL,NULL,NULL,'subCenter',4,4),(169,0,'2012-10-06 03:32:53','2012-10-06 03:32:53',NULL,NULL,NULL,NULL,NULL,'commHealthCenter',4,4),(170,0,'2012-10-06 03:32:53','2012-10-06 03:32:53',NULL,NULL,NULL,NULL,NULL,'familyWelCenter',4,4),(171,0,'2012-10-06 03:32:53','2012-10-06 03:32:53',NULL,NULL,NULL,NULL,NULL,'ayurCenter',4,4),(172,0,'2012-10-06 03:32:53','2012-10-06 03:32:53',NULL,NULL,NULL,NULL,NULL,'homeoCells',4,4),(173,1,'2012-10-09 02:01:57','2012-10-09 02:04:59',155,55,100,245,78,'govHospitals',1,1),(174,1,'2012-10-09 02:01:57','2012-10-09 02:05:18',147,66,100,164,25,'govDispensaries',1,1),(175,1,'2012-10-09 02:01:57','2012-10-09 02:12:39',187,98,144,222,58,'primHealthCenter',1,1),(176,1,'2012-10-09 02:01:57','2012-10-09 02:13:25',220,100,154,245,50,'subCenter',1,1),(177,1,'2012-10-09 02:01:57','2012-10-09 02:15:32',157,77,155,287,64,'commHealthCenter',1,1),(178,1,'2012-10-09 02:01:57','2012-10-09 02:15:48',144,75,177,298,48,'familyWelCenter',1,1),(179,1,'2012-10-09 02:01:57','2012-10-09 02:16:02',NULL,68,145,255,NULL,'ayurCenter',1,1),(180,1,'2012-10-09 02:01:57','2012-10-09 02:16:29',NULL,95,145,99,NULL,'homeoCells',1,1),(181,0,'2012-10-09 02:01:57','2012-10-09 02:01:57',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(182,1,'2012-10-09 02:28:48','2012-10-09 02:31:46',254,58,154,145,55,'govHospitals',1,1),(183,1,'2012-10-09 02:28:48','2012-10-09 02:32:00',145,58,145,154,25,'govDispensaries',1,1),(184,1,'2012-10-09 02:28:48','2012-10-09 02:32:16',145,58,145,154,55,'primHealthCenter',1,1),(185,1,'2012-10-09 02:28:48','2012-10-09 02:32:33',145,99,155,154,55,'subCenter',1,1),(186,1,'2012-10-09 02:28:48','2012-10-09 02:32:59',145,100,144,154,111,'commHealthCenter',1,1),(187,1,'2012-10-09 02:28:48','2012-10-09 02:33:13',145,254,154,145,25,'familyWelCenter',1,1),(188,1,'2012-10-09 02:28:48','2012-10-09 02:33:24',NULL,58,44,55,NULL,'ayurCenter',1,1),(189,1,'2012-10-09 02:28:48','2012-10-09 02:33:37',NULL,58,44,111,NULL,'homeoCells',1,1),(190,0,'2012-10-09 02:28:48','2012-10-09 02:28:48',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(191,1,'2012-10-09 03:08:51','2012-10-09 03:23:25',145,58,144,154,55,'govHospitals',1,1),(192,1,'2012-10-09 03:08:51','2012-10-09 03:23:41',154,88,145,145,55,'govDispensaries',1,1),(193,1,'2012-10-09 03:08:51','2012-10-09 03:25:30',145,58,154,145,55,'primHealthCenter',1,1),(194,1,'2012-10-09 03:08:51','2012-10-09 03:25:58',154,154,154,145,55,'subCenter',1,1),(195,1,'2012-10-09 03:08:51','2012-10-09 03:26:13',154,58,154,154,55,'commHealthCenter',1,1),(196,1,'2012-10-09 03:08:51','2012-10-09 03:26:36',157,88,154,154,55,'familyWelCenter',1,1),(197,1,'2012-10-09 03:08:51','2012-10-09 03:26:53',NULL,58,154,154,NULL,'ayurCenter',1,1),(198,1,'2012-10-09 03:08:51','2012-10-09 03:27:51',NULL,55,44,55,NULL,'homeoCells',1,1),(199,0,'2012-10-09 03:08:51','2012-10-09 03:08:51',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1),(200,1,'2012-10-09 04:05:00','2012-10-09 04:11:49',145,58,154,145,55,'govHospitals',1,1),(201,1,'2012-10-09 04:05:00','2012-10-09 04:12:05',254,99,145,145,25,'govDispensaries',1,1),(202,1,'2012-10-09 04:05:00','2012-10-09 04:12:37',254,58,154,254,111,'primHealthCenter',1,1),(203,1,'2012-10-09 04:05:00','2012-10-09 04:13:08',254,58,154,145,25,'subCenter',1,1),(204,1,'2012-10-09 04:05:00','2012-10-09 04:13:27',145,100,154,145,25,'commHealthCenter',1,1),(205,1,'2012-10-09 04:05:00','2012-10-09 04:13:43',254,58,154,145,25,'familyWelCenter',1,1),(206,1,'2012-10-09 04:05:00','2012-10-09 04:15:12',NULL,254,154,145,NULL,'ayurCenter',1,1),(207,1,'2012-10-09 04:05:00','2012-10-09 04:15:33',NULL,58,154,55,NULL,'homeoCells',1,1),(208,0,'2012-10-09 04:05:00','2012-10-09 04:05:00',NULL,NULL,NULL,NULL,NULL,'otherCenters',1,1);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_progress_records`
--

DROP TABLE IF EXISTS `in_progress_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `in_progress_records` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FKAA2BAE0A3746EB9E` (`village_id`),
  KEY `FKAA2BAE0A64847CFA` (`user_updated_id`),
  KEY `FKAA2BAE0AC7C493AD` (`user_created_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_progress_records`
--

LOCK TABLES `in_progress_records` WRITE;
/*!40000 ALTER TABLE `in_progress_records` DISABLE KEYS */;
INSERT INTO `in_progress_records` VALUES (18,0,'2012-10-09 09:55:48','2012-10-09 09:55:48',1,2,2,2,2012),(10,0,'2012-10-04 05:47:50','2012-10-04 05:47:50',1,4,4,36,1993);
/*!40000 ALTER TABLE `in_progress_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infrastructural_facilities`
--

DROP TABLE IF EXISTS `infrastructural_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infrastructural_facilities` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `isf1` varchar(255) default NULL,
  `isf10` int(11) default NULL,
  `isf11` int(11) default NULL,
  `isf12` int(11) default NULL,
  `isf13` int(11) default NULL,
  `isf14` int(11) default NULL,
  `isf15` int(11) default NULL,
  `isf16` int(11) default NULL,
  `isf17` int(11) default NULL,
  `isf18` int(11) default NULL,
  `isf19` int(11) default NULL,
  `isf2` varchar(255) default NULL,
  `isf20` int(11) default NULL,
  `isf21` int(11) default NULL,
  `isf22` int(11) default NULL,
  `isf23` int(11) default NULL,
  `isf24` int(11) default NULL,
  `isf3` int(11) default NULL,
  `isf4` int(11) default NULL,
  `isf5` int(11) default NULL,
  `isf6` int(11) default NULL,
  `isf7` int(11) default NULL,
  `isf8` int(11) default NULL,
  `isf9` int(11) default NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK1223CB533746EB9E` (`village_id`),
  KEY `FK1223CB5364847CFA` (`user_updated_id`),
  KEY `FK1223CB53C7C493AD` (`user_created_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infrastructural_facilities`
--

LOCK TABLES `infrastructural_facilities` WRITE;
/*!40000 ALTER TABLE `infrastructural_facilities` DISABLE KEYS */;
INSERT INTO `infrastructural_facilities` VALUES (1,4,'2012-10-04 03:52:21',NULL,5,10,20,55,35,15,10,NULL,10,15,NULL,25,30,50,60,89,66,55,100,90,158,10,5,'2012-10-04 04:06:20',1,'CP',1,1,12,2012),(2,4,'2012-10-04 04:15:17',NULL,10,22,30,14,22,55,56,NULL,65,66,NULL,35,35,58,44,45,147,250,300,247,266,25,19,'2012-10-04 04:25:31',1,'CP',1,1,18,2012),(3,0,'2012-10-04 04:23:52',NULL,76,99,40,23,31,95,50,NULL,33,77,NULL,26,98,74,58,63,58,96,75,25,18,84,30,'2012-10-04 04:23:52',1,'CP',4,4,1,1990),(4,1,'2012-10-04 04:26:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-04 04:26:30',1,'CP',1,1,13,2012),(5,4,'2012-10-04 04:30:35',NULL,25,30,19,25,26,28,24,NULL,26,24,NULL,96,58,78,58,56,95,23,55,58,99,50,26,'2012-10-04 04:41:15',1,'CP',1,1,14,2012),(6,4,'2012-10-04 04:42:42',NULL,47,41,54,25,35,32,29,NULL,33,23,NULL,44,44,34,45,44,187,154,98,88,75,56,55,'2012-10-04 04:57:42',1,'CP',1,1,7,2012),(7,4,'2012-10-04 04:58:39',NULL,35,24,8,25,35,24,25,NULL,54,45,NULL,55,35,25,25,48,98,58,45,56,58,52,26,'2012-10-04 05:10:18',1,'CP',1,1,6,2012),(8,4,'2012-10-04 05:12:46',NULL,2,2,2,12,10,10,12,NULL,15,14,NULL,25,22,24,25,22,89,88,78,58,56,10,5,'2012-10-04 05:26:45',1,'CP',1,1,8,2012),(9,4,'2012-10-04 05:29:30',NULL,5,5,5,5,12,12,12,NULL,20,20,NULL,15,14,15,12,12,88,58,55,65,10,10,10,'2012-10-04 05:39:03',1,'CP',1,1,10,2012),(10,4,'2012-10-04 05:51:10',NULL,12,10,15,12,15,14,15,NULL,25,25,NULL,26,26,25,24,25,25,22,32,14,10,1,12,'2012-10-04 05:51:33',1,'CP',2,2,28,2012),(11,4,'2012-10-04 05:53:26',NULL,5,6,8,8,12,12,12,NULL,12,21,NULL,25,25,25,25,25,55,45,47,45,45,45,4,'2012-10-04 06:00:47',1,'CP',2,2,29,2012),(12,4,'2012-10-04 06:03:51',NULL,45,5,5,45,5,20,20,NULL,20,22,NULL,12,11,11,11,11,22,22,2,22,2,22,55,'2012-10-04 06:10:33',1,'CP',2,2,30,2012),(13,0,'2012-10-04 06:07:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-04 06:07:48',2,'CP',4,4,1,1990),(14,0,'2012-10-04 08:43:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,258,369,NULL,852,963,753,98,69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-04 08:43:53',6,'CP',4,4,1,1990),(15,0,'2012-10-05 02:17:36',NULL,6,6,6,6,6,6,6,NULL,NULL,NULL,NULL,6,5,39,95,NULL,6,6,6,9,996,6,6,'2012-10-05 02:17:36',9,'CP',4,4,1,2012),(16,0,'2012-10-05 02:21:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-05 02:21:53',1,'CP',4,4,1,2012),(17,0,'2012-10-05 02:26:20',NULL,75,12,32,32,12,52,75,NULL,25,86,NULL,23,63,52,85,96,85,96,74,12,32,5,96,'2012-10-05 02:26:20',12,'CP',4,4,1,1990),(18,0,'2012-10-05 05:36:21',NULL,75,10,30,86,99,72,88,NULL,23,89,NULL,23,96,85,74,12,23,65,74,80,72,35,98,'2012-10-05 05:36:21',10,'CP',4,4,1,1990),(19,0,'2012-10-05 07:41:43',NULL,25,84,35,70,80,63,55,NULL,56,65,NULL,85,93,39,48,70,21,36,84,80,74,96,55,'2012-10-05 07:41:43',12,'CP',4,4,29,1990),(20,0,'2012-10-05 08:43:39',NULL,4,1,96,8,45,25,12,NULL,33,99,NULL,6,9,3,8,5,6,9,8,5,2,3,7,'2012-10-05 08:43:39',12,'CP',4,4,3,1991),(21,4,'2012-10-09 01:27:46',NULL,8,5,2,11,12,10,10,NULL,15,20,NULL,12,11,11,12,25,6,5,8,5,5,4,9,'2012-10-09 02:17:28',1,'CP',1,1,31,2012),(22,4,'2012-10-09 02:25:49',NULL,3,3,8,14,15,2,2,NULL,22,20,NULL,12,35,24,12,11,25,5,3,14,10,10,10,'2012-10-09 02:41:06',1,'CP',1,1,39,2012),(23,4,'2012-10-09 02:52:01',NULL,3,3,15,2,22,20,24,NULL,20,20,NULL,25,35,25,25,25,2,5,3,14,10,2,5,'2012-10-09 03:31:34',1,'CP',1,1,40,2012),(24,4,'2012-10-09 03:57:39',NULL,3,3,5,7,2,2,2,NULL,20,20,NULL,25,35,25,12,25,2,5,3,2,10,2,5,'2012-10-09 06:37:52',1,'CP',1,1,41,2012),(25,5,'2012-10-09 07:23:08',NULL,2,3,3,2,7,7,8,NULL,22,15,NULL,25,35,11,25,1,12,8,11,11,11,22,3,'2012-10-09 07:24:47',1,'CP',2,2,38,2012);
/*!40000 ALTER TABLE `infrastructural_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_of_enrolment_in_college`
--

DROP TABLE IF EXISTS `no_of_enrolment_in_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_of_enrolment_in_college` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `name` varchar(255) default NULL,
  `no_of_new_entrants_entry_boys` int(11) default NULL,
  `no_of_new_entrants_entry_girls` int(11) default NULL,
  `no_of_student_attending_boys` int(11) default NULL,
  `no_of_student_attending_girls` int(11) default NULL,
  `no_of_student_discontinued_studies_boys` int(11) default NULL,
  `no_of_student_discontinued_studies_girls` int(11) default NULL,
  `no_of_student_enrolled_boys` int(11) default NULL,
  `no_of_student_enrolled_girls` int(11) default NULL,
  `no_of_students_enrolled_in_university_boys` int(11) default NULL,
  `no_of_students_enrolled_in_university_girls` int(11) default NULL,
  `reason_of_discontinuation_economic` int(11) default NULL,
  `reason_of_discontinuation_non_economic` int(11) default NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC5F025A23746EB9E` (`village_id`),
  KEY `FKC5F025A264847CFA` (`user_updated_id`),
  KEY `FKC5F025A2C7C493AD` (`user_created_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_of_enrolment_in_college`
--

LOCK TABLES `no_of_enrolment_in_college` WRITE;
/*!40000 ALTER TABLE `no_of_enrolment_in_college` DISABLE KEYS */;
INSERT INTO `no_of_enrolment_in_college` VALUES (1,0,'2012-10-04 04:05:14','2012-10-04 04:05:14',1,'YT',41,41,354,247,5,5,254,382,25,25,1,1,1,1,12,2012),(2,0,'2012-10-04 04:23:52','2012-10-04 04:23:52',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(3,0,'2012-10-04 04:24:42','2012-10-04 04:24:42',1,'25',25,28,600,547,56,54,654,589,26,24,5,5,1,1,18,2012),(4,0,'2012-10-04 04:40:28','2012-10-04 04:40:28',1,'25',58,55,245,245,8,8,354,254,89,88,4,4,1,1,14,2012),(5,0,'2012-10-04 04:56:54','2012-10-04 04:56:54',1,'25',25,31,254,122,8,9,254,200,72,56,4,6,1,1,7,2012),(6,0,'2012-10-04 05:09:01','2012-10-04 05:09:01',1,'25',254,123,154,155,50,10,154,155,15,45,2,2,1,1,6,2012),(7,0,'2012-10-04 05:25:35','2012-10-04 05:25:35',1,'25',89,89,254,244,65,65,154,155,45,45,5,5,1,1,8,2012),(8,0,'2012-10-04 05:34:22','2012-10-04 05:34:22',1,'25',154,144,265,222,25,2,265,222,55,11,55,5,1,1,10,2012),(9,0,'2012-10-04 05:44:42','2012-10-04 05:44:42',1,'25',88,88,254,145,5,5,254,145,12,12,26,26,2,2,28,2012),(10,0,'2012-10-04 05:54:33','2012-10-04 05:54:33',1,'25',25,25,125,111,23,23,125,111,45,44,5,5,2,2,29,2012),(11,0,'2012-10-04 06:04:53','2012-10-04 06:04:53',1,'25',25,25,125,111,5,5,125,111,88,99,4,6,2,2,30,2012),(12,0,'2012-10-04 06:07:48','2012-10-04 06:07:48',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(13,0,'2012-10-04 06:20:08','2012-10-04 06:20:08',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(14,0,'2012-10-04 08:26:30','2012-10-04 08:26:30',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(15,1,'2012-10-04 08:35:42','2012-10-09 07:24:34',1,'College 01',124,99,1111,888,123,56,1234,912,143,58,111,50,2,2,38,2012),(16,0,'2012-10-05 02:17:36','2012-10-05 02:17:36',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,2012),(17,0,'2012-10-05 02:26:20','2012-10-05 02:26:20',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(18,0,'2012-10-05 05:36:21','2012-10-05 05:36:21',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(19,0,'2012-10-05 06:31:15','2012-10-05 06:31:15',9,'vg',74,90,35,65,52,37,85,88,64,43,52,59,4,4,1,1990),(20,0,'2012-10-05 07:41:43','2012-10-05 07:41:43',12,'tj',80,70,67,90,50,40,56,66,99,86,30,10,4,4,29,1990),(21,0,'2012-10-05 08:24:06','2012-10-05 08:24:06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,2,1990),(22,0,'2012-10-05 08:43:39','2012-10-05 08:43:39',12,'yu',63,98,74,52,74,42,96,80,95,96,68,85,4,4,3,1991),(23,0,'2012-10-06 03:32:53','2012-10-06 03:32:53',4,'tap',NULL,NULL,8,5,NULL,NULL,58,2,NULL,NULL,NULL,NULL,4,4,1,1999),(24,0,'2012-10-09 02:01:01','2012-10-09 02:01:01',1,'assam',0,12,355,268,1,1,355,268,36,55,0,0,1,1,31,2012),(25,0,'2012-10-09 02:39:43','2012-10-09 02:39:43',1,'assam',25,25,265,155,5,2,125,155,25,44,4,4,1,1,39,2012),(26,0,'2012-10-09 03:00:01','2012-10-09 03:00:01',1,'assam',41,12,254,155,8,1,254,155,12,45,2,1,1,1,40,2012),(27,0,'2012-10-09 05:48:03','2012-10-09 05:48:03',1,'assam',25,25,254,155,8,5,254,155,25,24,1,1,1,1,41,2012);
/*!40000 ALTER TABLE `no_of_enrolment_in_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_of_enrolment_in_edu`
--

DROP TABLE IF EXISTS `no_of_enrolment_in_edu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_of_enrolment_in_edu` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `institution_type` varchar(255) default NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `name` varchar(255) default NULL,
  `new_entrants_boys` int(11) default NULL,
  `new_entrants_girls` int(11) default NULL,
  `no_child_never_enrolled` int(11) default NULL,
  `no_of_teacher_female` int(11) default NULL,
  `no_of_teacher_male` int(11) default NULL,
  `reason_of_discontinuation_economic` int(11) default NULL,
  `reason_of_discontinuation_non_economic` int(11) default NULL,
  `student_attending_boys` int(11) default NULL,
  `student_attending_girls` int(11) default NULL,
  `student_discontinued_studies_boys` int(11) default NULL,
  `student_discontinued_studies_girls` int(11) default NULL,
  `student_enrolled_boys` int(11) default NULL,
  `student_enrolled_girls` int(11) default NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK68DC09413746EB9E` (`village_id`),
  KEY `FK68DC094164847CFA` (`user_updated_id`),
  KEY `FK68DC0941C7C493AD` (`user_created_id`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_of_enrolment_in_edu`
--

LOCK TABLES `no_of_enrolment_in_edu` WRITE;
/*!40000 ALTER TABLE `no_of_enrolment_in_edu` DISABLE KEYS */;
INSERT INTO `no_of_enrolment_in_edu` VALUES (1,1,'2012-10-04 04:00:17','Pre-Primary School','2012-10-04 04:00:17',1,'ABc',5,5,NULL,25,25,1,1,298,199,2,2,300,250,1,1,12,2012),(2,1,'2012-10-04 04:00:51','Primary School','2012-10-04 04:00:51',1,'AAA',2,2,NULL,45,55,1,1,150,168,5,5,150,175,1,1,12,2012),(3,1,'2012-10-04 04:01:31','Middle School','2012-10-04 04:01:31',1,'SS',5,5,NULL,66,54,1,1,440,450,6,6,458,496,1,1,12,2012),(4,2,'2012-10-04 04:04:04','High School','2012-10-04 04:28:53',1,'WW',145,123,8,78,67,12,11,123,22,2,12,123,111,1,1,12,2012),(5,1,'2012-10-04 04:04:31','Senior Secondary School','2012-10-04 04:04:31',1,'LK',6,6,NULL,24,25,1,1,400,300,5,5,450,300,1,1,12,2012),(6,1,'2012-10-04 04:21:48','Pre-Primary School','2012-10-04 04:21:48',1,'25',25,255,NULL,25,28,1,1,288,145,5,5,298,145,1,1,18,2012),(7,1,'2012-10-04 04:22:27','Primary School','2012-10-04 04:22:27',1,'25',25,25,NULL,88,65,5,5,256,245,6,6,300,250,1,1,18,2012),(8,1,'2012-10-04 04:22:55','Middle School','2012-10-04 04:22:55',1,'25',8,8,NULL,55,68,2,2,145,254,4,4,156,254,1,1,18,2012),(9,1,'2012-10-04 04:23:31','High School','2012-10-04 04:23:31',1,'25',5,6,8,22,28,6,4,245,214,8,8,264,258,1,1,18,2012),(10,0,'2012-10-04 04:23:52','Pre-Primary School','2012-10-04 04:23:52',1,'PRE',74,99,NULL,11,33,66,44,87,58,88,77,85,96,4,4,1,1990),(11,0,'2012-10-04 04:23:52','Primary School','2012-10-04 04:23:52',1,'PRI',25,12,NULL,68,48,80,90,74,36,84,53,96,85,4,4,1,1990),(12,0,'2012-10-04 04:23:52','Middle School','2012-10-04 04:23:52',1,'MID',80,76,NULL,64,59,35,97,51,35,94,25,54,26,4,4,1,1990),(13,0,'2012-10-04 04:23:52','High School','2012-10-04 04:23:52',1,'HIG',99,12,NULL,48,30,40,97,84,68,28,70,95,73,4,4,1,1990),(14,0,'2012-10-04 04:23:52','Senior Secondary School','2012-10-04 04:23:52',1,'SEN',73,81,NULL,71,83,37,49,45,68,58,91,69,85,4,4,1,1990),(15,1,'2012-10-04 04:24:07','Senior Secondary School','2012-10-04 04:24:07',1,'25',55,25,NULL,58,54,8,8,200,240,6,6,268,245,1,1,18,2012),(16,1,'2012-10-04 04:37:49','Pre-Primary School','2012-10-04 04:37:49',1,'25',6,6,NULL,55,68,2,4,85,45,25,25,254,145,1,1,14,2012),(17,1,'2012-10-04 04:38:15','Primary School','2012-10-04 04:38:15',1,'25',26,25,NULL,45,48,5,5,145,142,54,56,245,258,1,1,14,2012),(18,1,'2012-10-04 04:38:59','Middle School','2012-10-04 04:38:59',1,'25',254,23,NULL,35,98,5,1,400,289,54,5,456,235,1,1,14,2012),(19,1,'2012-10-04 04:39:29','High School','2012-10-04 04:39:29',1,'25',25,14,40,88,98,5,5,200,300,35,31,254,300,1,1,14,2012),(20,1,'2012-10-04 04:39:53','Senior Secondary School','2012-10-04 04:39:53',1,'25',10,10,NULL,14,85,2,3,254,245,5,5,247,299,1,1,14,2012),(21,1,'2012-10-04 04:54:23','Pre-Primary School','2012-10-04 04:54:23',1,'25',99,85,NULL,89,99,35,35,266,189,5,5,298,189,1,1,7,2012),(22,1,'2012-10-04 04:54:54','Primary School','2012-10-04 04:54:54',1,'25',56,25,NULL,144,165,4,8,88,99,10,10,265,254,1,1,7,2012),(23,1,'2012-10-04 04:55:26','Middle School','2012-10-04 04:55:26',1,'25',35,25,NULL,55,98,4,6,222,145,10,1,230,154,1,1,7,2012),(24,1,'2012-10-04 04:55:59','High School','2012-10-04 04:55:59',1,'25',35,25,3,45,55,5,6,178,155,13,14,187,155,1,1,7,2012),(25,1,'2012-10-04 04:56:28','Senior Secondary School','2012-10-04 04:56:28',1,'25',98,58,NULL,89,89,35,25,25,45,5,5,178,166,1,1,7,2012),(26,1,'2012-10-04 05:05:05','Pre-Primary School','2012-10-04 05:05:05',1,'25',25,26,NULL,83,85,35,31,255,144,23,20,264,144,1,1,6,2012),(27,1,'2012-10-04 05:06:56','Primary School','2012-10-04 05:06:56',1,'25',5,5,NULL,88,89,5,5,145,85,25,10,154,99,1,1,6,2012),(28,1,'2012-10-04 05:07:28','Middle School','2012-10-04 05:07:28',1,'25',35,34,NULL,24,24,35,25,25,24,10,10,154,155,1,1,6,2012),(29,1,'2012-10-04 05:08:06','High School','2012-10-04 05:08:06',1,'25',25,24,5,99,99,36,35,145,222,5,5,254,222,1,1,6,2012),(30,1,'2012-10-04 05:08:32','Senior Secondary School','2012-10-04 05:08:32',1,'25',26,26,NULL,45,78,4,4,145,222,54,5,265,222,1,1,6,2012),(31,1,'2012-10-04 05:21:23','Pre-Primary School','2012-10-04 05:21:23',1,'25',20,20,NULL,88,88,35,35,154,144,5,5,154,144,1,1,8,2012),(32,1,'2012-10-04 05:21:58','Primary School','2012-10-04 05:21:58',1,'25',55,5,NULL,88,78,5,5,256,255,5,5,256,255,1,1,8,2012),(33,1,'2012-10-04 05:23:36','Middle School','2012-10-04 05:23:36',1,'25',56,56,NULL,89,89,6,6,255,150,25,25,255,154,1,1,8,2012),(34,1,'2012-10-04 05:24:29','High School','2012-10-04 05:24:29',1,'25',88,98,5,88,88,9,9,144,154,5,5,144,154,1,1,8,2012),(35,1,'2012-10-04 05:25:04','Senior Secondary School','2012-10-04 05:25:04',1,'25',58,58,NULL,89,88,5,5,265,154,99,99,265,154,1,1,8,2012),(36,1,'2012-10-04 05:36:39','Pre-Primary School','2012-10-04 05:36:39',1,'25',54,54,NULL,88,88,5,5,144,154,55,55,141,154,1,1,10,2012),(37,1,'2012-10-04 05:37:17','Primary School','2012-10-04 05:37:17',1,'25',55,55,NULL,89,88,4,4,254,155,25,25,254,155,1,1,10,2012),(38,1,'2012-10-04 05:37:52','Middle School','2012-10-04 05:37:52',1,'25',55,5,NULL,87,88,56,56,154,111,55,5,154,111,1,1,10,2012),(39,1,'2012-10-04 05:38:24','High School','2012-10-04 05:38:24',1,'25',88,85,45,58,58,54,54,154,154,5,5,254,222,1,1,10,2012),(40,1,'2012-10-04 05:38:44','Senior Secondary School','2012-10-04 05:38:44',1,'25',35,35,NULL,85,87,24,24,254,145,25,25,254,145,1,1,10,2012),(41,0,'2012-10-04 05:45:42','Pre-Primary School','2012-10-04 05:45:42',1,'25',25,44,NULL,77,88,25,22,254,154,6,4,254,154,2,2,28,2012),(42,0,'2012-10-04 05:46:06','Primary School','2012-10-04 05:46:06',1,'25',55,45,NULL,89,89,10,10,154,254,20,20,154,254,2,2,28,2012),(43,0,'2012-10-04 05:46:32','Middle School','2012-10-04 05:46:32',1,'25',25,25,NULL,88,89,5,5,111,145,5,9,111,154,2,2,28,2012),(44,0,'2012-10-04 05:46:56','High School','2012-10-04 05:46:56',1,'25',20,20,4,98,99,6,8,222,145,14,12,222,154,2,2,28,2012),(45,0,'2012-10-04 05:47:39','Senior Secondary School','2012-10-04 05:47:39',1,'25',25,25,NULL,89,89,85,85,120,145,55,55,125,145,2,2,28,2012),(46,0,'2012-10-04 05:55:45','Pre-Primary School','2012-10-04 05:55:45',1,'25',25,2,NULL,78,88,6,4,125,144,5,2,125,144,2,2,29,2012),(47,0,'2012-10-04 05:56:08','Primary School','2012-10-04 05:56:08',1,'25',25,25,NULL,99,98,5,5,265,222,12,12,265,222,2,2,29,2012),(48,0,'2012-10-04 05:56:29','Middle School','2012-10-04 05:56:29',1,'25',125,55,NULL,98,88,26,26,254,125,55,26,265,222,2,2,29,2012),(49,0,'2012-10-04 05:56:55','High School','2012-10-04 05:56:55',1,'25',25,25,5,98,99,5,5,125,122,26,26,125,122,2,2,29,2012),(50,0,'2012-10-04 05:57:27','Senior Secondary School','2012-10-04 05:57:27',1,'25',25,25,NULL,99,89,6,6,251,152,2,6,125,125,2,2,29,2012),(51,0,'2012-10-04 06:05:41','Pre-Primary School','2012-10-04 06:05:41',1,'25',25,25,NULL,75,88,35,5,125,111,5,5,125,111,2,2,30,2012),(52,0,'2012-10-04 06:06:00','Primary School','2012-10-04 06:06:00',1,'25',25,22,NULL,85,85,2,2,125,144,5,5,125,145,2,2,30,2012),(53,0,'2012-10-04 06:06:18','Middle School','2012-10-04 06:06:18',1,'25',154,14,NULL,88,89,55,55,254,222,55,5,254,222,2,2,30,2012),(54,1,'2012-10-04 06:06:38','High School','2012-10-04 06:07:39',1,'25',265,55,5,88,89,2,2,254,111,6,4,254,111,2,2,30,2012),(55,0,'2012-10-04 06:07:48','Pre-Primary School','2012-10-04 06:07:48',2,'PRE',23,41,NULL,65,74,56,88,85,74,27,12,99,66,4,4,1,1990),(56,0,'2012-10-04 06:07:48','Primary School','2012-10-04 06:07:48',2,'PRI',15,86,NULL,65,84,25,75,74,23,51,30,96,85,4,4,1,1990),(57,0,'2012-10-04 06:07:48','Middle School','2012-10-04 06:07:48',2,'MID',12,32,NULL,14,98,74,25,52,74,88,66,96,63,4,4,1,1990),(58,0,'2012-10-04 06:07:48','High School','2012-10-04 06:07:48',2,'HIG',65,35,NULL,65,87,12,32,74,85,74,29,98,63,4,4,1,1990),(59,0,'2012-10-04 06:07:48','Senior Secondary School','2012-10-04 06:07:48',2,'SEC',82,76,NULL,93,85,73,97,96,54,80,86,63,64,4,4,1,1990),(60,0,'2012-10-04 06:07:56','Senior Secondary School','2012-10-04 06:07:56',1,'25',25,25,NULL,77,87,6,6,125,111,5,5,125,111,2,2,30,2012),(61,0,'2012-10-04 06:20:07','Pre-Primary School','2012-10-04 06:20:07',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(62,0,'2012-10-04 06:20:08','Primary School','2012-10-04 06:20:08',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(63,0,'2012-10-04 06:20:08','Middle School','2012-10-04 06:20:08',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(64,0,'2012-10-04 06:20:08','High School','2012-10-04 06:20:08',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(65,0,'2012-10-04 06:20:08','Senior Secondary School','2012-10-04 06:20:08',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(66,0,'2012-10-04 08:26:30','Pre-Primary School','2012-10-04 08:26:30',6,'PRE',15,18,NULL,87,36,88,25,23,74,56,59,97,85,4,4,1,1990),(67,0,'2012-10-04 08:26:30','Primary School','2012-10-04 08:26:30',6,'PRI',93,72,NULL,50,70,38,95,86,74,58,54,54,85,4,4,1,1990),(68,0,'2012-10-04 08:26:30','Middle School','2012-10-04 08:26:30',6,'SC',36,15,NULL,99,88,45,68,54,25,45,78,96,87,4,4,1,1990),(69,0,'2012-10-04 08:26:30','High School','2012-10-04 08:26:30',6,'HIG',41,74,NULL,81,34,26,37,63,52,85,91,85,96,4,4,1,1990),(70,0,'2012-10-04 08:26:30','Senior Secondary School','2012-10-04 08:26:30',6,'SEC',56,67,NULL,76,87,90,98,34,45,78,89,12,23,4,4,1,1990),(71,3,'2012-10-04 08:28:13','Pre-Primary School','2012-10-09 07:24:22',1,'Pre primary school 01',23,21,NULL,6,13,8,5,100,45,13,23,145,123,2,2,38,2012),(72,0,'2012-10-04 08:30:05','Pre-Primary School','2012-10-04 08:30:05',1,'Pre primary school 02',23,32,NULL,10,18,23,22,211,100,23,43,23121,123,2,2,38,2012),(73,0,'2012-10-04 08:31:01','Primary School','2012-10-04 08:31:01',1,'Primary school 01',24,41,NULL,12,21,12,21,201,111,21,12,211,121,2,2,38,2012),(74,1,'2012-10-04 08:31:59','Middle School','2012-10-09 07:24:30',1,'Middle 01',2,3,NULL,4,7,23,3,11,8,2,3,21,12,2,2,38,2012),(75,0,'2012-10-04 08:33:07','High School','2012-10-04 08:33:07',1,'High School',24,21,32,11,17,19,12,201,143,19,12,211,155,2,2,38,2012),(76,0,'2012-10-04 08:34:20','Senior Secondary School','2012-10-04 08:34:20',1,'Senior Secondary School',43,27,NULL,16,21,32,17,298,145,41,21,321,198,2,2,38,2012),(77,0,'2012-10-05 02:26:20','Pre-Primary School','2012-10-05 02:26:20',12,'PRE',78,97,NULL,12,74,97,35,41,15,85,80,53,62,4,4,1,1990),(78,0,'2012-10-05 02:26:20','Primary School','2012-10-05 02:26:20',12,'PRI',74,12,NULL,93,70,14,98,69,36,95,75,52,98,4,4,1,1990),(79,0,'2012-10-05 02:26:20','Middle School','2012-10-05 02:26:20',12,'MID',47,18,NULL,85,37,80,85,12,32,91,38,96,80,4,4,1,1990),(80,0,'2012-10-05 02:26:20','High School','2012-10-05 02:26:20',12,'HIG',78,90,NULL,52,81,43,74,52,41,82,35,69,36,4,4,1,1990),(81,0,'2012-10-05 02:26:20','Senior Secondary School','2012-10-05 02:26:20',12,'SEN',80,94,NULL,82,94,68,73,54,74,23,15,62,36,4,4,1,1990),(82,0,'2012-10-05 05:36:21','Pre-Primary School','2012-10-05 05:36:21',10,'fj',65,71,NULL,852,871,885,324,25,85,82,756,85,87,4,4,1,1990),(83,0,'2012-10-05 05:36:21','Primary School','2012-10-05 05:36:21',10,'ssh',856,57,NULL,85,37,98,57,956,744,95,354,563,987,4,4,1,1990),(84,0,'2012-10-05 05:36:21','Middle School','2012-10-05 05:36:21',10,'fk',34,75,NULL,98,250,280,544,45,82,44,90,85,65,4,4,1,1990),(85,0,'2012-10-05 05:36:21','High School','2012-10-05 05:36:21',10,'xf',75,65,NULL,84,25,43,91,98,25,88,24,555,75,4,4,1,1990),(86,0,'2012-10-05 05:36:21','Senior Secondary School','2012-10-05 05:36:21',10,'ghh',84,26,NULL,43,74,80,56,96,75,35,74,52,54,4,4,1,1990),(87,0,'2012-10-05 06:31:15','Pre-Primary School','2012-10-05 06:31:15',9,'hu',25,74,NULL,80,85,42,35,67,72,96,25,85,98,4,4,1,1990),(88,0,'2012-10-05 06:31:15','Primary School','2012-10-05 06:31:15',9,'vgh',44,85,NULL,55,456,36,22,885,66,55,85,988,88,4,4,1,1990),(89,0,'2012-10-05 06:31:15','Middle School','2012-10-05 06:31:15',9,'hu',35,15,NULL,15,35,80,42,71,28,76,54,98,85,4,4,1,1990),(90,0,'2012-10-05 06:31:15','High School','2012-10-05 06:31:15',9,'ch',58,58,NULL,28,94,43,80,85,87,77,38,28,64,4,4,1,1990),(91,0,'2012-10-05 06:31:15','Senior Secondary School','2012-10-05 06:31:15',9,'hl',95,85,NULL,45,97,45,83,58,73,68,80,75,77,4,4,1,1990),(92,0,'2012-10-05 07:41:43','Pre-Primary School','2012-10-05 07:41:43',12,'fj',74,70,NULL,80,82,73,95,12,31,83,67,88,69,4,4,29,1990),(93,0,'2012-10-05 07:41:43','Primary School','2012-10-05 07:41:43',12,'xh',80,70,NULL,85,45,12,32,73,12,90,69,98,46,4,4,29,1990),(94,0,'2012-10-05 07:41:43','Middle School','2012-10-05 07:41:43',12,'xgb',28,17,NULL,75,85,98,65,75,64,39,85,86,45,4,4,29,1990),(95,0,'2012-10-05 07:41:43','High School','2012-10-05 07:41:43',12,'gi.',84,28,NULL,48,36,86,97,62,42,76,64,72,977,4,4,29,1990),(96,0,'2012-10-05 07:41:43','Senior Secondary School','2012-10-05 07:41:43',12,'dh',70,50,NULL,75,10,30,20,80,90,60,40,56,54,4,4,29,1990),(97,0,'2012-10-05 08:24:06','Pre-Primary School','2012-10-05 08:24:06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,2,1990),(98,0,'2012-10-05 08:24:06','Primary School','2012-10-05 08:24:06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,2,1990),(99,0,'2012-10-05 08:24:06','Middle School','2012-10-05 08:24:06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,2,1990),(100,0,'2012-10-05 08:24:06','High School','2012-10-05 08:24:06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,2,1990),(101,0,'2012-10-05 08:24:06','Senior Secondary School','2012-10-05 08:24:06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,2,1990),(102,0,'2012-10-05 08:43:39','Pre-Primary School','2012-10-05 08:43:39',12,'bu',45,80,NULL,58,44,25,32,47,25,75,14,96,85,4,4,3,1991),(103,0,'2012-10-05 08:43:39','Primary School','2012-10-05 08:43:39',12,'b',50,60,NULL,68,85,10,90,70,40,20,30,96,80,4,4,3,1991),(104,0,'2012-10-05 08:43:39','Middle School','2012-10-05 08:43:39',12,'gh',84,87,NULL,10,30,90,50,14,35,85,95,72,97,4,4,3,1991),(105,0,'2012-10-05 08:43:39','High School','2012-10-05 08:43:39',12,'hf',25,45,NULL,68,97,25,82,74,65,75,64,85,96,4,4,3,1991),(106,0,'2012-10-05 08:43:39','Senior Secondary School','2012-10-05 08:43:39',12,'gj',896,644,NULL,874,852,259,855,258,741,145,988,952,855,4,4,3,1991),(107,0,'2012-10-06 03:32:53','Pre-Primary School','2012-10-06 03:32:53',4,'p p ',5,8,NULL,8,8,8,8,5,8,8,8,5,8,4,4,1,1999),(108,1,'2012-10-09 01:45:02','Pre-Primary School','2012-10-09 01:45:02',1,'assam',50,50,NULL,28,26,3,3,298,187,5,5,298,187,1,1,31,2012),(109,1,'2012-10-09 01:46:11','Primary School','2012-10-09 01:46:11',1,'abc',45,44,NULL,35,58,8,8,299,254,5,5,300,254,1,1,31,2012),(110,1,'2012-10-09 01:48:04','Middle School','2012-10-09 01:48:04',1,'assam',2,5,NULL,45,55,1,1,354,266,1,1,354,266,1,1,31,2012),(111,1,'2012-10-09 01:50:35','High School','2012-10-09 01:50:35',1,'assam',55,50,10,85,99,4,6,200,125,10,11,200,125,1,1,31,2012),(112,1,'2012-10-09 01:52:22','Senior Secondary School','2012-10-09 01:52:22',1,'assam',87,55,NULL,88,85,5,4,298,299,15,10,298,299,1,1,31,2012),(113,1,'2012-10-09 02:35:56','Pre-Primary School','2012-10-09 02:35:56',1,'assam',5,25,NULL,85,85,1,1,154,111,6,6,125,222,1,1,39,2012),(114,1,'2012-10-09 02:36:48','Primary School','2012-10-09 02:36:48',1,'assam',55,5,NULL,55,98,35,6,125,145,6,4,125,222,1,1,39,2012),(115,1,'2012-10-09 02:37:26','Middle School','2012-10-09 02:37:26',1,'assam',55,55,NULL,55,99,2,2,254,111,5,10,125,154,1,1,39,2012),(116,1,'2012-10-09 02:38:27','High School','2012-10-09 02:38:27',1,'assam',55,55,4,55,89,6,4,254,145,5,6,254,222,1,1,39,2012),(117,1,'2012-10-09 02:39:05','Senior Secondary School','2012-10-09 02:39:05',1,'assam',5,5,NULL,55,98,2,6,254,154,6,1,254,154,1,1,39,2012),(118,1,'2012-10-09 03:01:31','Pre-Primary School','2012-10-09 03:01:31',1,'assam',25,25,NULL,89,98,35,6,254,154,5,6,254,154,1,1,40,2012),(119,1,'2012-10-09 03:01:59','Primary School','2012-10-09 03:01:59',1,'assam',55,55,NULL,55,85,1,1,154,154,6,6,125,222,1,1,40,2012),(120,1,'2012-10-09 03:05:07','Middle School','2012-10-09 03:05:07',1,'assam',25,25,NULL,89,98,2,2,254,145,5,4,254,154,1,1,40,2012),(121,1,'2012-10-09 03:05:38','High School','2012-10-09 03:05:38',1,'assam',55,25,8,89,88,2,6,254,145,5,10,254,154,1,1,40,2012),(122,1,'2012-10-09 03:08:28','Senior Secondary School','2012-10-09 03:08:28',1,'assam',25,25,NULL,89,85,4,4,125,154,10,1,125,222,1,1,40,2012),(123,1,'2012-10-09 06:33:10','Pre-Primary School','2012-10-09 06:33:10',1,'assam',55,25,NULL,89,98,5,6,125,154,6,4,125,222,1,1,41,2012),(124,1,'2012-10-09 06:34:09','Primary School','2012-10-09 06:34:09',1,'assam',35,25,NULL,55,89,1,1,254,145,6,5,254,154,1,1,41,2012),(125,1,'2012-10-09 06:34:47','Middle School','2012-10-09 06:34:47',1,'assam',5,25,NULL,88,88,1,2,125,144,5,6,125,154,1,1,41,2012),(126,1,'2012-10-09 06:36:05','High School','2012-10-09 06:36:05',1,'assam',55,25,4,89,98,1,5,125,154,10,25,125,222,1,1,41,2012),(127,1,'2012-10-09 06:36:41','Senior Secondary School','2012-10-09 06:36:41',1,'assam',55,25,NULL,55,89,1,1,125,222,6,4,254,222,1,1,41,2012);
/*!40000 ALTER TABLE `no_of_enrolment_in_edu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_of_enrolment_in_other_tech_course`
--

DROP TABLE IF EXISTS `no_of_enrolment_in_other_tech_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_of_enrolment_in_other_tech_course` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `month` int(11) NOT NULL,
  `name` varchar(255) default NULL,
  `no_of_student_enrolled_in_agri_msc_boys` int(11) default NULL,
  `no_of_student_enrolled_in_agri_msc_girls` int(11) default NULL,
  `no_of_student_enrolled_in_be_btech_boys` int(11) default NULL,
  `no_of_student_enrolled_in_be_btech_girls` int(11) default NULL,
  `no_of_student_enrolled_in_bvsc_boys` int(11) default NULL,
  `no_of_student_enrolled_in_bvsc_girls` int(11) default NULL,
  `no_of_student_enrolled_initiboys` int(11) default NULL,
  `no_of_student_enrolled_initigirls` int(11) default NULL,
  `no_of_student_enrolled_in_mbbs_boys` int(11) default NULL,
  `no_of_student_enrolled_in_mbbs_girls` int(11) default NULL,
  `no_of_student_enrolled_in_polytech_deploma_boys` int(11) default NULL,
  `no_of_student_enrolled_in_polytech_deploma_girls` int(11) default NULL,
  `no_of_student_enrolled_in_vocational_course_boys` int(11) default NULL,
  `no_of_student_enrolled_in_vocational_course_girls` int(11) default NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  `village_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FKCFEEDD803746EB9E` (`village_id`),
  KEY `FKCFEEDD8064847CFA` (`user_updated_id`),
  KEY `FKCFEEDD80C7C493AD` (`user_created_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_of_enrolment_in_other_tech_course`
--

LOCK TABLES `no_of_enrolment_in_other_tech_course` WRITE;
/*!40000 ALTER TABLE `no_of_enrolment_in_other_tech_course` DISABLE KEYS */;
INSERT INTO `no_of_enrolment_in_other_tech_course` VALUES (1,0,'2012-10-04 04:06:01','2012-10-04 04:06:01',1,'QW',254,230,700,650,88,66,98,25,500,422,410,444,34,22,1,1,12,2012),(2,0,'2012-10-04 04:23:52','2012-10-04 04:23:52',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(3,0,'2012-10-04 04:25:21','2012-10-04 04:25:21',1,'25',58,55,620,254,25,24,25,25,546,200,145,120,23,23,1,1,18,2012),(4,0,'2012-10-04 04:41:04','2012-10-04 04:41:04',1,'25',145,100,254,300,26,14,354,254,354,268,25,28,55,45,1,1,14,2012),(5,0,'2012-10-04 04:57:32','2012-10-04 04:57:32',1,'25',58,95,289,322,65,44,25,25,210,145,54,45,35,26,1,1,7,2012),(6,0,'2012-10-04 05:10:07','2012-10-04 05:10:07',1,'assam',69,89,300,250,288,154,99,89,210,120,124,145,99,89,1,1,6,2012),(7,0,'2012-10-04 05:26:33','2012-10-04 05:26:33',1,'25',89,99,154,120,111,52,99,98,154,120,54,56,65,66,1,1,8,2012),(8,0,'2012-10-04 05:35:47','2012-10-04 05:35:47',1,'25',25,25,154,144,35,35,44,45,25,26,58,58,65,55,1,1,10,2012),(9,0,'2012-10-04 05:45:10','2012-10-04 05:45:10',1,'25',55,55,154,111,25,25,55,55,154,111,26,26,45,45,2,2,28,2012),(10,1,'2012-10-04 05:55:01','2012-10-04 05:55:09',1,'25',35,25,125,111,25,25,8,8,125,111,45,45,55,55,2,2,29,2012),(11,0,'2012-10-04 06:05:14','2012-10-04 06:05:14',1,'25',88,98,125,111,25,26,66,65,125,111,58,56,25,24,2,2,30,2012),(12,0,'2012-10-04 06:07:48','2012-10-04 06:07:48',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(13,0,'2012-10-04 06:20:08','2012-10-04 06:20:08',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(14,0,'2012-10-04 08:26:30','2012-10-04 08:26:30',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(15,0,'2012-10-04 08:36:58','2012-10-04 08:36:58',1,'Diploma college',189,100,123,111,222,198,321,213,231,171,199,87,12,56,2,2,38,2012),(16,0,'2012-10-05 02:17:36','2012-10-05 02:17:36',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,2012),(17,0,'2012-10-05 02:26:20','2012-10-05 02:26:20',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(18,0,'2012-10-05 05:36:21','2012-10-05 05:36:21',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1990),(19,0,'2012-10-05 06:31:15','2012-10-05 06:31:15',9,'fg',58,75,53,87,76,98,82,77,28,28,28,37,90,88,4,4,1,1990),(20,0,'2012-10-05 07:41:43','2012-10-05 07:41:43',12,'fh',69,52,96,54,82,35,46,50,93,75,84,73,43,90,4,4,29,1990),(21,0,'2012-10-05 08:24:06','2012-10-05 08:24:06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,2,1990),(22,0,'2012-10-05 08:43:39','2012-10-05 08:43:39',12,'nd',98,58,96,85,25,36,95,75,74,14,72,35,45,65,4,4,3,1991),(23,0,'2012-10-06 03:32:53','2012-10-06 03:32:53',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,1,1999),(24,0,'2012-10-09 02:01:49','2012-10-09 02:01:49',1,'assam',154,95,179,254,254,200,25,34,189,147,122,145,144,25,1,1,31,2012),(25,0,'2012-10-09 02:40:58','2012-10-09 02:40:58',1,'assam',145,100,154,144,111,14,354,254,154,120,54,120,65,24,1,1,39,2012),(26,0,'2012-10-09 03:00:38','2012-10-09 03:00:38',1,'assam',145,230,125,111,254,154,99,254,125,111,124,145,23,23,1,1,40,2012),(27,0,'2012-10-09 06:29:21','2012-10-09 06:29:21',1,'assam',154,155,354,369,254,265,354,254,344,360,88,99,23,55,1,1,41,2012);
/*!40000 ALTER TABLE `no_of_enrolment_in_other_tech_course` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,0,'ROLE_ADMIN'),(2,0,'ROLE_DATA_ENTRY_OPERATOR'),(3,0,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK68AC49164847CFA` (`user_updated_id`),
  KEY `FK68AC491C7C493AD` (`user_created_id`),
  CONSTRAINT `FK68AC49164847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK68AC491C7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,0,'AS','2012-09-26 17:41:04','assam','2012-09-26 17:41:04','Assam',1,1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
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
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `user_profile_id` bigint(20) default NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK36EBCB854AAB27` (`user_profile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'\0','\0','admin@damyant.com','','741695438818797a70f9866d0251b87b83f343920dc214ebc6b5f3bdfcb284f1','\0',2,'user_hq'),(2,0,'\0','\0','admin@damyant.com','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0',NULL,'user_deo'),(3,0,'\0','\0','admin@damyant.com','','5aed14c5499622980fd786ccaf94bed09c9d631aea5c4821c632eaa1947e7acc','\0',NULL,'user'),(4,0,'\0','\0','akumar@damyant.com','','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','\0',NULL,'test'),(5,3,'\0','\0','akumar@damyant.com','','b4e40f5431a9415b5fec8af80a0ac44559b44f2d859aa6eebde7b42c03178681','\0',1,'director'),(6,0,'\0','\0','akumar@damyant.com','','0d8b5e8662f8417bd51540c0c94debe2309d1d39e1cabc8772b4c3418b9d59c9','\0',NULL,'secretary_general'),(7,0,'\0','\0','akumar@damyant.com','','0d8b5e8662f8417bd51540c0c94debe2309d1d39e1cabc8772b4c3418b9d59c9','\0',NULL,'principal_secretary');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `address` longtext,
  `city` varchar(64) default NULL,
  `country` varchar(64) default NULL,
  `first_name` varchar(64) default NULL,
  `home_phone` varchar(10) default NULL,
  `last_name` varchar(64) default NULL,
  `last_updated` datetime NOT NULL,
  `middle_name` varchar(64) default NULL,
  `mobile_phone` varchar(10) default NULL,
  `postal_code` varchar(40) default NULL,
  `profile_name` varchar(64) default NULL,
  `state` varchar(64) default NULL,
  `street` varchar(64) default NULL,
  `work_phone` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-09 13:07:47',NULL,NULL,NULL,'director',NULL,NULL,NULL),(2,0,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-10 01:00:22',NULL,NULL,NULL,'user_hq',NULL,NULL,NULL);
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
  PRIMARY KEY  (`role_id`,`user_id`),
  KEY `FK143BF46A789C6716` (`role_id`),
  KEY `FK143BF46A1DC72AF6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(1,5),(1,6),(1,7),(2,2),(2,4),(3,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `village`
--

DROP TABLE IF EXISTS `village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `village` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `block_id` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `gram_panchayt` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_created_id` bigint(20) NOT NULL,
  `user_updated_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK1B70A4AC64847CFA` (`user_updated_id`),
  KEY `FK1B70A4ACC7C493AD` (`user_created_id`),
  KEY `FK1B70A4AC824FDCFE` (`block_id`),
  CONSTRAINT `FK1B70A4AC64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1B70A4AC824FDCFE` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`),
  CONSTRAINT `FK1B70A4ACC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `village`
--

LOCK TABLES `village` WRITE;
/*!40000 ALTER TABLE `village` DISABLE KEYS */;
INSERT INTO `village` VALUES (1,0,1,'ASBABAPG','2012-09-26 17:44:07','pora gaon','GM Pora Gaon','2012-09-26 17:44:07','Pora Gaon',1,1),(2,0,1,'ASBABAKM','2012-09-26 17:44:49','kaimar','GM Kaimar','2012-09-26 17:44:49','Kaimar',1,1),(3,0,1,'ASBABAKB','2012-09-26 17:46:17','khaira bari','GM Khaira bari','2012-09-26 17:46:17','Khaira Bari',1,1),(4,0,1,'ASBABAKV','2012-09-26 17:46:51','kala bhanga','GM Kala Bhanga','2012-09-26 17:46:51','Kala Bhanga',1,1),(5,0,1,'ASBABATG','2012-09-26 17:47:34','Tenga Gaon','GM Tenga Gaon','2012-09-26 17:47:34','Tenga Gaon',1,1),(6,0,1,'ASBABABA','2012-09-26 17:47:59','Bhera','GM Bhera','2012-09-26 17:47:59','Bhera',1,1),(7,0,1,'ASBABABL','2012-09-26 17:48:25','Balapathar','GM Balapathar','2012-09-26 17:48:25','Balapathar',1,1),(8,0,1,'ASBABACG','2012-09-26 17:49:22','Chandmama Gaon','GM Chandmama Gaon','2012-09-26 17:49:22','Chandmama Gaon',1,1),(9,0,1,'ASBABAGP','2012-09-26 17:49:48','Gopalpur','GM Gopalpur','2012-09-26 17:49:48','Gopalpur',1,1),(10,0,1,'ASBABACT','2012-09-26 17:50:13','Citali','GM Citali','2012-09-26 17:50:13','Citali',1,1),(11,0,1,'ASBABAJG','2012-09-26 17:50:41','Jahanar Gaon','GM Jahanar Gaon','2012-09-26 17:50:41','Jahanar Gaon',1,1),(12,0,2,'ASBABLBM','2012-09-26 17:54:46','Baghmara','GM Baghmara','2012-09-26 17:54:46','Baghmara',1,1),(13,0,2,'ASBABLBK','2012-09-26 17:55:20','Bamunkuchi','GM Bamunkuchi','2012-09-26 17:55:20','Bamunkuchi',1,1),(14,0,2,'ASBABLBS','2012-09-26 17:55:48','Bandha Sidhani','GM Bandha Sidhani','2012-09-26 17:55:48','Bandha Sidhani',1,1),(15,0,2,'ASBABLDU','2012-09-26 17:56:19','Dubi ','GM Dubi ','2012-09-26 17:56:19','Dubi ',1,1),(16,0,2,'ASBABLDM','2012-09-26 17:56:47','Dumuria','GM Dumuria','2012-09-26 17:56:47','Dumuria',1,1),(17,0,2,'ASBABLMG','2012-09-26 17:57:18','Maguria','GM Maguria','2012-09-26 17:57:18','Maguria',1,1),(18,0,2,'ASBABLBL','2012-09-26 17:57:45','Bajali','GM Bajali','2012-09-26 17:57:45','Bajali',1,1),(19,0,2,'ASBABLSM','2012-09-26 17:58:34','Sathisamuka Majarkhat','GM Sathisamuka Majarkhat','2012-09-26 17:58:34','Sathisamuka Majarkhat',1,1),(20,0,2,'ASBABLBG','2012-09-26 17:59:05','Barbang','GM Barbang','2012-09-26 17:59:05','Barbang',1,1),(21,0,2,'ASBABLBB','2012-09-26 17:59:32','Barbhaluki Balipara','GM Barbhaluki Balipara','2012-09-26 17:59:32','Barbhaluki Balipara',1,1),(22,0,2,'ASBABLMP','2012-09-26 17:59:58','Manikpur','GM Manikpur','2012-09-26 17:59:58','Manikpur',1,1),(23,0,2,'ASBABLMA','2012-09-26 18:00:23','Maripur Anandapur','GM Maripur Anandapur','2012-09-26 18:00:23','Maripur Anandapur',1,1),(24,0,2,'ASBABLNP','2012-09-26 18:00:47','Nityananda Panbari','GM Nityananda Panbari','2012-09-26 18:00:47','Nityananda Panbari',1,1),(25,0,2,'ASBABLPK','2012-09-26 18:01:16','Patacharkuchi','GM Patacharkuchi','2012-09-26 18:01:16','Patacharkuchi',1,1),(26,0,2,'ASBABLSR','2012-09-26 18:01:42','Saderi','GM Saderi','2012-09-26 18:01:42','Saderi',1,1),(27,0,2,'ASBABLSM','2012-09-26 18:02:08','Sathisamuka Majarkhat','GM Sathisamuka Majarkhat','2012-09-26 18:02:08','Sathisamuka Majarkhat',1,1),(28,0,3,'ASBOBMMP','2012-09-26 18:05:09','Balapara','GM Balapara','2012-09-26 18:05:09','Balapara',1,1),(29,0,3,'ASBOBMBM','2012-09-26 18:05:33','Boitamari','GM Boitamari','2012-09-26 18:05:33','Boitamari',1,1),(30,0,3,'ASBOBMCT','2012-09-26 18:07:11','Chalantapara','GM Chalantapara','2012-09-26 18:07:11','Chalantapara',1,1),(31,0,3,'ASBOBMDT','2012-09-26 18:07:35','Dhantola','GM Dhantola','2012-09-26 18:07:35','Dhantola',1,1),(32,0,3,'ASBOBMGG','2012-09-26 18:08:00','Ghilaguri','GM Ghilaguri','2012-09-26 18:08:00','Ghilaguri',1,1),(33,0,3,'ASBOBMJG','2012-09-26 18:08:24','Jogighopa','GM Jogighopa','2012-09-26 18:08:24','Jogighopa',1,1),(34,0,3,'ASBOBMKT','2012-09-26 18:08:55','Kabaitari','GM Kabaitari','2012-09-26 18:08:55','Kabaitari',1,1),(35,0,3,'ASBOBMKP','2012-09-26 18:09:19','Khagarpur','GM Khagarpur','2012-09-26 18:09:19','Khagarpur',1,1),(36,0,3,'ASBOBMOD','2012-09-26 18:09:47','Oudubi','GM Oudubi','2012-09-26 18:09:47','Oudubi',1,1),(37,0,3,'ASBOBMPM','2012-09-26 18:10:12','Pachim Majeralga','GM Pachim Majeralga','2012-09-26 18:10:12','Pachim Majeralga',1,1),(38,0,4,'ASBODGAG','2012-09-26 18:12:18','Atugaon','GM Atugaon','2012-09-26 18:12:18','Atugaon',1,1),(39,0,4,'ASBODGBT','2012-09-26 18:12:43','Bamunitila','GM Bamunitila','2012-09-26 18:12:43','Bamunitila',1,1),(40,0,4,'ASBODGBP','2012-09-27 10:09:32','Bidyapur','GM Bidyapur','2012-09-27 10:09:32','Bidyapur',1,1),(41,0,4,'ASBODGBG','2012-09-27 10:10:34','Bongaigaon','GM Bongaigaon','2012-09-27 10:10:34','Bongaigaon',1,1),(42,0,4,'ASBODGCK','2012-09-27 10:10:58','Chaprakata','GM Chaprakata','2012-09-27 10:10:58','Chaprakata',1,1),(43,0,4,'ASBODGCB','2012-09-27 10:11:28','Chikibiki','GM Chikibiki','2012-09-27 10:11:28','Chikibiki',1,1),(44,0,4,'ASBODGCC','2012-09-27 10:12:01','Chiponchila','GM Chiponchila','2012-09-27 10:12:01','Chiponchila',1,1),(45,0,4,'ASBODGCP','2012-09-27 10:12:29','Chokapara','GM Chokapara','2012-09-27 10:12:29','Chokapara',1,1),(46,0,4,'ASBODGDT','2012-09-27 10:12:56','Dangtol','GM Dangtol','2012-09-27 10:12:56','Dangtol',1,1),(47,0,4,'ASBODGDG','2012-09-27 10:13:23','Dhaligaon','GM Dhaligaon','2012-09-27 10:13:23','Dhaligaon',1,1);
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

-- Dump completed on 2012-10-10  1:17:07
