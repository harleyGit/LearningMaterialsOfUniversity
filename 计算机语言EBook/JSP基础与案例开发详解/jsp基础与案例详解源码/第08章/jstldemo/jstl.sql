create database if not exists `person`;
USE `person`;
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(8) default NULL,
  `name` varchar(30) default NULL,
  `age` int(8) default NULL,
  `intro` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert  into `userinfo`(`id`,`name`,`age`,`intro`) 
values (1,'zxx',23,'1111'),(2,'zah',32,'22222'),(3,'xmh',32,'3333');