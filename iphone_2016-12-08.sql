# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.14-MariaDB)
# Database: iphone
# Generation Time: 2016-12-08 17:40:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table colors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `colors`;

CREATE TABLE `colors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;

INSERT INTO `colors` (`id`, `title`)
VALUES
	(4,'Black'),
	(7,'Blue'),
	(2,'Gold'),
	(8,'Green'),
	(5,'Jet Black'),
	(9,'Pink'),
	(1,'Rose Gold'),
	(3,'Silver'),
	(6,'Space Gray'),
	(10,'White'),
	(11,'Yellow');

/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table market
# ------------------------------------------------------------

DROP TABLE IF EXISTS `market`;

CREATE TABLE `market` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;

INSERT INTO `market` (`id`, `title`)
VALUES
	(1,'iplus');

/*!40000 ALTER TABLE `market` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model`;

CREATE TABLE `model` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;

INSERT INTO `model` (`id`, `title`)
VALUES
	(1,'7'),
	(2,'7 Plus'),
	(3,'6s'),
	(4,'6s Plus'),
	(5,'SE'),
	(6,'6'),
	(7,'6 Plus'),
	(8,'5s'),
	(9,'5c'),
	(10,'4s');

/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plus`;

CREATE TABLE `plus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `colors_id` int(10) unsigned DEFAULT NULL,
  `model_id` int(10) unsigned DEFAULT NULL,
  `market_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `getColor` (`colors_id`),
  KEY `getModel` (`model_id`),
  CONSTRAINT `getColor` FOREIGN KEY (`colors_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `getModel` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `plus` WRITE;
/*!40000 ALTER TABLE `plus` DISABLE KEYS */;

INSERT INTO `plus` (`id`, `name`, `price`, `size`, `colors_id`, `model_id`, `market_id`)
VALUES
	(5392,'iphone 6s  space gray',1565,16,6,3,2),
	(5393,'iphone 6s  silver',1565,16,3,3,2),
	(5394,'iphone 6s  gold',1565,16,2,3,2),
	(5395,'iphone 6s  rose gold',1565,16,1,5,2),
	(5396,'iphone se gold ',1175,16,2,5,2),
	(5397,'iphone se rose gold ',1175,16,1,5,2),
	(5398,'iphone se silver ',1175,16,3,5,2),
	(5399,'iphone 6s plus  silver',1900,16,3,4,2),
	(5400,'iphone 6s  space gray',1880,64,6,3,2),
	(5401,'iphone 5s 16  gold',844,0,2,8,2),
	(5402,'iphone 5s 16  silver',1249,0,3,8,2),
	(5403,'iphone 5s 16  space gray',840,0,6,8,2),
	(5404,'iphone 6s  silver',2270,128,3,3,2),
	(5405,'iphone 6s  space gray',2270,128,6,3,2),
	(5406,'iphone 6s plus  space gray',2399,128,6,4,2),
	(5407,'iphone 6s plus  rose gold',1900,16,1,4,2),
	(5408,'iphone 6s plus  space gray',1900,16,6,4,2),
	(5409,'iphone 6s plus  space gray',2199,64,6,4,2),
	(5410,'iphone 6  gold',1490,16,2,6,2),
	(5411,'iphone 6  silver',1365,16,3,6,2),
	(5412,'iphone 6  space gray',1365,16,6,6,2),
	(5413,'iphone 6  gold',1878,64,2,6,2),
	(5414,'iphone 6  silver',1878,64,3,6,2),
	(5415,'iphone 6  space gray',1878,64,6,6,2),
	(5416,'iphone 5c  yellow no facetime',777.4,16,11,9,1),
	(5417,'iphone 5s  space gray',839,16,6,8,1),
	(5418,'iphone 5s  silver',839,16,3,8,1),
	(5419,'iphone 5s  gold',839,16,2,8,1),
	(5420,'iphone se  space gray',1215,16,6,5,1),
	(5421,'iphone se  silver',1215,16,3,5,1),
	(5422,'iphone se  gold',1215,16,2,5,1),
	(5423,'iphone se  rose gold',1215,16,1,5,1),
	(5424,'iphone se  space gray',1363,64,6,5,1),
	(5425,'iphone se  silver',1363,64,3,5,1),
	(5426,'iphone se  gold',1363,64,2,5,1),
	(5427,'iphone 6s  space gray',1599,16,6,3,1),
	(5428,'iphone 6s  silver',1599,16,3,3,1),
	(5429,'iphone 6s  gold ',1599,16,2,3,1),
	(5430,'iphone 6s  rose gold',1599,16,1,5,1),
	(5431,'iphone 6s  space gray',1883,64,6,3,1),
	(5432,'iphone 6s  silver',1883,64,3,3,1),
	(5433,'iphone 6s  gold',1883,64,2,3,1),
	(5434,'iphone 6s  rose gold',1883,64,1,5,1),
	(5435,'iphone 6s  space gray',2264,128,6,3,1),
	(5436,'iphone 6s  silver',2264,128,3,3,1),
	(5437,'iphone 6s  gold',2264,128,2,3,1),
	(5438,'iphone 6s  rose gold',2264,128,1,5,1),
	(5439,'iphone 6s plus  space gray',1899,16,6,4,1),
	(5440,'iphone 6s plus  silver',1899,16,3,4,1),
	(5441,'iphone 6s plus  gold',1899,16,2,4,1),
	(5442,'iphone 6s plus  rose gold',1899,16,1,4,1),
	(5443,'iphone 6s plus  space gray',2276,64,6,4,1),
	(5444,'iphone 6s plus  silver',2276,64,3,4,1),
	(5445,'iphone 6s plus  gold',2276,64,2,4,1),
	(5446,'iphone 6s  space gray',1883,64,6,3,1),
	(5447,'iphone 6s  silver',1883,64,3,3,1),
	(5448,'iphone 6s  gold',1883,64,2,3,1),
	(5449,'iphone 6s  rose gold',1883,64,1,5,1),
	(5450,'iphone 6s  space gray',2264,128,6,3,1),
	(5451,'iphone 6s  silver',2264,128,3,3,1),
	(5452,'iphone 6s  gold',2264,128,2,3,1),
	(5453,'iphone 6s  rose gold',2264,128,1,5,1),
	(5454,'iphone 6s plus  space gray',1899,16,6,4,1),
	(5455,'iphone 6s plus  silver',1899,16,3,4,1),
	(5456,'iphone 6s plus  gold',1899,16,2,4,1),
	(5457,'iphone 6s plus  rose gold',1899,16,1,4,1),
	(5458,'iphone 6s plus  space gray',2276,64,6,4,1),
	(5459,'iphone 6s plus  silver',2276,64,3,4,1),
	(5460,'iphone 6s plus  gold',2276,64,2,4,1),
	(5461,'iphone 6 plus  gold',2701.4,128,2,7,1),
	(5462,'iphone se  rose gold',1363,64,1,5,1),
	(5463,'iphone 6s plus  rose gold',2368,128,1,4,1),
	(5464,'iphone 7  black ',2099,32,4,1,1),
	(5465,'iphone 7  silver',2045,32,3,1,1),
	(5466,'iphone 7   gold',2045,32,2,1,1),
	(5467,'iphone 7  rose gold',2045,32,1,5,1),
	(5468,'iphone 7  black',2393,128,4,1,1),
	(5469,'iphone 7  silver',2393,128,3,1,1),
	(5470,'iphone 7  gold',2393,128,2,1,1),
	(5471,'iphone 7  rose gold',2393,128,1,5,1),
	(5472,'iphone 7  black',2905,256,4,1,1),
	(5473,'iphone 7  jet black',2444,128,5,1,1),
	(5474,'iphone 6s  space gray',1665,32,6,3,1),
	(5475,'iphone 6s  silver',1665,32,3,3,1),
	(5476,'iphone 6s  gold',1665,32,2,3,1),
	(5477,'iphone 6s  rose gold',1665,32,1,5,1),
	(5478,'iphone 7  rose gold',2905,256,1,5,1),
	(5479,'iphone 7 plus  black',2745,32,4,2,1),
	(5480,'iphone 7 plus  silver',2745,32,3,2,1),
	(5481,'iphone 7 plus  gold',2745,32,2,2,1),
	(5482,'iphone 7 plus  rose gold',2745,32,1,2,1),
	(5483,'iphone 7 plus  black',3325,128,4,2,1),
	(5484,'iphone 7 plus  silver',3325,128,3,2,1),
	(5485,'iphone 7 plus  gold',3325,128,2,2,1),
	(5486,'iphone 7 plus  rose gold',3325,128,1,2,1),
	(5487,'iphone 7 plus  jet black',3459,128,5,2,1),
	(5488,'iphone 7 plus  black',3486,256,4,2,1),
	(5489,'iphone 7 plus  silver',3486,256,3,2,1),
	(5490,'iphone 7 plus  gold',3486,256,2,2,1),
	(5491,'iphone 7 plus  rose gold',3486,256,1,2,1),
	(5492,'iphone 6s plus  space gray',1959,32,6,4,1),
	(5493,'iphone 6s plus  silver',1959,32,3,4,1),
	(5494,'iphone 7 plus  jet black',4030,256,5,2,1),
	(5495,'iphone 7  jet black',3224,256,5,1,1),
	(5496,'iphone 7  silver',2905,256,3,1,1),
	(5497,'iphone 7  gold',2905,256,2,1,1),
	(5498,'iphone 7 black ',2099,32,4,1,3),
	(5499,'iphone 7 silver ',2099,32,3,1,3),
	(5500,'iphone 7 gold ',2099,32,2,1,3),
	(5501,'iphone 7 rose gold ',2099,32,1,5,3),
	(5502,'iphone 7 jet black ',2632,128,5,1,3),
	(5503,'iphone 7 black ',2439,128,4,1,3),
	(5504,'iphone 7 silver ',2439,128,3,1,3),
	(5505,'iphone 7 gold ',2439,128,2,1,3),
	(5506,'iphone 7 rose gold ',2439,128,1,5,3),
	(5507,'iphone 7 jet black ',2961,256,5,1,3),
	(5508,'iphone 7 black ',2961,256,4,1,3),
	(5509,'iphone 7 silver ',2961,256,3,1,3),
	(5510,'iphone 7 gold ',2961,256,2,1,3),
	(5511,'iphone 7 rose gold ',2961,256,1,5,3),
	(5512,'iphone 7 plus black ',2785,32,4,2,3),
	(5513,'iphone 7 plus silver ',2785,32,3,2,3),
	(5514,'iphone 7 plus gold ',2785,32,2,2,3),
	(5515,'iphone 7 plus rose gold ',2785,32,1,2,3),
	(5516,'iphone 7 plus jet black ',3356,128,5,2,3),
	(5517,'iphone 7 plus black ',3356,128,4,2,3),
	(5518,'iphone 7 plus silver ',3356,128,3,2,3),
	(5519,'iphone 7 plus gold ',3356,128,2,2,3),
	(5520,'iphone 7 plus rose gold ',3356,128,1,2,3),
	(5521,'iphone 7 plus jet black ',3549,256,5,2,3),
	(5522,'iphone 7 plus black ',3549,256,4,2,3),
	(5523,'iphone 7 plus silver ',3549,256,3,2,3),
	(5524,'iphone 7 plus gold ',3549,256,2,2,3),
	(5525,'iphone 7 plus rose gold ',3549,256,1,2,3),
	(5526,'iphone 6s silver ',1563,16,3,3,3),
	(5527,'iphone 6s gold ',1563,16,2,3,3),
	(5528,'iphone 6s rose gold ',1563,16,1,5,3),
	(5529,'iphone 6s silver ',1669,32,3,3,3),
	(5530,'iphone 6s gold ',1669,32,2,3,3),
	(5531,'iphone 6s rose gold ',1669,32,1,5,3),
	(5532,'iphone 6s silver ',1915,64,3,3,3),
	(5533,'iphone 6s gold ',1915,64,2,3,3),
	(5534,'iphone 6s rose gold ',1915,64,1,5,3),
	(5535,'iphone 6s silver ',2303,128,3,3,3),
	(5536,'iphone 6s gold ',2303,128,2,3,3),
	(5537,'iphone 6s rose gold ',2303,128,1,5,3),
	(5538,'iphone 6s plus silver ',1986,16,3,4,3),
	(5539,'iphone 6s plus gold ',1986,16,2,4,3),
	(5540,'iphone 6s plus rose gold ',1986,16,1,4,3),
	(5541,'iphone 6s plus silver ',2315,64,3,4,3),
	(5542,'iphone 6s plus gold ',2315,64,2,4,3),
	(5543,'iphone 6s plus rose gold ',2315,64,1,4,3),
	(5544,'iphone 6s plus silver ',2409,128,3,4,3),
	(5545,'iphone 6s plus gold ',2409,128,2,4,3),
	(5546,'iphone 6s plus rose gold ',2409,128,1,4,3),
	(5547,'iphone se silver ',1152,16,3,5,3),
	(5548,'iphone se gold ',1152,16,2,5,3),
	(5549,'iphone se rose gold ',1152,16,1,5,3),
	(5550,'iphone se silver ',1387,64,3,5,3),
	(5551,'iphone se gold ',1387,64,2,5,3),
	(5552,'iphone se rose gold ',1387,64,1,5,3),
	(5553,'iphone 6 silver ',1422,16,3,6,3),
	(5554,'iphone 6 gold ',1464,16,2,6,3),
	(5555,'iphone 6 silver ',1774,64,3,6,3),
	(5556,'iphone 6 gold ',1774,64,2,6,3),
	(5557,'iphone 6 silver ',1951,128,3,6,3),
	(5558,'iphone 6 gold ',1951,128,2,6,3),
	(5559,'iphone 6 plus silver ',1880,16,3,7,3),
	(5560,'iphone 6 plus gold ',1880,16,2,7,3),
	(5561,'iphone 6 plus silver ',2021,64,3,7,3),
	(5562,'iphone 6 plus gold ',2021,64,2,7,3),
	(5563,'iphone 6 plus silver ',2115,128,3,7,3),
	(5564,'iphone 6 plus gold ',2115,128,2,7,3),
	(5565,'iphone 5s silver ',853,16,3,8,3),
	(5566,'iphone 5s gold ',858,16,2,8,3),
	(5567,'iphone 5s silver ',1318,64,3,8,3);

/*!40000 ALTER TABLE `plus` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
