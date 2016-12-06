# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.14-MariaDB)
# Database: iphone
# Generation Time: 2016-12-06 7:44:53 PM +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table plus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plus`;

CREATE TABLE `plus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `plus` WRITE;
/*!40000 ALTER TABLE `plus` DISABLE KEYS */;

INSERT INTO `plus` (`id`, `name`, `price`, `size`)
VALUES
	(247,'iPhone 5C 16GB Yellow No FaceTime',777.4,16),
	(248,'iPhone 5S 16GB Space Gray',839,16),
	(249,'iPhone 5S 16GB Silver',839,16),
	(250,'iPhone 5S 16GB Gold',839,16),
	(251,'iPhone SE 16GB Space Gray',1215,16),
	(252,'iPhone SE 16GB Silver',1215,16),
	(253,'iPhone SE 16GB Gold',1215,16),
	(254,'iPhone SE 16GB Rose Gold',1215,16),
	(255,'iPhone SE 64GB Space Gray',1363,64),
	(256,'iPhone SE 64GB Silver',1363,64),
	(257,'iPhone SE 64GB Gold',1363,64),
	(258,'iPhone 6S 16GB Space Gray',1599,16),
	(259,'iPhone 6S 16GB Silver',1599,16),
	(260,'iPhone 6S 16GB Gold ',1599,16),
	(261,'iPhone 6S 16GB Rose Gold',1599,16),
	(262,'iPhone 6S 64GB Space Gray',1883,64),
	(263,'iPhone 6S 64GB Silver',1883,64),
	(264,'iPhone 6S 64GB Gold',1883,64),
	(265,'iPhone 6S 64GB Rose Gold',1883,64),
	(266,'iPhone 6S 128GB Space Gray',2264,128),
	(267,'iPhone 6S 128GB Silver',2264,128),
	(268,'iPhone 6S 128GB Gold',2264,128),
	(269,'iPhone 6S 128GB Rose Gold',2264,128),
	(270,'iPhone 6S Plus 16GB Space Gray',1899,16),
	(271,'iPhone 6S Plus 16GB Silver',1899,16),
	(272,'iPhone 6S Plus 16GB Gold',1899,16),
	(273,'iPhone 6S Plus 16GB Rose Gold',1899,16),
	(274,'iPhone 6S Plus 64GB Space Gray',2276,64),
	(275,'iPhone 6S Plus 64GB Silver',2276,64),
	(276,'iPhone 6S Plus 64GB Gold',2276,64),
	(277,'iPhone 6S Plus 64GB Rose Gold',2276,64),
	(278,'iPhone 6S Plus 128GB Space Gray',2368,128),
	(279,'iPhone 6S Plus 128GB Silver',2368,128),
	(280,'iPhone 6S Plus 128GB Gold',2368,128),
	(281,'iPhone 6 16GB Space Gray',1363,16),
	(282,'iPhone 6 16GB Silver',1363,16),
	(283,'iPhone 6 16GB Gold',1433,16),
	(284,'iPhone 6 128GB Space Gray',1964,128),
	(285,'iPhone 6 128GB Silver',1964,128),
	(286,'iPhone 6 128GB Gold',1964,128),
	(287,'iPhone 6 Plus 16GB Space Gray',1941,16),
	(288,'iPhone 6 Plus 16GB Silver',1941,16),
	(289,'iPhone 6 Plus 16GB Gold',1941,16),
	(290,'iPhone 6 Plus 128GB Space Gray',2675.4,128),
	(291,'iPhone 6 Plus 128GB Silver',2379,128),
	(292,'iPhone 6 Plus 128GB Gold',2701.4,128),
	(293,'iPhone SE 64GB Rose Gold',1363,64),
	(294,'iPhone 6s Plus 128GB Rose Gold',2368,128),
	(295,'iPhone 7 32GB Black ',2039,32),
	(296,'iPhone 7 32GB Silver',2039,32),
	(297,'iPhone 7 32GB  Gold',2039,32),
	(298,'iPhone 7 32GB Rose Gold',2039,32),
	(299,'iPhone 7 128GB Black',2393,128),
	(300,'iPhone 7 128GB Silver',2393,128),
	(301,'iPhone 7 128GB Gold',2393,128),
	(302,'iPhone 7 128GB Rose Gold',2393,128),
	(303,'iPhone 7 256GB Black',2905,256),
	(304,'iPhone 7 128GB Jet Black',2444,128),
	(305,'iPhone 6s 32GB Space Gray',1665,32),
	(306,'iPhone 6s 32GB Silver',1665,32),
	(307,'iPhone 6s 32GB Gold',1665,32),
	(308,'iPhone 6s 32GB Rose Gold',1665,32),
	(309,'iPhone 7 256GB Rose Gold',2905,256),
	(310,'iPhone 7 Plus 32GB Black',2745,32),
	(311,'iPhone 7 Plus 32GB Silver',2745,32),
	(312,'iPhone 7 Plus 32GB Gold',2745,32),
	(313,'iPhone 7 Plus 32GB Rose Gold',2745,32),
	(314,'iPhone 7 Plus 128GB Black',3325,128),
	(315,'iPhone 7 Plus 128GB Silver',3325,128),
	(316,'iPhone 7 Plus 128GB Gold',3325,128),
	(317,'iPhone 7 Plus 128GB Rose Gold',3325,128),
	(318,'iPhone 7 Plus 128GB Jet Black',3459,128),
	(319,'iPhone 7 Plus 256GB Black',3486,256),
	(320,'iPhone 7 Plus 256GB Silver',3486,256),
	(321,'iPhone 7 Plus 256GB Gold',3486,256),
	(322,'iPhone 7 Plus 256GB Rose Gold',3486,256),
	(323,'iPhone 6S Plus 32GB Space Gray',1959,32),
	(324,'iPhone 6S Plus 32GB Silver',1959,32),
	(325,'iPhone 7 Plus 256GB Jet Black',4030,256),
	(326,'iPhone 7 256GB Jet Black',3224,256);

/*!40000 ALTER TABLE `plus` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
