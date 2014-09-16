SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `lotteries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `created_by` int(10) NOT NULL,
  `end` datetime NOT NULL,
  `rewards` text,
  `description` text,
  `winners_count` int(11) DEFAULT NULL,
  `finished` int(1) DEFAULT NULL,
  `vp` int(11) DEFAULT '0',
  `dp` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `end` (`end`),
  KEY `finished` (`finished`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='lotteries sessions' AUTO_INCREMENT=4 ;

CREATE TABLE IF NOT EXISTS `lottery_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lottery_id` int(11) NOT NULL,
  `account_id` int(20) NOT NULL,
  `character_guid` int(20) NOT NULL,
  `created` datetime NOT NULL,
  `realm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lottery_participants_lotteries_idx` (`lottery_id`),
  KEY `account` (`account_id`),
  KEY `character` (`character_guid`),
  KEY `created` (`created`),
  KEY `realm` (`realm_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='members subscribed to lottery' AUTO_INCREMENT=3 ;

CREATE TABLE IF NOT EXISTS `lottery_winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lottery_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `participant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lottery_winners_lotteries1_idx` (`lottery_id`),
  KEY `fk_lottery_winners_lottery_participants1_idx` (`participant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


ALTER TABLE `lottery_participants`
  ADD CONSTRAINT `fk_lottery_participants_lotteries` FOREIGN KEY (`lottery_id`) REFERENCES `lotteries` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `lottery_winners`
  ADD CONSTRAINT `fk_lottery_winners_lotteries1` FOREIGN KEY (`lottery_id`) REFERENCES `lotteries` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lottery_winners_lottery_participants1` FOREIGN KEY (`participant_id`) REFERENCES `lottery_participants` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
