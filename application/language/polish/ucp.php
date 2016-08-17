<?php

/**
 * Note to module developers:
 * 	Keeping a module specific language file like this
 *	in this external folder is not a good practise for
 *	portability - I do not advice you to do this for
 *	your own modules since they are non-default.
 *	Instead, simply put your language files in
 *	application/modules/yourModule/language/
 *	You do not need to change any code, the system
 *	will automatically look in that folder too.
 */

// UCP
$lang['user_panel'] = "Panel użytkownika";
$lang['nickname'] = "Nick";
$lang['location'] = "Lokalizacja";
$lang['account_rank'] = "Ranga konta";
$lang['voting_points'] = "Punkty głosowania";
$lang['donation_points'] = "Punkty premium";
$lang['account_status'] = "Stan konta";
$lang['member_since'] = "Zarejestrowany od";

// Settings
$lang['settings'] = "Ustawienia konta";

$lang['nickname_error'] = "Nick musi mieć od 4 do 14 znaków i może zawierać jedynie litery i cyfry";
$lang['location_error'] = "Lokalizacja może mieć do 32 znaków i zawierać jedynie litery";
$lang['pw_doesnt_match'] = "Hasła nie pasują do siebie!";
$lang['changes_saved'] = "Zmiany zostały zapisane!";
$lang['invalid_pw'] = "Nieprawidłowe hasło!";
$lang['nickname_taken'] = "Nick jest już zajęty";
$lang['invalid_language'] = "Nieprawidłowy język";

/**
 * Only translate these if World of Warcraft does it themselves,
 * otherwise you'll confuse people who expect to see them in English
 */
$lang['tbc'] = "The Burning Crusade";
$lang['wotlk'] = "Wrath of The Lich King";
$lang['cataclysm'] = "Cataclysm";
$lang['mop'] = "Mists of Pandaria";