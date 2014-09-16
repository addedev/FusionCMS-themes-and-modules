SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


CREATE  TABLE IF NOT EXISTS `lotteries` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `created_by` INT(10) NOT NULL ,
  `end` DATETIME NOT NULL ,
  `rewards` TEXT NULL DEFAULT NULL ,
  `description` TEXT NULL DEFAULT NULL ,
  `winners_count` INT(11) NULL DEFAULT NULL ,
  `finished` INT(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `created` (`created` ASC) ,
  INDEX `end` (`end` ASC) ,
  INDEX `finished` (`finished` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'lotteries sessions';

CREATE  TABLE IF NOT EXISTS `lottery_participants` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `lottery_id` INT(11) NOT NULL ,
  `account_id` INT(20) NOT NULL ,
  `character_guid` INT(20) NOT NULL ,
  `created` DATETIME NOT NULL ,
  `realm_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_lottery_participants_lotteries_idx` (`lottery_id` ASC) ,
  INDEX `account` (`account_id` ASC) ,
  INDEX `character` (`character_guid` ASC) ,
  INDEX `created` (`created` ASC) ,
  INDEX `realm` (`realm_id` ASC) ,
  CONSTRAINT `fk_lottery_participants_lotteries`
    FOREIGN KEY (`lottery_id` )
    REFERENCES `lotteries` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'members subscribed to lottery';

CREATE  TABLE IF NOT EXISTS `lottery_winners` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `lottery_id` INT(11) NOT NULL ,
  `created` DATETIME NULL DEFAULT NULL ,
  `participant_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_lottery_winners_lotteries1_idx` (`lottery_id` ASC) ,
  INDEX `fk_lottery_winners_lottery_participants1_idx` (`participant_id` ASC) ,
  CONSTRAINT `fk_lottery_winners_lotteries1`
    FOREIGN KEY (`lottery_id` )
    REFERENCES `lotteries` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lottery_winners_lottery_participants1`
    FOREIGN KEY (`participant_id` )
    REFERENCES `lottery_participants` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
