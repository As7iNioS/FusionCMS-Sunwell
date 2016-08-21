ALTER TABLE `account_data`
	DROP COLUMN `location`;
    
ALTER TABLE `account_data`
	CHANGE COLUMN `language` `language` VARCHAR(40) NOT NULL DEFAULT 'english' AFTER `nickname`,
	ADD COLUMN `lock_account_data` TINYINT(1) NOT NULL DEFAULT '0' AFTER `language`,
	ADD COLUMN `lock_pp_transfer` TINYINT(1) NOT NULL DEFAULT '0' AFTER `lock_account_data`,
	ADD COLUMN `lock_character_transfer` TINYINT(1) NOT NULL DEFAULT '0' AFTER `lock_pp_transfer`,
	ADD COLUMN `lock_privileges` TINYINT(1) NOT NULL DEFAULT '0' AFTER `lock_character_transfer`,
	ADD COLUMN `lock_premium_services` TINYINT(1) NOT NULL DEFAULT '0' AFTER `lock_privileges`,
	ADD COLUMN `lock_item_market` TINYINT(1) NOT NULL DEFAULT '0' AFTER `lock_premium_services`,
	ADD COLUMN `lock_pp_market` TINYINT(1) NOT NULL DEFAULT '0' AFTER `lock_item_market`,
	ADD COLUMN `lock_slave_market` TINYINT(1) NOT NULL DEFAULT '0' AFTER `lock_pp_market`;
