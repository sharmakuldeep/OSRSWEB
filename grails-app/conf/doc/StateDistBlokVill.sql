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
  CONSTRAINT `FK597C48DC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK597C48D64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK597C48DCBA08216` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `block`
--

/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` (`id`,`version`,`code`,`date_created`,`description`,`district_id`,`last_updated`,`name`,`user_created_id`,`user_updated_id`) VALUES 
 (1,0,'BN','2012-06-29 12:40:19','',1,'2012-06-29 12:40:19','BAGANPARA',1,1),
 (2,0,'BI','2012-06-29 12:55:36','',1,'2012-06-29 12:55:36','BAJALI',1,1),
 (3,0,'BR','2012-06-29 13:01:51','',2,'2012-06-29 13:01:51','BAGHBOR',1,1),
 (4,0,'BG','2012-06-29 13:02:59','',2,'2012-06-29 13:02:59','BARNAGAR',1,1),
 (6,0,'BJ','2012-06-29 14:12:03','',3,'2012-06-29 14:12:03','BIJNI',1,1),
 (7,0,'BN','2012-06-29 14:15:34','',3,'2012-06-29 14:15:34','BONGAIGAON',1,1),
 (8,0,'LK','2012-06-29 14:21:15','',4,'2012-06-29 14:21:15','LAKHIPUR',1,1),
 (9,0,'SC','2012-06-29 14:26:04','',4,'2012-06-29 14:26:04','SILCHAR',1,1),
 (10,0,'AMGURI','2012-06-30 12:44:57','Amguri',22,'2012-06-30 12:44:57','Amguri',1,1),
 (11,0,'GAURISAGAR','2012-06-30 12:45:46','Gaurisagar',22,'2012-06-30 12:45:46','Gaurisagar',1,1),
 (12,0,'SIBSAGAR','2012-06-30 12:47:01','Sibsagar(khelua)',22,'2012-06-30 12:47:01','Sibsagar(khelua)',1,1);
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
  CONSTRAINT `FK1139338EC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1139338E64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1139338EF971AE7E` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` (`id`,`version`,`code`,`date_created`,`description`,`last_updated`,`name`,`state_id`,`user_created_id`,`user_updated_id`) VALUES 
 (1,0,'BK','2012-06-29 11:52:51','BAKSA','2012-06-29 11:52:51','BAKSA',1,1,1),
 (2,0,'BA','2012-06-29 11:53:28','','2012-06-29 11:53:28','BARPETA',1,1,1),
 (3,0,'BO','2012-06-29 11:54:16','','2012-06-29 11:54:16','BONGAIGAON',1,1,1),
 (4,0,'CA','2012-06-29 11:56:27','','2012-06-29 11:56:27','CACHAR',1,1,1),
 (5,0,'DA','2012-06-29 11:56:53','','2012-06-29 11:56:53','DARRANG',1,1,1),
 (6,0,'DM','2012-06-29 11:57:20','','2012-06-29 11:57:20','DHEMAJI',1,1,1),
 (7,0,'DB','2012-06-29 11:57:44','','2012-06-29 11:57:44','DHUBRI',1,1,1),
 (8,0,'DI','2012-06-29 11:59:14','','2012-06-29 11:59:14','DIBRUGARH',1,1,1),
 (9,0,'GP','2012-06-29 12:00:21','','2012-06-29 12:00:21','GOALPARA',1,1,1),
 (10,0,'GG','2012-06-29 12:01:09','','2012-06-29 12:01:09','GOLAGHAT',1,1,1),
 (11,0,'HA','2012-06-29 12:01:43','','2012-06-29 12:01:43','HAILAKANDI',1,1,1),
 (12,0,'JO','2012-06-29 12:02:03','','2012-06-29 12:02:03','JORHAT',1,1,1),
 (13,0,'KR','2012-06-29 12:04:06','','2012-06-29 12:04:06','KARIMGANJ',1,1,1),
 (14,0,'KA','2012-06-29 12:05:16','','2012-06-29 12:05:16','KARBI ANGLONG',1,1,1),
 (15,0,'KK','2012-06-29 12:05:30','','2012-06-29 12:05:30','KOKRAJHAR',1,1,1),
 (16,0,'LA','2012-06-29 12:05:45','','2012-06-29 12:05:45','LAKHIMPUR',1,1,1),
 (17,0,'MA','2012-06-29 12:06:08','','2012-06-29 12:06:08','MARIGAON',1,1,1),
 (18,0,'NG','2012-06-29 12:06:22','','2012-06-29 12:06:22','NAGAON',1,1,1),
 (19,0,'NL','2012-06-29 12:06:44','','2012-06-29 12:06:44','NALBARI',1,1,1),
 (20,1,'KT','2012-06-29 12:12:10','','2012-06-29 12:16:50','KAMRUP METROPOLITAN',1,1,1),
 (21,1,'NH','2012-06-29 12:12:40','','2012-06-29 12:13:24','NORTH CACHAR HILLS',1,1,1),
 (22,0,'SI','2012-06-29 12:13:56','','2012-06-29 12:13:56','SIVASAGAR',1,1,1),
 (23,0,'SO','2012-06-29 12:14:41','','2012-06-29 12:14:41','SONITPUR',1,1,1),
 (24,0,'TI','2012-06-29 12:15:14','','2012-06-29 12:15:14','TINSUKIA',1,1,1),
 (25,0,'UG','2012-06-29 12:15:58','','2012-06-29 12:15:58','UDALGURI',1,1,1),
 (26,0,'KM','2012-06-29 12:16:58','','2012-06-29 12:16:58','KAMRUP',1,1,1);
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
  CONSTRAINT `FK68AC491C7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK68AC49164847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` (`id`,`version`,`code`,`date_created`,`description`,`last_updated`,`name`,`user_created_id`,`user_updated_id`) VALUES 
 (1,0,'ASM','2012-06-29 11:49:37','ASSAM','2012-06-29 11:49:37','ASSAM',1,1);
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
  CONSTRAINT `FK1B70A4AC824FDCFE` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`),
  CONSTRAINT `FK1B70A4AC64847CFA` FOREIGN KEY (`user_updated_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1B70A4ACC7C493AD` FOREIGN KEY (`user_created_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `village`
--

/*!40000 ALTER TABLE `village` DISABLE KEYS */;
INSERT INTO `village` (`id`,`version`,`block_id`,`code`,`date_created`,`description`,`gram_panchayt`,`last_updated`,`name`,`user_created_id`,`user_updated_id`) VALUES 
 (1,0,1,'AN','2012-06-29 12:41:13','','GM BAKSA','2012-06-29 12:41:13','AMINGAON',1,1),
 (2,0,1,'GA','2012-06-29 12:42:19','','GM BAKSA','2012-06-29 12:42:19','GERUA',1,1),
 (3,0,1,'HR','2012-06-29 12:43:11','','GM BAKSA','2012-06-29 12:43:11','HOLAPUR',1,1),
 (4,0,1,'MR','2012-06-29 12:43:42','','GM BAKSA','2012-06-29 12:43:42','MONIPUR',1,1),
 (5,0,1,'OA','2012-06-29 12:44:08','','GM BAKSA','2012-06-29 12:44:08','ODALA',1,1),
 (6,1,2,'BP','2012-06-29 12:56:22','','GM BAJALI','2012-06-29 12:57:27','BEBEJIAPARA ',1,1),
 (7,0,2,'MT','2012-06-29 12:57:13','','GM BAJALI','2012-06-29 12:57:13','MAJARKHAT',1,1),
 (8,0,4,'GL','2012-06-29 13:05:01','','GM BARNAGAR','2012-06-29 13:05:01','GELLA PARA',1,1),
 (9,1,4,'HL','2012-06-29 13:06:05','','GM BARNAGAR','2012-06-29 13:32:43','HALA PAKURI',1,1),
 (10,0,4,'HG','2012-06-29 13:18:04','','GM BARNAGAR','2012-06-29 13:18:04','HOWLI GAON',1,1),
 (11,1,4,'JI','2012-06-29 13:18:39','','GM BARNAGAR','2012-06-29 13:30:47','JAISIHATI',1,1),
 (12,1,4,'GC','2012-06-29 13:19:57','','GM BARNAGAR','2012-06-29 13:31:07','GUAGACHA',1,1),
 (13,1,4,'KB','2012-06-29 13:20:20','','GM BARNAGAR','2012-06-29 13:31:20','KALBARI',1,1),
 (14,2,3,'KE','2012-06-29 13:21:10','','GM BARNAGAR','2012-06-29 14:08:34','KETEKI BARI',1,1),
 (15,0,3,'MM','2012-06-29 13:43:54','','GM BAGHBOR','2012-06-29 13:43:54','MAHAMMADPUR',1,1),
 (16,0,3,'KA','2012-06-29 13:44:50','','GM BAGHBOR','2012-06-29 13:44:50','KARERTAL',1,1),
 (17,0,3,'MG','2012-06-29 13:45:40','','GM BAGHBOR','2012-06-29 13:45:40','MANDIA GAON',1,1),
 (18,1,3,'LR','2012-06-29 13:46:25','','GM BAGHBOR','2012-06-29 13:46:31','LURFURIA',1,1),
 (19,0,3,'KH','2012-06-29 13:47:57','','GM BAGHBOR','2012-06-29 13:47:57','KHARKI',1,1),
 (20,0,6,'AD','2012-06-29 14:12:45','','GM BIJNI','2012-06-29 14:12:45','ABADI',1,1),
 (21,1,6,'BL','2012-06-29 14:13:07','','GM BIJNI','2012-06-29 14:13:19','BORBILLA',1,1),
 (22,0,6,'DP','2012-06-29 14:13:42','','GM BIJNI','2012-06-29 14:13:42','DOMPARA',1,1),
 (23,0,6,'HC','2012-06-29 14:14:09','','GM BIJNI','2012-06-29 14:14:09','HAPACHORA',1,1),
 (24,1,6,'JW','2012-06-29 14:14:25','','GM BIJNI','2012-06-29 14:14:33','JHAWBARI',1,1),
 (25,0,7,'KI','2012-06-29 14:15:56','','GM BONGAIGAON','2012-06-29 14:15:56','KATHALGURI',1,1),
 (26,0,7,'KD','2012-06-29 14:16:38','','GM BONGAIGAON','2012-06-29 14:16:38','KASHIDOBA',1,1),
 (27,0,7,'KAR','2012-06-29 14:17:41','','GM BONGAIGAON','2012-06-29 14:17:41','KHARBOJHA',1,1),
 (28,0,7,'MG','2012-06-29 14:18:17','','GM BONGAIGAON','2012-06-29 14:18:17','MULAGAON',1,1),
 (29,0,7,'KO','2012-06-29 14:19:49','','GM BONGAIGAON','2012-06-29 14:19:49','KOREBARI',1,1),
 (30,1,8,'PP','2012-06-29 14:21:47','','GM LAKHIPUR','2012-06-29 14:21:59','PAHELPUR',1,1),
 (31,0,8,'PD','2012-06-29 14:22:33','','GM LAKHIPUR','2012-06-29 14:22:33','PASCHIM DIPU',1,1),
 (32,0,8,'RA','2012-06-29 14:22:59','','GM LAKHIPUR','2012-06-29 14:22:59','RATANPUR',1,1),
 (33,0,8,'RP','2012-06-29 14:23:29','','GM LAKHIPUR','2012-06-29 14:23:29','REMA PUNJI',1,1),
 (34,0,8,'SP','2012-06-29 14:23:49','','GM LAKHIPUR','2012-06-29 14:23:49','SANTIPUR',1,1),
 (35,0,9,'CS','2012-06-29 14:26:31','','GM SILCHAR','2012-06-29 14:26:31','CHESRI',1,1),
 (36,0,9,'CJ','2012-06-29 14:27:17','','GM SILCHAR','2012-06-29 14:27:17','CHOTA JALENGA GRANT',1,1),
 (37,0,9,'CB','2012-06-29 14:28:04','','GM SILCHAR','2012-06-29 14:28:04','CHIBITABICHIA PT VI',1,1),
 (38,1,9,'CB7','2012-06-29 14:28:41','','GM SILCHAR','2012-06-29 14:30:49','CHIBITABICHIA PT VII',1,1),
 (39,0,1,'CB8','2012-06-29 14:29:17','','GM SILCHAR','2012-06-29 14:29:17','CHIBITABICHIA PT VIII',1,1),
 (40,0,9,'CB10','2012-06-29 14:29:52','','GM SILCHAR','2012-06-29 14:29:52','CHIBITABICHIA PT X',1,1),
 (41,0,9,'CB11','2012-06-29 14:30:15','','GM SILCHAR','2012-06-29 14:30:15','CHIBITABICHIA PT XI',1,1),
 (42,1,10,'Amguri','2012-06-30 13:28:44','Amguri village','Amguri GP','2012-07-04 17:00:38','AmguriVillage',1,1),
 (46,1,12,'Sibsagar','2012-06-30 13:35:38','Sibsagar(khelua) village','Sibsagar(khelua)','2012-07-04 16:58:41','SibsagarVillage',1,1),
 (48,0,11,'GaurisagarV','2012-07-04 17:01:28','Gaurisagar villlage','Gaurisagar GP','2012-07-04 17:01:28','GaurisagarVillage',1,1);
/*!40000 ALTER TABLE `village` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;