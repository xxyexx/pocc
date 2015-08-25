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
-- Table structure for table `course_inf`
--

DROP TABLE IF EXISTS `course_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_inf` (
  `id` int(11) NOT NULL COMMENT '主键id，id号对应实验编号',
  `course_no` varchar(45) DEFAULT NULL COMMENT '课程编号,如   实验（一）、实验（二）',
  `course_name` varchar(45) DEFAULT NULL COMMENT '课程名，如：阵列乘法器的设计实验',
  `course_require` varchar(200) DEFAULT NULL COMMENT '实验要求：实验时候的一些要求啊，比如这个实验内容要做什么之类的。',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程信息表\n本表暂不提供自动插入修改功能，如需修改，需要直接操作数据库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_inf`
--

LOCK TABLES `course_inf` WRITE;
/*!40000 ALTER TABLE `course_inf` DISABLE KEYS */;
INSERT INTO `course_inf` VALUES (1,'实验（一）','阵列乘法器的设计实验','实验一要求'),(2,'实验（二）',NULL,NULL),(3,'实验（三）',NULL,NULL),(4,'实验（四）',NULL,NULL),(5,'实验（五）',NULL,NULL),(6,'实验（六）',NULL,NULL),(7,'实验（七）',NULL,NULL),(8,'实验（八）',NULL,NULL);
/*!40000 ALTER TABLE `course_inf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-25 23:44:25
