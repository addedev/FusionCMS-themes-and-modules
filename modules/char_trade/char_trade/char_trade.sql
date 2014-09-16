DROP TABLE IF EXISTS `char_proposal`;
CREATE TABLE `char_proposal` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `p_char` int(10) NOT NULL DEFAULT '0',
  `s_char` int(10) NOT NULL DEFAULT '0',
  `p_id` int(10) NOT NULL DEFAULT '0',
  `s_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`s_char`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `char_trade_logs`;
CREATE TABLE `char_trade_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Propose_char` int(10) DEFAULT NULL,
  `Seller_char` int(10) DEFAULT NULL,
  `Propose_acc` int(10) DEFAULT NULL,
  `Seller_acc` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `submited_chars`;
CREATE TABLE `submited_chars` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(65) NOT NULL DEFAULT '',
  `level` int(6) DEFAULT NULL,
  `armory` int(4) NOT NULL DEFAULT '0',
  `class` varchar(65) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `s_id` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
