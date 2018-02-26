/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.21-log : Database - custom_info
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`custom_info` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `custom_info`;

/*Table structure for table `bill` */

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(10) unsigned NOT NULL COMMENT '合同id',
  `product_id` int(10) unsigned NOT NULL COMMENT '产品id',
  `start_time` datetime NOT NULL COMMENT '接受时间',
  `end_time` datetime DEFAULT NULL COMMENT '完成时间',
  `count` int(10) NOT NULL COMMENT '数量',
  `price` decimal(10,0) NOT NULL COMMENT '价格',
  `total` decimal(10,0) NOT NULL COMMENT '总金额',
  `is_out` tinyint(1) NOT NULL COMMENT '出或进',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bill` */

/*Table structure for table `contract` */

DROP TABLE IF EXISTS `contract`;

CREATE TABLE `contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract` varchar(30) NOT NULL COMMENT '合同名',
  `custom_id` int(10) unsigned NOT NULL COMMENT '客户id',
  `offer` decimal(10,0) NOT NULL COMMENT '报价',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `out_time` datetime DEFAULT NULL COMMENT '出货时间',
  `picture` varchar(30) DEFAULT NULL COMMENT '合同照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contract` */

/*Table structure for table `custom` */

DROP TABLE IF EXISTS `custom`;

CREATE TABLE `custom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '负责人姓名',
  `company` varchar(100) NOT NULL COMMENT '公司名',
  `telephone` varchar(15) NOT NULL COMMENT '联系电话',
  `total` decimal(10,0) NOT NULL COMMENT '总金额',
  `times` int(5) NOT NULL COMMENT '合作次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `custom` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '产品名',
  `model` varchar(100) NOT NULL COMMENT '型号',
  `last_price` decimal(10,0) NOT NULL COMMENT '上一次进价',
  `current_price` decimal(10,0) NOT NULL COMMENT '当前进价',
  `offer` decimal(10,0) NOT NULL COMMENT '参考报价',
  `manufacturer` varchar(100) NOT NULL COMMENT '生产厂家',
  `last_time` datetime NOT NULL COMMENT '最后进货时间',
  `count` int(10) NOT NULL COMMENT '库存',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(10) unsigned NOT NULL COMMENT '合同id',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录时间',
  `remark` varchar(500) NOT NULL COMMENT '备注内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
