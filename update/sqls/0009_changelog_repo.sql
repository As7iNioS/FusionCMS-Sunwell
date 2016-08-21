/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

DROP TABLE IF EXISTS `changelog`;
CREATE TABLE IF NOT EXISTS `changelog` (
	`change_id` int(10) NOT NULL AUTO_INCREMENT,
	`changelog` text NOT NULL,
	`author` varchar(50) NOT NULL,
	`type` int(10) NOT NULL,
	`time` int(10) NOT NULL,
	PRIMARY KEY (`change_id`),
	KEY `FK_changelog_changelog_type` (`type`),
	CONSTRAINT `FK_changelog_changelog_type` FOREIGN KEY (`type`) REFERENCES `changelog_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
INSERT INTO `changelog` (`change_id`, `changelog`, `author`, `type`, `time`) VALUES
	(2, 'Ticket updates - make it compatible with core, also do all things over remote.', 'maczuga', 1, 1469777997),
	(3, 'Fix some problems with PHP 7 - Error class is already defined.<br />\nSome layout fixes.', 'maczuga', 1, 1470332475),
	(6, 'Some cleaning / warning fixes by PHPStorm.', 'maczuga', 1, 1470338733),
	(8, 'Account activation for users.', 'maczuga', 1, 1470374802),
	(9, 'Driver cleanup.', 'maczuga', 1, 1470378381),
	(10, 'Prepared theme folder for sunwell.', 'maczuga', 1, 1470384486),
	(11, 'Remove not needed languages.', 'maczuga', 1, 1470387162),
	(12, 'add images', 'Swiph3l', 1, 1470558844),
	(14, 'main.css rmv sunwell.css', 'Swiph3l', 1, 1470559687),
	(16, 'Remove teleport - it won\'t be needed at all.<br />\nAdd polish language. All entries translated. I was not translating "wow" things.', 'maczuga', 1, 1470680943),
	(17, 'Readd teleport service - I forgot, that sunwell had this with PP charging.', 'maczuga', 1, 1470681314),
	(18, 'Revert default template change.', 'maczuga', 1, 1470716423),
	(20, 'fix menu & delete removing duplicate', 'Swiph3l', 1, 1471067371),
	(21, 'Default language change.', 'maczuga', 1, 1471081546),
	(22, 'Registration fix.', 'maczuga', 1, 1471081713),
	(23, 'Translatable news and pages.', 'maczuga', 1, 1471091640),
	(24, 'Some registration tweaks.', 'maczuga', 1, 1471092861),
	(25, 'Some missed PL translations.', 'maczuga', 1, 1471093611),
	(26, 'Remove any support for expansion change via website.', 'maczuga', 1, 1471094187),
	(27, 'add forum_theme, fix sunwell website theme/admin theme', 'Swiph3l', 1, 1471094326),
	(28, 'delete forum_theme', 'Swiph3l', 1, 1471095784),
	(29, 'server status fix', 'Swiph3l', 1, 1471097308),
	(30, 'Server status finished.<br />\nAllow to connect to auth database via realm (needed for status - uptime).', 'maczuga', 1, 1471110388),
	(31, 'Missed SQL file.', 'maczuga', 1, 1471110433),
	(32, 'Added support for slider titles like on old Sunwell website.', 'maczuga', 1, 1471179067),
	(34, 'Add currently progressed patch to realm config.', 'maczuga', 1, 1471184162),
	(35, 'Add a "future content" check to vote and donation items.', 'maczuga', 1, 1471191099),
	(36, 'Revert 1 config change that went wild on local.', 'maczuga', 1, 1471191206),
	(37, 'css clear + slider fix', 'Swiph3l', 1, 1471286227),
	(38, 'Sunwell assets cleanup.', 'maczuga', 1, 1471287842),
	(39, 'Fit slider to content.', 'maczuga', 1, 1471288231),
	(40, 'Update label, input style to match more like old sunwell, but with better flexibility.<br />\nAdd background for "How to connect" numbers.', 'maczuga', 1, 1471289191),
	(41, 'Login panel reworked. Looks like sunwell one.', 'maczuga', 1, 1471290786),
	(42, 'Fix all warnings in theme CSS file.<br />\nMove max player count back to tooltip.', 'maczuga', 1, 1471423539),
	(43, 'Remove private messaging module from website. Handled by forum.', 'maczuga', 1, 1471440003),
	(44, 'Support for dropdowns from header + admin support.', 'maczuga', 1, 1471444975),
	(46, 'Allow possibility to toggle box and their titles visibility.<br />\nHide last right-panel separator.', 'maczuga', 1, 1471451247),
	(47, 'Reworked slider to look more like sunwell one (without bottom slider).<br />\nMoved page titles for news more to left, and for pages (like info) to right.', 'maczuga', 1, 1471453150),
	(48, 'Disable right links.', 'maczuga', 1, 1471453214),
	(49, 'Some user info rework for signed - mostly buttons. Welp. Only buttons.', 'maczuga', 1, 1471454023),
	(50, 'Remove default themes.<br />\nRemove avatar support from website.', 'maczuga', 1, 1471454740),
	(52, 'More reorganizations.<br />\nMove sunwell slider images into proper place.<br />\nFix translation fields failing at \' and " characters.<br />\nRealmlist font update.<br />\nFix slider description align.<br />\nRemove old sunwell javascripts.', 'maczuga', 1, 1471541881),
	(53, 'Change news format date.<br />\nRemove default news.', 'maczuga', 1, 1471583471),
	(55, 'Update default ajax loading icon.<br />\nUpdate table layout of CMS to match sunwell theme.<br />\nFix "undefined" language in MLI library.<br />\nAdd PvP statistics with translations.', 'maczuga', 1, 1471594861),
	(56, 'Fix MLI for textareas for good :)', 'maczuga', 1, 1471609294),
	(57, 'Add different titles support for error messages. Title = content is pointless.<br />\nFix title alignment for long page titles.', 'maczuga', 1, 1471610090),
	(58, 'Reorganize admin left menu.', 'maczuga', 1, 1471611626),
	(59, 'Add theme screenshot in admin panel preview.', 'maczuga', 1, 1471611815),
	(60, 'Announcement bg update.', 'maczuga', 1, 1471612177),
	(61, 'Dump for some default values.', 'maczuga', 1, 1471617071),
	(62, 'Hide admin panel from curious people. Only staff can see it.', 'maczuga', 1, 1471671855),
	(63, 'Huge condensation of admin panel - now it\'s much easier and comfortable to do stuff.<br />\nMake spacer a generic CSS class.', 'maczuga', 1, 1471675387),
	(64, 'Update changelog:<br />\n* add support for fetching data from repositories.<br />\n* allow repository binding for each changelog category.<br />\n* Huge layout update + security fixes.', 'maczuga', 1, 1471675492),
	(65, 'Added hard check for author in json, as it was sometimes missing, causing notices about not present key.', 'maczuga', 1, 1471676230),
	(67, 'Fix OpenSSL cmake macro for newer versions.', 'maczuga', 2, 1469471000),
	(72, 'SETUP updates.<br />\nFix Non-PCH compilation.', 'maczuga', 2, 1469523500),
	(73, 'Move old SQLs into "OLD" folder.<br />\nAdd active column into accounts - NYI.', 'maczuga', 2, 1469558215),
	(74, 'Fix compilation on VS 2015.<br />\nAdd support for "active" field while logging in to the game.<br />\nFix tools compilation.', 'maczuga', 2, 1469608857),
	(79, 'Remove old non C++11 macros.', 'maczuga', 2, 1469983659),
	(80, 'More code upgrades. Moving toward full C++ 14 support.', 'maczuga', 2, 1470031486),
	(81, 'More compilation fixes for unix.', 'maczuga', 2, 1470303594),
	(82, 'Shit is finally compiling on VPS with non-pch version. We can start doing stuff.', 'maczuga', 2, 1470322428),
	(83, 'Added config with currently "supported" build (patch) version.<br />\n* Ignore those DbErrors - they are not important.<br />\nAdd support for pre 3.3 dungeons quests + visuals.', 'maczuga', 2, 1470637643),
	(84, 'Some new entries for progressing.', 'maczuga', 2, 1470766971),
	(85, 'Premium services.', 'maczuga', 2, 1470767138),
	(88, 'Restore `uptime` table, that was removed by Sunwell.', 'maczuga', 2, 1471110532),
	(89, 'Some TC merges - part 1:<br />\n- Core/Creature: Fix health regeneration. Creatures immediately reset to full health upon reaching home, rather than slowly regaining it over multiple seconds, which allows players to re-engage them at less than max health.<br />\n- Core/Worldstates: move WS_ARENA_DISTRIBUTION_TIME declaration.<br />\n- Core/PvP: Gameobject rotation in BGs and Wintergrasp.<br />\n- Core/Battlegrounds: do not teleport GMs if out of bounds before starting.<br />\n- Core/Ticket System: Ticket comment visual output bug - commenting on a ticket no longer sends the GM\'s name to the ticket handler for assignment.<br />\n- Core/Spell: fix one logic fail when calculating level penalty (remove Xinef comment, as it\'s already in TC).<br />\n- Core/Player: Actually close tickets when characters are deleted - solves issue with tickets being open indefinitely if characters are deleted while tickets are still open.<br />\n- Core/Handlers: actually check allowed trainer classes and races to avoid spoofing.<br />\n- Core/Vehicle: delay position update in Vehicles, this may be deleted on UpdatePosition, generating a crash.<br />\n- Core/Entities: add missing null pointer checks in HandleProcTriggerSpell.<br />\n- Core/AI Prevent bosses respawn when BossState is set to DONE.<br />\n- Core/Entities: Fix flag CREATURE_FLAG_EXTRA_NO_PARRY_HASTEN implementation.<br />\n- Core/Quest: implement usage of QUEST_FLAGS_RAID to allow a quest to be completed while in raid.<br />\n- Core/PacketIO: Fixed crash happening when someone sends too small packet that is processed directly in WorldSocket.<br />\n- Core/Spells: Rewrite Steady Shot damage to deal correct damage when using Heirloom Weapons.<br />\n- Core/Player: Fix ghost players water walking visual bug.<br />\n- Core/Entities: Moved PITCH movement flags into TURNING mask (they do not cause movement in any direction alone, only combined with forward/backward/strafe).<br />\n- Core/Pet: Fix pet at rest distance.<br />\n- Core/Spells: Implement SPELL_ATTR7_INTERRUPT_ONLY_NONPLAYER.<br />\n- Core/Player: Fix duel edge case crash - Fix a crash that could be triggered if an aura removed after duel finished would have caused damage to one of the players.<br />\n- Core/Player: Added support cast spell for some class spells (Warrior\'s Battle Stance and Death Knight\'s Blood Presence) on first login.', 'maczuga', 2, 1471170009),
	(90, 'Some TC merges - part 2:<br />\n- Core/Spells: fix client crash caused by pressing ESC after using spells Neural Needle and Flaming Arrow.<br />\n- Core/Unit Do not allow addition of threat to units in evade mode.<br />\n- Core/Player: apply heirloom stat modifiers before maxing out health/power at level up.<br />\n- Core/World: Remove unused config CONFIG_SIGHT_GUARDER.<br />\n- Core/Quests: Remove wrong call to SendQuestComplete().<br />\n- Core/Movement: enable item use and spell cast when dismounting.<br />\n- Core/Auras: Implemented AURA_INTERRUPT_FLAG_LEAVE_COMBAT.<br />\n- Core/PacketsIO: Send correct messages about server first achievements depending on faction.<br />\n- Core/Spells Make certain spells (e.g. Mind Control) properly flag the caster for PvP<br />\n- Core/Creatures: Fix dead creatures spawn position on restart - Fix dead flying creatures ignoring being spawned below the floor in instances on server restart because of not taking into account vmap height.<br />\n- Core/GameObjects: Fixed an issue where traps were not redirected to Grounding Totem.', 'maczuga', 2, 1471173489),
	(91, 'Add method to allow specific code fragments to work only for specific content duration.', 'maczuga', 2, 1471193536),
	(92, 'Update WotLK instances with pre-neft script. Toggled by itself by config patch value.', 'maczuga', 2, 1471201521),
	(94, 'Too many things happend at 3.3.2 - add it to enumerator.', 'maczuga', 2, 1471202099),
	(95, 'Disable Dampening until it\'s 3.3.2 content.', 'maczuga', 2, 1471202275),
	(96, 'Some TC merges - part 3:<br />\n- DB/Creature: missing spawn creature 40405 Kieupid <Pet Trainer>.<br />\n- Core/Auras: Increase number of auras sent to client except for group updates.<br />\n- Core/Auth: Moved expiring bans to background task - no longer blocking queries during login by default running every minute (configurable).<br />\n- Core/Spell: allow use of ground mounts while swimming. + added check if it\'s 3.1 content and above.<br />\n<br />\nNothing more to merge for now :)', 'maczuga', 2, 1471277297),
	(97, 'Fix stupid vehicle typo from TC port.<br />\nCrash fix for players in instances (from SunwellCore)', 'maczuga', 2, 1471281940),
	(100, 'Disable updating last commit hash if no commits were fetched.', 'maczuga', 1, 1471676878),
	(101, 'add social icons', 'Swiph3l', 1, 1471720912),
	(102, 'Slider - text to chars.<br />\nRemove not needed account variables from CMS.<br />\nArmory - fit to content + button styles.<br />\nUpdate user panel - much more like old sunwell one.<br />\nAdd some missing images from old website.<br />\nUpdate PvP ranking to match its old style.<br />\nMajor cleanups.<br />\nAdd direct links for staff to GM and Admin panel.', 'maczuga', 1, 1471724869);
/*!40000 ALTER TABLE `changelog` ENABLE KEYS */;


DROP TABLE IF EXISTS `changelog_type`;
CREATE TABLE IF NOT EXISTS `changelog_type` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`typeName` varchar(50) DEFAULT NULL,
	`lastCommit` varchar(50) DEFAULT NULL,
	`repoName` varchar(50) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `changelog_type` DISABLE KEYS */;
INSERT INTO `changelog_type` (`id`, `typeName`, `lastCommit`, `repoName`) VALUES
	(1, 'Website', 'dd29c22ff65cf1addbb1d41d5757e8496d0715a9', 'fusioncms-sunwell'),
	(2, 'Game', 'ef567b60d4e4254a329003cbe2ddeee6291517c8', 'sunwellcore');
/*!40000 ALTER TABLE `changelog_type` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
