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
-- Table structure for table `unit_inf`
--

DROP TABLE IF EXISTS `unit_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_inf` (
  `unit_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `unit_name` varchar(30) DEFAULT NULL COMMENT '单位ID',
  `linkman` varchar(15) DEFAULT NULL COMMENT '联系人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话/手机',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮箱',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`unit_id`),
  UNIQUE KEY `unit_name_UNIQUE` (`unit_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校外单位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_inf`
--

LOCK TABLES `unit_inf` WRITE;
/*!40000 ALTER TABLE `unit_inf` DISABLE KEYS */;
INSERT INTO `unit_inf` VALUES (1,'华南师范大学','刘鸣',NULL,NULL,NULL),(3,'华南农业大学','刘鸣',NULL,'liuming@scnu.edu.cn',NULL);
/*!40000 ALTER TABLE `unit_inf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-17 22:11:15
