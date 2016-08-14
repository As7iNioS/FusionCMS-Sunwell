ALTER TABLE `realms`
	ADD COLUMN `gameBuild` INT(6) NOT NULL DEFAULT '0' AFTER `realmName`;
