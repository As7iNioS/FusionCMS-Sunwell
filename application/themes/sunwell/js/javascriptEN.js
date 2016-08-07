




/*
     FILE ARCHIVED ON 18:03:58 sty 4, 2016 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 8:56:14 sie 5, 2016.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
function loaded()
{
	document.getElementById('content-left').style.minHeight = document.getElementById('content-right').clientHeight+200+"px";
	features_timeout_autoswitch = setTimeout('autoswitchfeature()', 10000);

	// temporary promo
	/*features_curr_num = 0;
	if (features_timeout_autoswitch)
		clearTimeout(features_timeout_autoswitch);
	features_timeout_autoswitch = setTimeout('autoswitchfeature()', 22500);*/
}



var features_title = new Array();
var features_text = new Array();
features_title[1] = 'THE MOST COMPLETE WOTLK SERVER'; features_text[1] = 'There are no promises. Everything is already here and available. To learn more, please visit our "Why Sunwell" page in the Information menu. You won\'t be disappointed!';
features_title[2] = 'GREAT PVP'; features_text[2] = 'All character spells and talents working, exceptionally low server-side delay, and much more!&nbsp;&nbsp; Join us and enjoy the WotLK PvP at its best!';
features_title[3] = 'EPIC PVE'; features_text[3] = 'All WotLK instances (raids and dungeons) and nearly all TBC instances have been completely rewritten by us. Every instance in the game is available. Play and feel the difference!';
features_title[4] = 'REGULAR FIXES'; features_text[4] = 'Years of constant development and we are not stopping. With passion and dedication, we have always strived to deliver to you the highest quality possible.';

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

function confirm_form(usluga)
{
	if (typeof usluga !== 'undefined' && usluga == 9) // faction change custom confirmation dialog
	{
		if( confirm("Are you sure you want to do this and everything is correct?") )
			return true;
	}
	else
	{
		if( confirm("Are you sure you want to do this and everything is correct?") )
			return true;
	}
	return false;
}

function refreshRealmStatusCode()
{
	var xmlhttp;
	if (window.XMLHttpRequest)
	{
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("realmstatuscode").innerHTML = xmlhttp.responseText;
		}
	}

	//xmlhttp.open("GET", "getstatuscode.php", true);
	//xmlhttp.send();
	
	setTimeout('refreshRealmStatusCode();', 25*1000);
}
setTimeout('refreshRealmStatusCode();', 0);

function utf8_encode( string )
{
	return unescape( encodeURIComponent( string ) );
}

function DoLogin()
{
	document.getElementById('loginPassword').value = hex_sha1(utf8_encode(document.getElementById('loginUsername').value.toUpperCase()+":"+document.getElementById('loginPassTemp').value.toUpperCase())).toLowerCase();
	document.getElementById('loginPassTemp').value = '';
	return true;
}

function DoRegister()
{
	if (document.getElementById('registerPassTemp1').value != document.getElementById('registerPassTemp2').value)
	{
		alert("Passwords do not match!");
		return false;
	}
	if (document.getElementById('registerPassTemp1').value.length < 6)
	{
		alert("Password is too short! Minimal length is 6 characters.");
		return false;
	}
	if (document.getElementById('registerPassTemp1').value.length > 32)
	{
		alert("Password is too long! Maximal length is 32 characters.");
		return false;
	}

	document.getElementById('registerPassword').value = hex_sha1(utf8_encode(document.getElementById('registerUsername').value.toUpperCase()+":"+document.getElementById('registerPassTemp1').value.toUpperCase())).toLowerCase();
	document.getElementById('registerPassTemp1').value = '';
	document.getElementById('registerPassTemp2').value = '';
	return true;
}

function DoChangeSettings()
{
	if (document.getElementById('settingsNewPassTemp1').value != document.getElementById('settingsNewPassTemp2').value)
	{
		alert("Passwords do not match!");
		return false;
	}
	if (document.getElementById('settingsNewPassTemp1').value.length < 6)
	{
		alert("New password is too short! Minimal length is 6 characters.");
		return false;
	}
	if (document.getElementById('settingsNewPassTemp1').value.length > 32)
	{
		alert("New password is too long! Maximal length is 32 characters.");
		return false;
	}
	
	document.getElementById('settingsOldPassword').value = hex_sha1(utf8_encode(document.getElementById('settingsUsername').value.toUpperCase()+":"+document.getElementById('settingsOldPassTemp').value.toUpperCase())).toLowerCase();
	document.getElementById('settingsOldPassTemp').value = '';
	
	document.getElementById('settingsNewPassword').value = hex_sha1(utf8_encode(document.getElementById('settingsUsername').value.toUpperCase()+":"+document.getElementById('settingsNewPassTemp1').value.toUpperCase())).toLowerCase();
	document.getElementById('settingsNewPassTemp1').value = '';
	document.getElementById('settingsNewPassTemp2').value = '';

	document.getElementById('settingsUsername').value = '';
	return true;
}
