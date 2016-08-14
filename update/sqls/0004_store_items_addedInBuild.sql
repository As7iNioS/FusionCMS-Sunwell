ALTER TABLE `store_items`
	ADD COLUMN `addedInBuild` INT(6) NULL DEFAULT '0' AFTER `tooltip`;
