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
-- Table structure for table `user_inf`
--

DROP TABLE IF EXISTS `user_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_inf` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID,主键',
  `user_account` varchar(15) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL COMMENT '用户姓名',
  `password` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `lock_mode` varchar(10) DEFAULT NULL COMMENT '锁定状态	“有效”\n		 “临时锁定”\n		 “永久锁定”',
  `unit_name` varchar(20) DEFAULT NULL,
  `rent_start` datetime DEFAULT NULL COMMENT '租期开始时间',
  `rent_end` datetime DEFAULT NULL COMMENT '租期结束时间',
  `price` double DEFAULT NULL COMMENT '租金价格',
  `pay_date` datetime DEFAULT NULL COMMENT '缴费日期',
  `operator` varchar(15) DEFAULT NULL COMMENT '操作人账号',
  `save_url` varchar(100) DEFAULT NULL COMMENT '实验保存路径',
  `last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_ip` varchar(45) DEFAULT NULL COMMENT '最后登录IP',
  `remark` varchar(45) DEFAULT NULL COMMENT '备注',
  `seq` int(11) DEFAULT NULL COMMENT 'seqr必须等于user_account后四位的数字值，从数据库中增加seq时需留意',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别：男、女、保密\n默认保密',
  `age` varchar(3) DEFAULT NULL COMMENT '年龄',
  `city_id` int(32) DEFAULT NULL COMMENT '所在城市id',
  `icon_url` varchar(100) DEFAULT NULL COMMENT '头像地址',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_account_UNIQUE` (`user_account`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='实验用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_inf`
--

LOCK TABLES `user_inf` WRITE;
/*!40000 ALTER TABLE `user_inf` DISABLE KEYS */;
INSERT INTO `user_inf` VALUES (1,'scnu1230300','莫晓平','e10adc3949ba59abbe56e057f20f883e','UNLOCK','华南师范大学','2015-05-06 12:32:52','2015-05-06 12:32:52',50,'2015-11-01 00:00:00','admin','192.168.1.105',NULL,'192.168.1.1',NULL,300,'保密','保密',200,NULL),(3,'scnu1230020','刘乔雨','e10adc3949ba59abbe56e057f20f883e','LOCK_TEMP','广东工业大学','2015-05-06 12:32:52','2015-08-06 12:32:52',40,'2015-11-01 00:00:00','admin','192.168.1.105',NULL,NULL,NULL,20,'男','19',201,NULL),(5,'scnu1230101','欧德成','e10adc3949ba59abbe56e057f20f883e','UNLOCK','暨南大学','2015-05-06 12:32:52','2015-08-06 12:32:52',35,'2015-11-01 00:00:00','admin','192.168.1.105',NULL,NULL,NULL,101,'	男','20',202,NULL),(6,'scnu1230021','莫晓平','e10adc3949ba59abbe56e057f20f883e','LOCK_TEMP','华南师范大学','2015-05-06 12:32:52','2015-08-06 12:32:52',64,'2015-11-01 00:00:00','admin','192.168.1.105',NULL,NULL,NULL,21,'女','15',203,NULL),(7,'scnu1230561','陈新皓','e10adc3949ba59abbe56e057f20f883e','LOCK_TEMP','武汉大学','2015-05-06 00:00:01','2015-08-06 00:00:01',55,'2015-11-01 00:00:01','admin','192.168.1.105',NULL,NULL,NULL,561,'	男','保密',204,NULL),(8,'scnu1230100','莫晓平2','e10adc3949ba59abbe56e057f20f883e','LOCK_EVER','广东工业大学','2015-05-06 12:32:52','2015-08-06 12:32:52',0,'2015-11-01 00:00:00','admin','192.168.1.105',NULL,NULL,NULL,100,'女','22',205,NULL),(9,'scnu1230500','莫晓平1','e10adc3949ba59abbe56e057f20f883e','LOCK_EVER','广东工业大学','2015-05-06 12:32:52','2015-08-06 12:32:52',0,'2015-11-01 00:00:00','admin','save_url1',NULL,NULL,NULL,500,'女','20',206,NULL),(15,'scnu1112003','梁伟杰','e10adc3949ba59abbe56e057f20f883e','UNLOCK','华南师范大学','2015-08-13 00:00:00','2015-11-01 00:00:00',80,'2015-11-01 00:00:00','admin',NULL,NULL,NULL,NULL,2003,'	男','保密',200,NULL),(25,'scau1230002','胡宇山','e10adc3949ba59abbe56e057f20f883e','LOCK_TEMP','华南师范大学','2015-08-17 00:00:00','2016-07-03 00:00:00',35,'2015-08-04 00:00:00','admin',NULL,NULL,NULL,NULL,2,'女','21',208,NULL),(26,'scau1230003','黄宇杰','e10adc3949ba59abbe56e057f20f883e','LOCK_EVER','华南农业大学','2015-08-17 00:00:01','2016-07-03 00:00:01',35,'2015-08-26 00:00:01','admin',NULL,NULL,NULL,NULL,3,'	男','保密',209,NULL),(27,'scau1230004','陈龙','e10adc3949ba59abbe56e057f20f883e','UNLOCK','华师幼儿园','2015-08-14 00:00:01','2016-07-03 00:00:01',35,'2015-08-17 00:00:01','admin',NULL,NULL,NULL,NULL,4,'女','3',210,NULL);
/*!40000 ALTER TABLE `user_inf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-18 19:44:32
