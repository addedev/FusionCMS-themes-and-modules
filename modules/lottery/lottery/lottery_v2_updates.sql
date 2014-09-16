-- added voting/donation points requirements
ALTER TABLE `lotteries` ADD COLUMN `vp` INT(11) NULL DEFAULT 0  AFTER `finished` , ADD COLUMN `dp` INT(11) NULL DEFAULT 0  AFTER `vp` ;

