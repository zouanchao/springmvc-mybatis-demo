/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.13-log : Database - db_spring
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_spring` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_spring`;

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `user_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `salt` varchar(100) NOT NULL COMMENT '盐值',
  `user_number` varchar(100) DEFAULT NULL COMMENT '工号',
  `real_name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` varchar(10) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `is_delete` varchar(10) NOT NULL DEFAULT 'N' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_username` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`user_name`,`password`,`salt`,`user_number`,`real_name`,`email`,`phone`,`mobile`,`user_type`,`photo`,`login_ip`,`login_date`,`login_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`is_delete`) values ('06686d8125b142fa8eef3b8f3363baf3','605a5f1150714ee9be51d2d6bf53a715','18f835189ad44d649f62e3ddc01d56d4','liming','5e26af598049743433ae76df2b3c1040a42ba1ac','limingf761c8fb7a0e6a2c34f7b82304cb1ccb','058697584','黎明','initemail@email.com','13512695869','13214621359','A',NULL,NULL,NULL,NULL,'-1','2017-01-17 09:42:52','-1','2017-01-17 09:42:52','知名演员','N'),('245b026ceec9490b84d5b666aebebfed','a5738de0cb0d456ca50d6df3e8631c70','3bf4d21c8e39474699b5106a52ba711f','zhaoliu','a5833940d85b49e783ff3681e983facc2d07f47d','zhaoliu0af78b65024b0837b48a3fb8b07ffcba','058697584','赵六','initemail@email.com','13512695869','13214621359','A',NULL,NULL,NULL,NULL,'-1','2017-01-17 09:42:18','-1','2017-01-17 09:42:18','地产大亨','N'),('3338817ab4d6413784c7cfa6c9ca07bf','01f39f2677ce4903b083dea38585cd03','e037088c907e4a1a9c52598a95a4ad70','wanglaowu','32c175b8628bdb086a9f38244d9980f0f2b5354f','wanglaowua50f5b0304b82f4fec9d4b306782a2df','058697584','王老五','initemail@email.com','13512695869','13214621359','A',NULL,NULL,NULL,NULL,'-1','2017-01-17 09:40:18','-1','2017-01-17 09:40:18','砖石王老五','N'),('5441907ec9c94c58bc6324463f6121af','f0990f0b94834fbb993ad9943db579eb','f9cc9b9145bb41299d85ee93c5fc7fd4','guest','a1abf34bed5148b28da381964f4de0701963e601','guestd4e1e39ef442abc49f2d3f68efce0162','058697584','系统管理员','initemail@email.com','13512695869','13214621359','A',NULL,NULL,NULL,NULL,'-1','2017-01-16 16:52:54','-1','2017-01-16 16:52:54','系统管理员','N'),('6b78a4d3c7634edabf9045c2da6587cf','e60336524dba43fdb93b53a9cfefb2a3','b4f3a08f92184b289248d933807f22aa','lisi','87c1f28349e750500dded44d2be5144c39088581','lisi15098cc93fdd443c1ffd6d6cb274e83b','058697584','李四','initemail@email.com','13512695869','13214621359','A',NULL,NULL,NULL,NULL,'-1','2017-01-17 09:41:53','-1','2017-01-17 09:41:53','地产大亨','N'),('c8ce626fd28d460299ee16571da29234','c682932df5614768940d95919cfd86ea','af79740fd92040df8715c1a177f56d6a','yaoming','1836bc085d4a58b642924b97129e17797112faa1','yaoming5f46f4c94171be4183460644cac07c14','058697584','姚明','initemail@email.com','13512695869','13214621359','A',NULL,NULL,NULL,NULL,'-1','2017-01-17 09:47:08','-1','2017-01-17 09:47:08','篮球高手','N'),('f940bc9df0ea4ae1ab60cf96982edbf9','9fdc8320867640c39d1f99927188abb1','690357e5100140509112e63ab206edf5','admin','9f7f661b201216d243ebaab176aafe07f78970de','admin40f7fa2a7225c07d2f8593f9d6c10bfc','058697584','系统管理员','initemail@email.com','13512695869','13214621359','A',NULL,NULL,NULL,NULL,'-1','2017-01-16 16:54:52','-1','2017-01-18 16:54:52','系统管理员','N');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
