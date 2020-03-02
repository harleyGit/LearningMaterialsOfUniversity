/*
SQLyog Enterprise - MySQL GUI v6.14
MySQL - 5.0.24a-community-nt : Database - studb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `studb`;

USE `studb`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(8) default NULL,
  `name` varchar(30) collate utf8_bin default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `student` */

insert  into `student`(`id`,`name`) values (2,'zyj');

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

insert  into `stuinfo`(`id`,`name`,`classes`,`score`) values (10,'朱爱华','34','98'),(18,'漠孤烟','54','43'),(19,'天涯客','777','45'),(21,'张燕君','02','87'),(24,'测试事务','1','1'),(25,'测试事务','1','1'),(26,'测试事务','1','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
