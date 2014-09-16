/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : homepage

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2013-03-05 15:44:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `vorschlag`
-- ----------------------------
DROP TABLE IF EXISTS `vorschlag`;
CREATE TABLE `vorschlag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details` text,
  `user_id` int(11) DEFAULT NULL,
  `closed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vorschlag
-- ----------------------------
INSERT INTO `vorschlag` VALUES ('1', 'This is the Test entry. If you see this all works fine ! :) Have fun ', '1', null);
