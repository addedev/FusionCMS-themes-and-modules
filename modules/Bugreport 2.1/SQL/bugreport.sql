/*
Navicat MySQL Data Transfer

Source Server         : Testes
Source Server Version : 50509
Source Host           : localhost:3306
Source Database       : fusion

Target Server Type    : MYSQL
Target Server Version : 50509
File Encoding         : 65001

Date: 2013-03-11 15:15:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bugreport`
-- ----------------------------
DROP TABLE IF EXISTS `bugreport`;
CREATE TABLE `bugreport` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bug` varchar(1000) NOT NULL DEFAULT '',
  `remetent` varchar(1000) NOT NULL DEFAULT '',
  `data` varchar(1000) NOT NULL DEFAULT '',
  `status` int(4) NOT NULL,
  `priority` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=499 DEFAULT CHARSET=latin1;

