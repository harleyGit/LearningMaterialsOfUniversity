/*
SQLyog Enterprise - MySQL GUI v6.03
Host - 5.0.24a-community-nt : Database - studb
*********************************************************************
Server version : 5.0.24a-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `studb`;

USE `studb`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `stuinfo` */

DROP TABLE IF EXISTS `stuinfo`;

CREATE TABLE `stuinfo` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `classes` varchar(10) default NULL,
  `score` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stuinfo` */

insert  into `stuinfo`(`id`,`name`,`classes`,`score`) values (1,'张三','22','32'),(2,'李四','32','96'),(3,'王五','12','86');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
