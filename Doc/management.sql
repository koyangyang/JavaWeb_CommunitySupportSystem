/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.23 : Database - Management
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`Management` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Management`;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`name`,`price`,`content`,`date`,`user`) values 
(1,'接孩子',3,'顺路接孩子从幼儿园回来','2021-07-01 08:22:11','Test'),
(2,'拿文件',1,'顺路从门卫室拿文件带到五号楼','2021-07-01 08:22:48','Koyang'),
(3,'送孩子',1,'顺路带孩子去幼儿园','2021-07-01 08:25:02','Test'),
(4,'送文件',1,'送文件去门卫室','2021-07-01 08:26:46','Koyang');

/*Table structure for table `his` */

DROP TABLE IF EXISTS `his`;

CREATE TABLE `his` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `his` */

insert  into `his`(`id`,`content`,`date`,`user`) values 
(1,'接取了: 接孩子 委托，详细内容是: 顺路接孩子从幼儿园回来 ,完成报酬是: 3.0接取了: 拿文件 委托，详细内容是: 顺路从门卫室拿文件带到五号楼 ,完成报酬是: 1.0 一共总计为:4.0元','2021-07-03 13:02:06','Test'),
(2,'接取了: 接孩子 委托，详细内容是: 顺路接孩子从幼儿园回来 ,完成报酬是: 3.0接取了: 拿文件 委托，详细内容是: 顺路从门卫室拿文件带到五号楼 ,完成报酬是: 1.0 一共总计为:4.0元','2021-07-03 13:10:41','Test'),
(3,'接取了: 接孩子 委托，详细内容是: 顺路接孩子从幼儿园回来 ,完成报酬是: 3.0接取了: 送孩子 委托，详细内容是: 顺路带孩子去幼儿园 ,完成报酬是: 1.0 一共总计为:4.0元','2021-07-03 13:13:15','Koyang');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `name` varchar(20) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`name`,`pwd`,`status`,`phone`) values 
('Koyang','e10adc3949ba59abbe56e057f20f883e',0,'1234567890'),
('Admin','e10adc3949ba59abbe56e057f20f883e',1,'123456');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
