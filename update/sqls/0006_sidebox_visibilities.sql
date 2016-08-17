ALTER TABLE `sideboxes`
	ADD COLUMN `boxVisible` TINYINT(1) NOT NULL DEFAULT '1' AFTER `permission`,
	ADD COLUMN `titleVisible` TINYINT(1) NOT NULL DEFAULT '1' AFTER `boxVisible`;
