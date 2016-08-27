/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Zrzut struktury tabela sunwell_website.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text,
  `link` varchar(255) DEFAULT '#',
  `side` varchar(255) DEFAULT 'top',
  `rank` int(11) NOT NULL,
  `specific_rank` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  `direct_link` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is it a direct link or not? is needed for the ajax.',
  `permission` varchar(50) DEFAULT NULL,
  `idParent` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_menu_ranks` (`rank`),
  CONSTRAINT `FK_menu_ranks` FOREIGN KEY (`rank`) REFERENCES `ranks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- Zrzucanie danych dla tabeli sunwell_website.menu: ~17 rows (około)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `name`, `link`, `side`, `rank`, `specific_rank`, `order`, `direct_link`, `permission`, `idParent`) VALUES
  (1, '{"polish":"Newsy","english":"Home"}', 'news', 'top', 1, 0, 1, 0, NULL, 0),
  (3, '{"english":"How to play","polish":"Jak zagrać"}', 'page/connect', 'top', 1, 0, 3, 0, NULL, 0),
  (4, 'Forum', 'forum', 'top', 1, 0, 8, 0, NULL, 0),
  (13, 'User panel', 'ucp', 'side', 2, 0, 19, 0, '13', 0),
  (18, 'Armory', 'armory', 'side', 1, 0, 100, 0, NULL, 0),
  (20, '{"english":"Why Sunwell","polish":"Dlaczego my"}', 'page/whysunwell', 'top', 1, 0, 1, 0, NULL, 102),
  (21, 'Admin panel', 'admin', 'side', 5, 0, 21, 0, '21', 0),
  (100, 'Log out', 'logout', 'side', 2, 0, 104, 0, '100', 0),
  (102, '{"english":"Information","polish":"Informacje"}', '#', 'top', 1, 0, 2, 0, NULL, 0),
  (103, '{"english":"Armory","polish":"Armory"}', 'armory', 'top', 1, 0, 4, 0, NULL, 0),
  (104, '{"english":"Rankings","polish":"Rankingi"}', '#', 'top', 1, 0, 10, 0, NULL, 0),
  (105, '{"english":"Regulamin"}', 'page/rules', 'top', 1, 0, 2, 0, NULL, 102),
  (106, '{"english":"Changelog"}', 'changelog', 'top', 1, 0, 3, 0, NULL, 102),
  (107, '{"english":"Bugtracker"}', 'bugtracker', 'top', 1, 0, 4, 0, NULL, 102),
  (108, '{"english":"Premium","polish":"Premium"}', 'page/premium', 'top', 1, 0, 108, 0, NULL, 102),
  (109, '{"english":"Achievements","polish":"Odznaczenia"}', 'achievement_statistics', 'top', 1, 0, 1, 0, NULL, 104),
  (109, '{"english":"PvP"}', 'pvp_statistics', 'top', 1, 0, 2, 0, NULL, 104),
  (110, '{"english":"PvE"}', 'pve_statistics', 'top', 1, 0, 3, 0, NULL, 104);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
