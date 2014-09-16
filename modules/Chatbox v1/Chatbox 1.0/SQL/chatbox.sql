/*
Navicat MySQL Data Transfer

Source Server         : Testes
Source Server Version : 50509
Source Host           : localhost:3306
Source Database       : fusion

Target Server Type    : MYSQL
Target Server Version : 50509
File Encoding         : 65001

Date: 2013-03-12 16:40:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chatbox`
-- ----------------------------
DROP TABLE IF EXISTS `chatbox`;
CREATE TABLE `chatbox` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL DEFAULT '',
  `name` varchar(1000) NOT NULL DEFAULT '',
  `data` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=522 DEFAULT CHARSET=latin1;

