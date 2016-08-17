ALTER TABLE `menu`
	ADD COLUMN `idParent` INT(10) NOT NULL DEFAULT '0' AFTER `permission`;
