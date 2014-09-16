/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50509
Source Host           : localhost:3306
Source Database       : website

Target Server Type    : MYSQL
Target Server Version : 50509
File Encoding         : 65001

Date: 2013-03-21 14:02:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `appeals`
-- ----------------------------
DROP TABLE IF EXISTS `appeals`;
CREATE TABLE `appeals` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL DEFAULT '',
  `remetent` varchar(1000) NOT NULL DEFAULT '',
  `data` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=508 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of appeals
-- ----------------------------
