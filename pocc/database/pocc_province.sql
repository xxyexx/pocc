-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: pocc
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` tinyint(8) NOT NULL AUTO_INCREMENT,
  `province` varchar(16) NOT NULL,
  `province_code` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'北京市','BJ'),(2,'天津市','TJ'),(3,'河北省','HEB'),(4,'山西省','SX'),(5,'内蒙古自治区','NM'),(6,'辽宁省','LN'),(7,'吉林省','JL'),(8,'黑龙江省','HLJ'),(9,'上海市','SH'),(10,'江苏省','JS'),(11,'浙江省','ZJ'),(12,'安徽省','AH'),(13,'福建省','FJ'),(14,'江西省','JX'),(15,'山东省','SD'),(16,'河南省','HEN'),(17,'湖北省','HUB'),(18,'湖南省','HUN'),(19,'广东省','GD'),(20,'广西壮族自治区','GX'),(21,'海南省','HAN'),(22,'重庆市','CQ'),(23,'四川省','SC'),(24,'贵州省','GZ'),(25,'云南省','YN'),(26,'西藏自治区','XZ'),(27,'陕西省','SHX'),(28,'甘肃省','GS'),(29,'青海省','QH'),(30,'宁夏回族自治区','NX'),(31,'新疆维吾尔自治区','XJ'),(32,'台湾省','TW'),(33,'香港特别行政区','HK'),(34,'澳门特别行政区','AM');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-18 19:51:02
