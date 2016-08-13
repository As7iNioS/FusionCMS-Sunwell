ALTER TABLE `realms`
	ADD COLUMN `auth_database` VARCHAR(255) NULL DEFAULT NULL AFTER `world_database`,
	CHANGE COLUMN `override_hostname_char` `override_hostname_char` VARCHAR(255) NULL DEFAULT NULL AFTER `override_password_char`,
	ADD COLUMN `override_port_auth` INT(11) NULL DEFAULT NULL AFTER `override_hostname_char`,
	ADD COLUMN `override_username_auth` VARCHAR(255) NULL DEFAULT NULL AFTER `override_port_auth`,
	ADD COLUMN `override_password_auth` VARCHAR(255) NULL DEFAULT NULL AFTER `override_username_auth`,
	ADD COLUMN `override_hostname_auth` VARCHAR(255) NULL DEFAULT NULL AFTER `override_password_auth`;
