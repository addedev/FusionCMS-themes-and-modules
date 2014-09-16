/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : homepage

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2013-03-06 20:42:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bugtracker_type`
-- ----------------------------
DROP TABLE IF EXISTS `bugtracker_type`;
CREATE TABLE `bugtracker_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='The type of bugtracker, example: website, ....';

-- ----------------------------
-- Records of bugtracker_type
-- ----------------------------
INSERT INTO `bugtracker_type` VALUES ('24', 'Test-Category');
