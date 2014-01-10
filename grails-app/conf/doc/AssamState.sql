-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;



--
-- Definition of table `block`
--

DROP TABLE IF EXISTS `block`;
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

--
-- Dumping data for table `block`
--

/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` (`id`,`version`,`code`,`date_created`,`description`,`district_id`,`last_updated`,`name`,`user_created_id`,`user_updated_id`) VALUES 
 (1,0,'ASBABA','2012-09-26 17:43:23','barpeta block',1,'2012-09-26 17:43:23','Barpeta',1,1),
 (2,0,'ASBABL','2012-09-26 17:53:58','Bajali',1,'2012-09-26 17:53:58','Bajali',1,1),
 (3,0,'ASBOBM','2012-09-26 18:04:06','Boitamari',2,'2012-09-26 18:04:06','Boitamari',1,1),
 (4,0,'ASBODG','2012-09-26 18:11:44','Dangtol',2,'2012-09-26 18:11:44','Dangtol',1,1);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;



--
-- Definition of table `district`
--

DROP TABLE IF EXISTS `district`;
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

--
-- Dumping data for table `district`
--

/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` (`id`,`version`,`code`,`date_created`,`description`,`last_updated`,`name`,`state_id`,`user_created_id`,`user_updated_id`) VALUES 
 (1,0,'ASBA','2012-09-26 17:42:28','barpeta district','2012-09-26 17:42:28','Barpeta',1,1,1),
 (2,0,'ASBO','2012-09-26 18:03:39','Bongaigaon','2012-09-26 18:03:39','Bongaigaon',1,1,1);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;


--
-- Definition of table `state`
--

DROP TABLE IF EXISTS `state`;
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

--
-- Dumping data for table `state`
--

/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` (`id`,`version`,`code`,`date_created`,`description`,`last_updated`,`name`,`user_created_id`,`user_updated_id`) VALUES 
 (1,0,'AS','2012-09-26 17:41:04','assam','2012-09-26 17:41:04','Assam',1,1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;


--
-- Definition of table `village`
--

DROP TABLE IF EXISTS `village`;
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

--
-- Dumping data for table `village`
--

/*!40000 ALTER TABLE `village` DISABLE KEYS */;
INSERT INTO `village` (`id`,`version`,`block_id`,`code`,`date_created`,`description`,`gram_panchayt`,`last_updated`,`name`,`user_created_id`,`user_updated_id`) VALUES
 (1,0,1,'ASBABAPG','2012-09-26 17:44:07','pora gaon','GM Pora Gaon','2012-09-26 17:44:07','Pora Gaon',1,1),
 (2,0,1,'ASBABAKM','2012-09-26 17:44:49','kaimar','GM Kaimar','2012-09-26 17:44:49','Kaimar',1,1),
 (3,0,1,'ASBABAKB','2012-09-26 17:46:17','khaira bari','GM Khaira bari','2012-09-26 17:46:17','Khaira Bari',1,1),
 (4,0,1,'ASBABAKV','2012-09-26 17:46:51','kala bhanga','GM Kala Bhanga','2012-09-26 17:46:51','Kala Bhanga',1,1),
 (5,0,1,'ASBABATG','2012-09-26 17:47:34','Tenga Gaon','GM Tenga Gaon','2012-09-26 17:47:34','Tenga Gaon',1,1),
 (6,0,1,'ASBABABA','2012-09-26 17:47:59','Bhera','GM Bhera','2012-09-26 17:47:59','Bhera',1,1),
 (7,0,1,'ASBABABL','2012-09-26 17:48:25','Balapathar','GM Balapathar','2012-09-26 17:48:25','Balapathar',1,1),
 (8,0,1,'ASBABACG','2012-09-26 17:49:22','Chandmama Gaon','GM Chandmama Gaon','2012-09-26 17:49:22','Chandmama Gaon',1,1),
 (9,0,1,'ASBABAGP','2012-09-26 17:49:48','Gopalpur','GM Gopalpur','2012-09-26 17:49:48','Gopalpur',1,1),
 (10,0,1,'ASBABACT','2012-09-26 17:50:13','Citali','GM Citali','2012-09-26 17:50:13','Citali',1,1),
 (11,0,1,'ASBABAJG','2012-09-26 17:50:41','Jahanar Gaon','GM Jahanar Gaon','2012-09-26 17:50:41','Jahanar Gaon',1,1),
 (12,0,2,'ASBABLBM','2012-09-26 17:54:46','Baghmara','GM Baghmara','2012-09-26 17:54:46','Baghmara',1,1),
 (13,0,2,'ASBABLBK','2012-09-26 17:55:20','Bamunkuchi','GM Bamunkuchi','2012-09-26 17:55:20','Bamunkuchi',1,1),
 (14,0,2,'ASBABLBS','2012-09-26 17:55:48','Bandha Sidhani','GM Bandha Sidhani','2012-09-26 17:55:48','Bandha Sidhani',1,1),
 (15,0,2,'ASBABLDU','2012-09-26 17:56:19','Dubi ','GM Dubi ','2012-09-26 17:56:19','Dubi ',1,1),
 (16,0,2,'ASBABLDM','2012-09-26 17:56:47','Dumuria','GM Dumuria','2012-09-26 17:56:47','Dumuria',1,1),
 (17,0,2,'ASBABLMG','2012-09-26 17:57:18','Maguria','GM Maguria','2012-09-26 17:57:18','Maguria',1,1),
 (18,0,2,'ASBABLBL','2012-09-26 17:57:45','Bajali','GM Bajali','2012-09-26 17:57:45','Bajali',1,1),
 (19,0,2,'ASBABLSM','2012-09-26 17:58:34','Sathisamuka Majarkhat','GM Sathisamuka Majarkhat','2012-09-26 17:58:34','Sathisamuka Majarkhat',1,1),
 (20,0,2,'ASBABLBG','2012-09-26 17:59:05','Barbang','GM Barbang','2012-09-26 17:59:05','Barbang',1,1),
 (21,0,2,'ASBABLBB','2012-09-26 17:59:32','Barbhaluki Balipara','GM Barbhaluki Balipara','2012-09-26 17:59:32','Barbhaluki Balipara',1,1),
 (22,0,2,'ASBABLMP','2012-09-26 17:59:58','Manikpur','GM Manikpur','2012-09-26 17:59:58','Manikpur',1,1),
 (23,0,2,'ASBABLMA','2012-09-26 18:00:23','Maripur Anandapur','GM Maripur Anandapur','2012-09-26 18:00:23','Maripur Anandapur',1,1),
 (24,0,2,'ASBABLNP','2012-09-26 18:00:47','Nityananda Panbari','GM Nityananda Panbari','2012-09-26 18:00:47','Nityananda Panbari',1,1),
 (25,0,2,'ASBABLPK','2012-09-26 18:01:16','Patacharkuchi','GM Patacharkuchi','2012-09-26 18:01:16','Patacharkuchi',1,1),
 (26,0,2,'ASBABLSR','2012-09-26 18:01:42','Saderi','GM Saderi','2012-09-26 18:01:42','Saderi',1,1),
 (27,0,2,'ASBABLSM','2012-09-26 18:02:08','Sathisamuka Majarkhat','GM Sathisamuka Majarkhat','2012-09-26 18:02:08','Sathisamuka Majarkhat',1,1),
 (28,0,3,'ASBOBMMP','2012-09-26 18:05:09','Balapara','GM Balapara','2012-09-26 18:05:09','Balapara',1,1),
 (29,0,3,'ASBOBMBM','2012-09-26 18:05:33','Boitamari','GM Boitamari','2012-09-26 18:05:33','Boitamari',1,1),
 (30,0,3,'ASBOBMCT','2012-09-26 18:07:11','Chalantapara','GM Chalantapara','2012-09-26 18:07:11','Chalantapara',1,1),
 (31,0,3,'ASBOBMDT','2012-09-26 18:07:35','Dhantola','GM Dhantola','2012-09-26 18:07:35','Dhantola',1,1),
 (32,0,3,'ASBOBMGG','2012-09-26 18:08:00','Ghilaguri','GM Ghilaguri','2012-09-26 18:08:00','Ghilaguri',1,1),
 (33,0,3,'ASBOBMJG','2012-09-26 18:08:24','Jogighopa','GM Jogighopa','2012-09-26 18:08:24','Jogighopa',1,1),
 (34,0,3,'ASBOBMKT','2012-09-26 18:08:55','Kabaitari','GM Kabaitari','2012-09-26 18:08:55','Kabaitari',1,1),
 (35,0,3,'ASBOBMKP','2012-09-26 18:09:19','Khagarpur','GM Khagarpur','2012-09-26 18:09:19','Khagarpur',1,1),
 (36,0,3,'ASBOBMOD','2012-09-26 18:09:47','Oudubi','GM Oudubi','2012-09-26 18:09:47','Oudubi',1,1),
 (37,0,3,'ASBOBMPM','2012-09-26 18:10:12','Pachim Majeralga','GM Pachim Majeralga','2012-09-26 18:10:12','Pachim Majeralga',1,1),
 (38,0,4,'ASBODGAG','2012-09-26 18:12:18','Atugaon','GM Atugaon','2012-09-26 18:12:18','Atugaon',1,1),
 (39,0,4,'ASBODGBT','2012-09-26 18:12:43','Bamunitila','GM Bamunitila','2012-09-26 18:12:43','Bamunitila',1,1),
 (40,0,4,'ASBODGBP','2012-09-27 10:09:32','Bidyapur','GM Bidyapur','2012-09-27 10:09:32','Bidyapur',1,1),
 (41,0,4,'ASBODGBG','2012-09-27 10:10:34','Bongaigaon','GM Bongaigaon','2012-09-27 10:10:34','Bongaigaon',1,1),
 (42,0,4,'ASBODGCK','2012-09-27 10:10:58','Chaprakata','GM Chaprakata','2012-09-27 10:10:58','Chaprakata',1,1),
 (43,0,4,'ASBODGCB','2012-09-27 10:11:28','Chikibiki','GM Chikibiki','2012-09-27 10:11:28','Chikibiki',1,1),
 (44,0,4,'ASBODGCC','2012-09-27 10:12:01','Chiponchila','GM Chiponchila','2012-09-27 10:12:01','Chiponchila',1,1),
 (45,0,4,'ASBODGCP','2012-09-27 10:12:29','Chokapara','GM Chokapara','2012-09-27 10:12:29','Chokapara',1,1),
 (46,0,4,'ASBODGDT','2012-09-27 10:12:56','Dangtol','GM Dangtol','2012-09-27 10:12:56','Dangtol',1,1),
 (47,0,4,'ASBODGDG','2012-09-27 10:13:23','Dhaligaon','GM Dhaligaon','2012-09-27 10:13:23','Dhaligaon',1,1);
/*!40000 ALTER TABLE `village` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;