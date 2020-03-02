/*
SQLyog Enterprise - MySQL GUI v6.14
MySQL - 5.0.37-community-nt : Database - bbs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `bbs`;

USE `bbs`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `bbs` */

DROP TABLE IF EXISTS `bbs`;

CREATE TABLE `bbs` (
  `AnnounceID` int(11) NOT NULL auto_increment,
  `ParentID` int(11) NOT NULL default '0',
  `Child` int(11) NOT NULL default '0',
  `BoardID` int(11) NOT NULL default '0',
  `UserName` varchar(50) NOT NULL default '',
  `UserEmail` varchar(255) NOT NULL default '',
  `Topic` varchar(255) NOT NULL default '',
  `Title` varchar(50) NOT NULL,
  `Body` longtext NOT NULL,
  `DateAndTime` varchar(30) NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `ip` varchar(20) NOT NULL default '',
  `Expression` varchar(255) NOT NULL default '',
  `istop` int(11) NOT NULL default '0',
  `islock` int(11) NOT NULL,
  `isgood` int(11) NOT NULL default '0',
  `isvote` int(11) NOT NULL,
  `heart` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `lastre` varchar(30) default NULL,
  `state` int(1) default NULL,
  PRIMARY KEY  (`AnnounceID`),
  KEY `boardbbs1` (`BoardID`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=gbk;

/*Data for the table `bbs` */

insert  into `bbs`(`AnnounceID`,`ParentID`,`Child`,`BoardID`,`UserName`,`UserEmail`,`Topic`,`Title`,`Body`,`DateAndTime`,`hits`,`ip`,`Expression`,`istop`,`islock`,`isgood`,`isvote`,`heart`,`type`,`lastre`,`state`) values (54,1,47,1,'admin','shasha73@sina.com','Image7.gif','第二贴','快速回复第二贴','2008/09/15 09:28:28',0,'127.0.0.1','1024',0,0,0,0,'face3.gif','回复','2008/09/15 09:28:28',1),(55,1,45,1,'admin','shasha73@sina.com','Image7.gif','第一贴','1','2008/09/15 09:36:07',0,'127.0.0.1','1024',0,0,0,0,'face3.gif','回复','2008/09/15 09:36:07',1),(56,1,45,1,'admin','shasha73@sina.com','Image7.gif','第一贴','1','2008/09/15 09:36:10',0,'127.0.0.1','1024',0,0,0,0,'face3.gif','回复','2008/09/15 09:36:10',1),(57,1,45,1,'admin','shasha73@sina.com','Image7.gif','第一贴','1','2008/09/15 09:36:12',0,'127.0.0.1','1024',0,0,0,0,'face3.gif','回复','2008/09/15 09:36:12',1),(58,1,45,1,'admin','shasha73@sina.com','Image7.gif','第一贴','1','2008/09/15 09:36:13',0,'127.0.0.1','1024',0,0,0,0,'face3.gif','回复','2008/09/15 09:36:13',1),(59,1,45,1,'admin','shasha73@sina.com','Image7.gif','第一贴','1','2008/09/15 09:36:16',0,'127.0.0.1','1024',0,0,0,0,'face3.gif','回复','2008/09/15 09:36:16',1),(60,1,45,1,'admin','shasha73@sina.com','Image7.gif','第一贴','1','2008/09/15 09:36:17',0,'127.0.0.1','1024',0,0,0,0,'face3.gif','回复','2008/09/15 09:36:17',1),(63,1,45,1,'admin','shasha73@sina.com','Image7.gif','第一贴','1','2008/09/15 09:36:24',0,'127.0.0.1','1024',0,0,0,0,'face3.gif','回复','2008/09/15 09:36:24',1),(114,1,0,1,'admin','shasha73@sina.com','Image7.gif','1111111','1234','2008/09/17 22:39:01',41,'127.0.0.1','1024',0,0,0,1,'face3.gif','原创','2008/09/17 22:39:01',1),(115,1,0,1,'admin','shasha73@sina.com','Image7.gif','2222','1234','2008/09/17 22:39:10',60,'127.0.0.1','1024',0,0,0,1,'face3.gif','原创','2008/09/17 22:39:10',1),(45,1,0,1,'admin','shasha73@sina.com','Image7.gif','第一贴','本论坛第一贴','2008/09/14 11:13:39',30,'127.0.0.1','1024',0,0,0,0,'face10.gif','原创','2008/09/14 11:15:14',1),(46,1,45,1,'admin','shasha73@sina.com','Image7.gif','回复第一贴','本论坛第一回复贴','2008/09/14 11:14:12',0,'127.0.0.1','1024',0,0,0,0,'face7.gif','回复','2008/09/14 11:14:12',1),(47,1,0,1,'admin','shasha73@sina.com','Image7.gif','第二贴','<FONT face=幼圆 color=#3809f7 size=7>本论坛第二贴</FONT>','2008/09/14 11:14:47',7,'127.0.0.1','1024',0,0,0,0,'face11.gif','原创','2008/09/14 11:14:47',1),(48,1,45,1,'admin','shasha73@sina.com','Image7.gif','第二回复','第二次回复第一贴','2008/09/14 11:15:14',0,'127.0.0.1','1024',0,0,0,0,'face3.gif','回复','2008/09/14 11:15:14',1),(49,0,0,0,'admin','shasha73@sina.com','Image7.gif','','','2008/09/14 05:00:55',0,'127.0.0.1','1024',0,0,0,0,'face3.gif','原创','2008/09/14 05:00:55',1),(50,1,0,2,'admin','shasha73@sina.com','Image7.gif','9.15','08年9月15日第一贴.','2008/09/15 09:06:11',8,'127.0.0.1','1024',0,0,0,0,'face3.gif','原创','2008/09/15 09:06:11',1),(51,0,0,0,'admin','shasha73@sina.com','Image7.gif','','快速回复 第二贴','2008/09/15 09:14:01',0,'127.0.0.1','1024',0,0,0,0,'','','2008/09/15 09:14:01',1),(52,0,0,0,'admin','shasha73@sina.com','Image7.gif','','第二贴吧快速回复','2008/09/15 09:15:29',0,'127.0.0.1','1024',0,0,0,0,'','','2008/09/15 09:15:29',1),(116,1,0,1,'admin','shasha73@sina.com','Image7.gif','Hello world !','<IMG src=\"http://bbs.bipt.edu.cn/images/upload/face/2006/11/25/211453.gif\" border=0>测试下','2008/09/23 10:08:52',26,'localhost','1024',0,0,0,1,'face3.gif','原创','2008/09/23 10:08:52',1),(117,1,116,1,'admin','shasha73@sina.com','Image7.gif','Hello','This is test !','2008/09/23 10:09:23',0,'localhost','1024',0,0,0,0,'face3.gif','回复','2008/09/23 10:09:23',1),(118,1,116,1,'admin','shasha73@sina.com','Image7.gif','Hello','This is test !','2008/09/23 10:09:35',0,'localhost','1024',0,0,0,0,'face3.gif','回复','2008/09/23 10:09:35',1),(119,1,116,1,'admin','shasha73@sina.com','Image7.gif','Hello','tfds','2008/09/23 10:09:41',0,'localhost','1024',0,0,0,0,'face3.gif','回复','2008/09/23 10:09:41',1),(120,1,0,1,'admin','shasha73@sina.com','Image7.gif','大家好! ','&nbsp;大家好..','2008/09/23 10:26:35',5,'localhost','1024',0,0,0,1,'face3.gif','原创','2008/09/23 10:26:35',0),(121,1,0,1,'admin','shasha73@sina.com','Image7.gif','大家好! ','&nbsp;大家好..','2008/09/23 10:28:45',6,'localhost','1024',0,0,0,1,'face3.gif','原创','2008/09/23 10:28:45',0),(122,1,0,1,'admin','shasha73@sina.com','Image7.gif','大家好! ','&nbsp;大家好..','2008/09/23 10:30:23',11,'localhost','1024',0,0,0,1,'face3.gif','原创','2008/09/23 10:30:23',1),(123,1,0,1,'admin','shasha73@sina.com','Image7.gif','大家好! ','&nbsp;大家好..','2008/09/23 10:30:39',22,'localhost','1024',0,0,0,1,'face3.gif','原创','2008/09/23 10:30:39',1),(125,1,116,1,'admin','shasha73@sina.com','Image7.gif','Hello','This is test!\r\n','2008/09/23 11:34:32',0,'localhost','1024',0,0,0,0,'face3.gif','回复','2008/09/23 11:34:32',1),(126,2,0,3,'bianzc','bzc19850321@163.com','pic/Image2.gif','test','4、修改tomcat/webapps/mvnforum/WEB-INF/class/mvncore_db_DBOptions.properties文件，这个文件配置与数据库相关的资料。设置内容如下：<BR>DRIVER_CLASS_NAME = org.postgresql.Driver<BR>DATABASE_URL = jdbc:postgresql://192.168.0.10:5432/mvnForum<BR>DATABASE_USER = postgres<BR>DATABASE_PASSWORD = ','2009/02/16 15:28:18',7,'localhost','1024',0,0,0,0,'face6.gif','原创','2009/02/16 15:28:18',1),(127,9,0,0,'bianzc','bzc19850321@163.com','pic/Image2.gif','test','test','2009/02/16 15:49:58',2,'localhost','1024',0,0,0,0,'face3.gif','原创','2009/02/16 15:49:58',1),(129,1,123,1,'admin','shasha73@sina.com','Image7.gif','大家好!','test','2009/02/20 17:10:41',0,'localhost','1024',0,0,0,0,'face3.gif','回复','2009/02/20 17:10:41',1);

/*Table structure for table `bbslink` */

DROP TABLE IF EXISTS `bbslink`;

CREATE TABLE `bbslink` (
  `id` int(11) NOT NULL auto_increment,
  `boardname` varchar(50) NOT NULL default '',
  `readme` varchar(255) NOT NULL default '',
  `url` varchar(150) NOT NULL default '',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

/*Data for the table `bbslink` */

/*Table structure for table `bbsnews` */

DROP TABLE IF EXISTS `bbsnews`;

CREATE TABLE `bbsnews` (
  `id` int(11) NOT NULL auto_increment,
  `boardid` int(11) NOT NULL default '0',
  `title` varchar(50) NOT NULL default '',
  `content` mediumtext NOT NULL,
  `username` varchar(50) NOT NULL default '',
  `addtime` varchar(30) NOT NULL default '0000-00-00 00:00:00',
  KEY `bbsnewsboardid` (`boardid`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

/*Data for the table `bbsnews` */

insert  into `bbsnews`(`id`,`boardid`,`title`,`content`,`username`,`addtime`) values (1,1,'分论坛公告','电脑技术版块公告','admin','2008/09/12 09:53:06'),(2,0,'论坛建设中','本论坛建设中，如果您有什么好的意见和见意请给我留言。','admin','2008-09-01 11:22:33'),(3,0,'欢迎来到FLY论坛','本论坛欢迎您的到来。','admin','2008-09-01 11:22:33'),(1,1,'分论坛公告','电脑技术版块公告','admin','2008/09/12 09:53:06'),(2,0,'论坛建设中','本论坛建设中，如果您有什么好的意见和见意请给我留言。','admin','2008-09-01 11:22:33'),(3,0,'欢迎来到FLY论坛','本论坛欢迎您的到来。','admin','2008-09-01 11:22:33');

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `boardid` int(11) NOT NULL default '0',
  `BoardType` varchar(50) NOT NULL default '',
  `classType` int(11) NOT NULL default '0',
  `readme` varchar(255) NOT NULL default '',
  `moderid` int(4) default NULL,
  `BoardMaster` varchar(50) default '',
  `lockboard` int(11) NOT NULL default '0',
  `Forumlogo` varchar(255) NOT NULL default '',
  `indexIMG` varchar(255) NOT NULL default '',
  `lastrootid` int(11) default NULL,
  `lasttitle` varchar(255) default '',
  `boarduser` mediumtext,
  `lastposttime` varchar(255) default NULL,
  PRIMARY KEY  (`boardid`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

/*Data for the table `board` */

insert  into `board`(`boardid`,`BoardType`,`classType`,`readme`,`moderid`,`BoardMaster`,`lockboard`,`Forumlogo`,`indexIMG`,`lastrootid`,`lasttitle`,`boarduser`,`lastposttime`) values (1,'技术论坛',1,'网站建设技术交流区，学习的过程中有什么不懂的就来吧！',11,'羽風',0,'','',1,'好消息','test','2008-09-01'),(2,'Java技术',1,'探讨java技术，大家共同提高。',1,'超级管理員',0,'','',NULL,'','',NULL),(3,'开发专区',2,'大家对现在用的论坛有什么发现和好的想法吗？',11,'羽風',0,'','',NULL,'','',NULL),(0,'家政服务',2,'论坛需要进一步改进',11,'羽風',1,'','indexIMG',NULL,'',NULL,NULL);

/*Table structure for table `bookmark` */

DROP TABLE IF EXISTS `bookmark`;

CREATE TABLE `bookmark` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL default '',
  `url` varchar(100) default NULL,
  `topic` varchar(100) default NULL,
  `addtime` varchar(19) default NULL,
  KEY `bookmarkUserName` (`username`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

/*Data for the table `bookmark` */

/*Table structure for table `classtype` */

DROP TABLE IF EXISTS `classtype`;

CREATE TABLE `classtype` (
  `id` int(10) NOT NULL default '0',
  `classType` varchar(50) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

/*Data for the table `classtype` */

insert  into `classtype`(`id`,`classType`) values (2,'版务处理'),(1,'电脑技术'),(9,'子女专区');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `ForumName` varchar(20) NOT NULL default '',
  `ForumURL` varchar(100) NOT NULL default '',
  `CompanyName` varchar(40) NOT NULL default '',
  `HostUrl` varchar(100) NOT NULL default '',
  `SystemEmail` varchar(50) NOT NULL default '',
  `Logo` varchar(100) NOT NULL default '',
  `IpFlag` int(11) NOT NULL default '0',
  `guestuser` int(11) NOT NULL default '0',
  `ads1` mediumtext NOT NULL,
  `ads2` mediumtext NOT NULL,
  `Copyright` varchar(255) NOT NULL default '',
  `Version` varchar(255) NOT NULL default '',
  `TitleFlag` tinyint(3) unsigned NOT NULL default '0',
  `uploadFlag` tinyint(3) unsigned NOT NULL default '0',
  `wealthReg` int(11) NOT NULL default '0',
  `wealthAnnounce` int(11) NOT NULL default '0',
  `wealthReannounce` int(11) NOT NULL default '0',
  `wealthDel` int(11) NOT NULL default '0',
  `wealthLogin` int(11) NOT NULL default '0',
  `epReg` int(11) NOT NULL default '0',
  `epAnnounce` int(11) NOT NULL default '0',
  `epReannounce` int(11) NOT NULL default '0',
  `epDel` int(11) NOT NULL default '0',
  `epLogin` int(11) NOT NULL default '0',
  `cpReg` int(11) NOT NULL default '0',
  `cpAnnounce` int(11) NOT NULL default '0',
  `cpReannounce` int(11) NOT NULL default '0',
  `cpDel` int(11) NOT NULL default '0',
  `cpLogin` int(11) NOT NULL default '0',
  `Maxonline` int(11) NOT NULL default '0',
  `MaxonlineDate` varchar(50) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

/*Data for the table `config` */

insert  into `config`(`ForumName`,`ForumURL`,`CompanyName`,`HostUrl`,`SystemEmail`,`Logo`,`IpFlag`,`guestuser`,`ads1`,`ads2`,`Copyright`,`Version`,`TitleFlag`,`uploadFlag`,`wealthReg`,`wealthAnnounce`,`wealthReannounce`,`wealthDel`,`wealthLogin`,`epReg`,`epAnnounce`,`epReannounce`,`epDel`,`epLogin`,`cpReg`,`cpAnnounce`,`cpReannounce`,`cpDel`,`cpLogin`,`Maxonline`,`MaxonlineDate`) values ('FLY　论坛','http://www.fly.com/bbs','FLY　作品','http://www.fly.com','shasha73@sina.com','pic/LOGO.GIF',0,1,'','','版权所有：  <a href=http://www.fly.com><font face=Verdana, Arial, Helvetica, sans-serif size=1><b>FLY<font color=#CC0000>.Com</font></b></font></a>','   版本：<a href=http://www.fly.com/bbs>Ver0.1</a>',1,1,100,3,1,5,2,0,2,1,3,1,30,2,1,3,1,1,'2002-06-15 10:29:49'),('FLY　论坛','http://www.fly.com/bbs','FLY　作品','http://www.fly.com','shasha73@sina.com','pic/LOGO.GIF',0,1,'','','版权所有：  <a href=http://www.fly.com><font face=Verdana, Arial, Helvetica, sans-serif size=1><b>FLY<font color=#CC0000>.Com</font></b></font></a>','   版本：<a href=http://www.fly.com/bbs>Ver0.1</a>',1,1,100,3,1,5,2,0,2,1,3,1,30,2,1,3,1,1,'2002-06-15 10:29:49');

/*Table structure for table `friend` */

DROP TABLE IF EXISTS `friend`;

CREATE TABLE `friend` (
  `F_id` int(11) NOT NULL auto_increment,
  `F_username` varchar(50) default NULL,
  `F_friend` varchar(50) default NULL,
  `F_addtime` varchar(19) default NULL,
  KEY `F_id` (`F_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

/*Data for the table `friend` */

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `l_id` int(11) NOT NULL auto_increment,
  `l_username` varchar(50) default NULL,
  `l_content` varchar(50) default NULL,
  `l_url` varchar(255) default NULL,
  `l_addtime` varchar(19) default NULL,
  KEY `l_id` (`l_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

/*Data for the table `log` */

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `sender` varchar(50) default NULL,
  `incept` varchar(50) default NULL,
  `title` varchar(100) default NULL,
  `content` mediumtext,
  `flag` int(11) default '0',
  `sendtime` varchar(19) default NULL,
  `delR` int(11) default '0',
  `delS` int(11) default '0',
  `isSend` int(11) default '0',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

/*Data for the table `message` */

insert  into `message`(`id`,`sender`,`incept`,`title`,`content`,`flag`,`sendtime`,`delR`,`delS`,`isSend`) values (1,'admin','admin','admin','This is test!!!',1,'2008/09/23 13:13:26',0,0,1),(2,'bzc110','admin','message','Messages',1,'2009/02/24 12:20:45',0,0,1),(3,'admin','bzc110','test','test',1,'2009/02/24 12:44:13',0,0,1),(4,'bzc110','admin','keyi','keyi\r\n',1,'2009/02/24 12:44:39',0,0,1),(5,'bzc110','admin','ge','ge',1,'2009/02/24 12:47:43',0,0,1),(6,'bzc110','admin','fefe','fefe',1,'2009/02/24 12:48:31',0,0,1);

/*Table structure for table `online` */

DROP TABLE IF EXISTS `online`;

CREATE TABLE `online` (
  `id` int(4) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL default '',
  `bbstype` int(4) NOT NULL,
  `ip` varchar(50) NOT NULL default '',
  `startime` varchar(30) NOT NULL default '0000-00-00 00:00:00',
  `browser` varchar(100) NOT NULL default '',
  `state` int(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=gbk;

/*Data for the table `online` */

insert  into `online`(`id`,`username`,`bbstype`,`ip`,`startime`,`browser`,`state`) values (59,'游客',0,'127.0.0.1','2009/02/26 11:05:14','index',0),(60,'bzc110',1,'127.0.0.1','2009/02/26 11:55:28','index',0),(19,'游客',0,'127.0.0.1','2009/02/24 12:13:10','index',1),(58,'游客',0,'127.0.0.1','2009/02/26 11:03:55','index',1),(57,'游客',0,'127.0.0.1','2009/02/26 10:53:40','index',1),(56,'游客',0,'127.0.0.1','2009/02/26 10:52:01','index',1),(55,'bzc110',1,'127.0.0.1','2009/02/26 10:46:08','index',1),(54,'bzc110',1,'127.0.0.1','2009/02/26 10:09:52','index',1),(53,'游客',0,'127.0.0.1','2009/02/26 10:08:14','index',1),(52,'游客',0,'127.0.0.1','2009/02/26 10:06:40','index',1),(50,'bzc110',1,'127.0.0.1','2009/02/25 17:23:12','index',0),(51,'游客',0,'127.0.0.1','2009/02/26 09:31:26','index',1),(70,'bzc110',1,'127.0.0.1','2009/02/26 15:07:38','index',1),(69,'bzc110',1,'127.0.0.1','2009/02/26 15:03:40','index',1),(68,'bzc110',1,'127.0.0.1','2009/02/26 14:59:48','index',1),(67,'bzc110',1,'127.0.0.1','2009/02/26 14:58:31','index',1),(66,'bzc110',1,'127.0.0.1','2009/02/26 14:55:29','index',1),(65,'bzc110',1,'127.0.0.1','2009/02/26 14:51:52','index',1),(64,'bzc110',1,'127.0.0.1','2009/02/26 14:44:18','index',1),(43,'admin',10,'127.0.0.1','2009/02/24 17:37:17','index',1),(63,'游客',0,'127.0.0.1','2009/02/26 14:35:42','index',1),(62,'admin',10,'127.0.0.1','2009/02/26 14:08:00','index',1),(47,'bzc110',1,'127.0.0.1','2009/02/24 17:50:53','index',1),(61,'bzc110',1,'127.0.0.1','2009/02/26 11:56:24','index',0);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL auto_increment,
  `UserName` varchar(50) NOT NULL default '',
  `nickName` varchar(50) default NULL,
  `UserEmail` varchar(255) default NULL,
  `Article` int(11) default '0',
  `UserPassword` varchar(11) NOT NULL default '',
  `sign` mediumtext,
  `Sex` varchar(10) default NULL,
  `homepage` varchar(255) default NULL,
  `addDate` varchar(30) default '0000-00-00 00:00:00',
  `logins` int(11) default '0',
  `face` varchar(255) default NULL,
  `width` int(11) default '0',
  `height` int(11) default '0',
  `qq` varchar(50) default NULL,
  `lastlogin` varchar(30) default '0000-00-00 00:00:00',
  `bbstype` int(11) default '0',
  `lockuser` int(11) default '0',
  `userWealth` int(11) default '0',
  `userEP` int(11) default '0',
  `userCP` int(11) default '0',
  PRIMARY KEY  (`UserID`),
  KEY `UserName` (`UserName`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

/*Data for the table `user` */

insert  into `user`(`UserID`,`UserName`,`nickName`,`UserEmail`,`Article`,`UserPassword`,`sign`,`Sex`,`homepage`,`addDate`,`logins`,`face`,`width`,`height`,`qq`,`lastlogin`,`bbstype`,`lockuser`,`userWealth`,`userEP`,`userCP`) values (1,'admin','超级管理員','shasha73@sina.com',6,'admin','','0',NULL,'2008-01-11 08:10:12',5,'pic/Image1.gif',0,0,'350467850','0000-00-00 00:00:00',10,1,1232313,34324,4345),(11,'bzc110','羽風','bzc19850321@163.com',0,'111111','动感地带，我的地盘我做主','1','www.fly.com','2009/02/16 17:13:46',0,'pic/Image1.gif',32,32,'9751506','null',1,1,100,30,0);

/*Table structure for table `vote` */

DROP TABLE IF EXISTS `vote`;

CREATE TABLE `vote` (
  `voteid` int(11) NOT NULL auto_increment,
  `announceid` int(11) NOT NULL default '0',
  `vote` mediumtext NOT NULL,
  `votenum` int(11) NOT NULL,
  `voteuser` mediumtext NOT NULL,
  `votetype` int(30) NOT NULL,
  PRIMARY KEY  (`voteid`),
  KEY `voteid` (`voteid`)
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=gbk;

/*Data for the table `vote` */

insert  into `vote`(`voteid`,`announceid`,`vote`,`votenum`,`voteuser`,`votetype`) values (138,114,'1\r',0,'null',0),(139,114,'2\r',2,'null',0),(140,114,'3\r',1,'null',0),(141,115,'1\r',5,'null',1),(142,115,'2\r',5,'null',1),(143,115,'3\r',8,'null',1),(144,116,' This is test:\r',0,'null',0),(145,116,' a \r',0,'null',0),(146,116,' b \r',0,'null',0),(147,116,'c ',0,'null',0),(148,120,'中国足球!....',2,'null',1),(149,121,'中国足球!....',0,'null',1),(150,122,'中国足球!....',3,'null',1),(151,123,'中国足球!....',1,'null',1),(152,124,'中国足球!....',3,'null',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
