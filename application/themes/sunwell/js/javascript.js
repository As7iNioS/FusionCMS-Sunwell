




/*
     FILE ARCHIVED ON 5:26:35 paź 4, 2011 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 8:43:24 sie 5, 2016.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
function loaded()
{
	document.getElementById('content-left').style.minHeight = document.getElementById('content-right').clientHeight+200+"px";
	features_timeout_autoswitch = setTimeout('autoswitchfeature()', 10000);

	// icc promo
	features_curr_num = 0;
	if (features_timeout_autoswitch)
		clearTimeout(features_timeout_autoswitch);
	features_timeout_autoswitch = setTimeout('autoswitchfeature()', 20000);
}



var features_title = new Array();
var features_text = new Array();
features_title[1] = 'EPICKIE PVP'; features_text[1] = 'Wszystkie działające spelle klasowe i talenty! Tylko u nas możesz grać na tak wysokim poziomie, który jest efektem wieloletniej pracy doświadczonej ekipy.';
features_title[2] = 'ŚWIETNE PVE'; features_text[2] = 'Wszystkie dostępne instancje WotLK (aż do Trial of the Crusader włącznie), w tym 5-many, są napisane w całości przez nas. Zagraj, a zobaczysz różnicę!';
features_title[3] = 'CODZIENNE POPRAWKI'; features_text[3] = 'Codziennie poprawiamy błędy, dzięki czemu u nas działa to, co u innych nie będzie działało jeszcze przez lata! Lista wprowadzanych przez nas zmian jest widoczna w changelogu.';
features_title[4] = 'PANEL GRACZA'; features_text[4] = 'Rozbudowany panel gracza jest dostępny dla każdego. Zmiana ustawień, odblokowywanie postaci, system zabezpieczający Twoje konto i wiele więcej!';

var features_curr_num = 1;
var features_timeout_autoswitch;
var features_timeout_blink;
var features_blink_value = 0;
var features_newsrc = "";
var features_newtitle = "";
var features_newtext = "";

function autoswitchfeature()
{
	var next_num = features_curr_num+1;
	if (next_num > 4)
		next_num = 1;
	switchfeature(next_num);
}

function switchfeature(num)
{
	if (features_curr_num != num)
	{
		features_newsrc = "img/features/b"+num+".jpg";
		features_newtitle = features_title[num];
		features_newtext = features_text[num];
		features_curr_num = num;
		for (var i=1; i<=4; ++i)
		{
			if (num == i)
				document.getElementById('fframe'+i).className = "features-smallimg-active";
			else
				document.getElementById('fframe'+i).className = "features-smallimg-inactive";
		}
		if (features_timeout_blink)
		{
			if (features_blink_value <= 100)
				features_blink_value -= 4;
			else
				features_blink_value = 200-features_blink_value;
		}
		else
			featureoverlayupdate();
	}
	
	if (features_timeout_autoswitch)
		clearTimeout(features_timeout_autoswitch);
	features_timeout_autoswitch = setTimeout('autoswitchfeature()', 10000);
}

function featureoverlayupdate()
{
	var opercent;
	features_blink_value += 4;
	if (features_blink_value < 100)
		opercent = features_blink_value;
	else if (features_blink_value == 100)
	{
		opercent = 100;
		document.getElementById('features-img').src = features_newsrc;
		document.getElementById('features-title').innerHTML = features_newtitle;
		document.getElementById('features-text').innerHTML = features_newtext;
	}
	else if (features_blink_value < 200)
		opercent = 200-features_blink_value;
	else
	{
		features_blink_value = 0;
		features_timeout_blink = 0;
		opercent = features_blink_value;
	}
	document.getElementById('features-overlay').style.backgroundColor = 'rgba(0,0,0,'+(opercent/100)+')';
	if (features_blink_value)
		features_timeout_blink = setTimeout('featureoverlayupdate()', 10);
}



var premium_menu_tab = false;
var premium_menu_content = false;

function updatepremiummenuvisibility()
{
	var o = document.getElementById('ucp-premium-menu');
	if (premium_menu_tab || premium_menu_content)
		o.style.display = 'block';
	else
		o.style.display = 'none';
}

function premium_menu_tab_over()
{
	premium_menu_tab = true;
	updatepremiummenuvisibility();
}
function premium_menu_tab_out()
{
	premium_menu_tab = false;
	setTimeout('updatepremiummenuvisibility();', 100);
}
function premium_menu_container_over()
{
	premium_menu_content = true;
	updatepremiummenuvisibility();
}
function premium_menu_container_out()
{
	premium_menu_content = false;
	setTimeout('updatepremiummenuvisibility();', 100);
}

function confirm_form()
{
	if( confirm("Czy jesteś pewien, że chcesz to zrobić i wszystkie dane są poprawne?") )
		return true;
	return false;
}