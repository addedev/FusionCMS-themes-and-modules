/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : homepage

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2013-03-06 20:42:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bugtracker`
-- ----------------------------
DROP TABLE IF EXISTS `bugtracker`;
CREATE TABLE `bugtracker` (
  `report_id` int(10) NOT NULL AUTO_INCREMENT,
  `bugtracker` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `type` int(10) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `FK_bugtracker_bugtracker_type` (`type`),
  CONSTRAINT `FK_bugtracker_bugtracker_type` FOREIGN KEY (`type`) REFERENCES `bugtracker_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='Bug_Reports is being saved here';

-- ----------------------------
-- Records of bugtracker
-- ----------------------------
INSERT INTO `bugtracker` VALUES ('95', 'Test - Bug | If you see this the Bugtracker works fine ! ', 'Incoming', '24', '1362598916');
