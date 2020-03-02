/*
SQLyog Enterprise - MySQL GUI v6.14
MySQL - 5.0.41-community-nt : Database - e_photo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `e_photo`;

USE `e_photo`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(4) unsigned zerofill NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `pass` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`pass`) values (0001,'admin','admin');

/*Table structure for table `leibie` */

DROP TABLE IF EXISTS `leibie`;

CREATE TABLE `leibie` (
  `id` int(4) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `shuoming` varchar(300) default NULL,
  `contenttime` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `leibie` */

insert  into `leibie`(`id`,`name`,`shuoming`,`contenttime`) values (1,'同学好友','this is my firends and students','2008-07-11 19:20:43'),(2,'动物世界','这里是动物的世界','2008-07-11 19:29:43'),(3,'军事天地','这里是军事天地','2008-07-12 19:29:43'),(4,'科技时代','这里是科技时代','2008-07-13 19:29:43'),(5,'异域风光','这里是异域风光','2008-07-14 19:29:43'),(7,'my love','this is my love','2008-07-20 19:29:43');

/*Table structure for table `photo` */

DROP TABLE IF EXISTS `photo`;

CREATE TABLE `photo` (
  `id` int(10) unsigned zerofill NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `path` varchar(200) default NULL,
  `dianji` int(11) default NULL,
  `contentTime` varchar(30) default NULL,
  `shuoming` varchar(255) default NULL,
  `lid` int(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `photo` */

insert  into `photo`(`id`,`name`,`path`,`dianji`,`contentTime`,`shuoming`,`lid`) values (0000000001,'风景01','1216304669234_min.gif',147,'2008-07-17 19:03:05','这双鞋是不是很好看呢？',1),(0000000002,'风景02','1216304748828_min.jpg',75,'2008-07-17 19:03:25','呵呵，很漂亮!haha',1),(0000000004,'风景04','1216304707187_min.jpg',22,'2008-07-17 19:03:40','伤痛...',2),(0000000005,'风景05','1216304714703_min.jpg',11,'2008-07-17 19:03:45','呵呵，很漂亮!',1),(0000000006,'风景06','1216304724265_min.jpg',101,'2008-07-17 19:03:50','呵呵，很漂亮!',2),(0000000007,'风景07','1216304733593_min.jpg',14,'2008-07-17 19:03:55','呵呵，很漂亮!',1),(0000000008,'风景08','1216304741515_min.jpg',5,'2008-07-17 19:03:59','呵呵，很漂亮!',1),(0000000010,'风景10','1216304756625_min.jpg',27,'2008-07-17 19:04:15','呵呵，很漂亮!',1),(0000000012,'风景12','1216304714703_min.jpg',14,'2008-07-17 19:04:30','有时候为自己点起一盏孤灯,等待的心情多了一丝温暖,点一盏灯,思一段情,等待一丝希望......',0),(0000000013,'风景13','1216304771593_min.jpg',9,'2008-07-17 19:03:50','呵呵，真的很漂亮哦!真的很壮观哦!',5);

/*Table structure for table `pinglun` */

DROP TABLE IF EXISTS `pinglun`;

CREATE TABLE `pinglun` (
  `id` int(4) NOT NULL auto_increment,
  `contentText` varchar(255) default NULL,
  `contentTime` varchar(50) default NULL,
  `name` varchar(20) default NULL,
  `pid` int(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pinglun` */

insert  into `pinglun`(`id`,`contentText`,`contentTime`,`name`,`pid`) values (53,'一对情侣就像一双鞋子，要配合默契才能走出漂亮的每一步，爱情之路都很难走下去·','2008-08-05 16:00:32','鞋子',1),(54,'爱情之路是痛苦并快乐着的..','2008-08-05 16:03:42','宝贝',1),(55,'落花恋流水。。。\r<br>流水恋落花。。。','2008-08-05 16:19:19','匿名',6),(56,'呵呵，真的很漂亮哦!','2008-08-17 01:11:10','匿名',1),(57,'haha','2008-08-17 03:12:54','匿名',1),(58,'痛到了极点就不会再觉的痛了..','2008-08-17 03:33:00','匿名',4);

/*Table structure for table `systems` */

DROP TABLE IF EXISTS `systems`;

CREATE TABLE `systems` (
  `id` int(4) NOT NULL,
  `name` varchar(20) default NULL,
  `logopath` varchar(300) default NULL,
  `gonggao` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `systems` */

insert  into `systems`(`id`,`name`,`logopath`,`gonggao`) values (1,'思怡网络相册v1.2版','1218905525953_min.gif','欢迎来到思怡网络相册');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
