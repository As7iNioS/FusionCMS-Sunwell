{$head}
	<body onload="javascript:loaded();">
           
    <div id="lang-en" onclick="setLanguage('english', this)" >EN</div><div id="lang-pl" onclick="setLanguage('polish', this)">PL</div>&nbsp;<br>
<div id="menu">
     {foreach from=$menu_top item=menu_1}
	<div class="menupos">
            <a {$menu_1.link}>{$menu_1.name}</a>
        </div>
    {/foreach}				
</div>
 <!--<div id="menu">
<div class="menupos" style="width: 110px;" onclick="document.location='index.php';"><a href="index.php">Home</a></div>
<div id="menupos-informacje" style="width: 127px;">
Information
<div style="height: 16px;"></div>
<a href="?index.php?id=whysunwell">Why Sunwell</a><br>
<a href="?index.php?id=rules">Rules</a><br>
<a href="?index.php?id=changelog">Changelog</a><br>
<a href="?index.php?id=bugtracker">Bug Tracker</a><br>
<a href="?index.php?id=premium">Premium</a><br>
</div>
<div class="menupos" style="width: 132px;" onclick="document.location='/?index.php?id=howtoplay';"><a href="?index.php?id=howtoplay">How to play</a></div>
<div class="menupos" style="margin-left: 271px; width: 119px;" onclick="document.location='?/armory/';"><a href="?armory/">Armory</a></div>
<div class="menupos" style="width: 109px;" onclick="document.location='?http://www.sunwell.pl/forum/';"><a href="?http://www.sunwell.pl/forum/">Forum</a></div>
<div class="menupos" style="width: 146px;" onclick="document.location='/?index.php?id=ranking';"><a href="?index.php?id=ranking">Ranking</a></div>
</div>-->
<div id="topnav"></div>
<div id="wrapper">
<div id="content-left" style="min-height: 739px;">
<div id="content-righttop"></div>
<div id="wheel"></div>
<div id="slider_wrapper" {if !$show_slider}style="display:none;"{/if}>
	<div id="slider">
		{foreach from=$slider item=image}
			<a href="{$image.link}"><img src="{$image.image}" title="{$image.text}"/></a>
		{/foreach}
	</div>
</div>

{$page}
</div>
<div id="content-right">
<center>
<div id="realmstatuscode">
		<div style="height: 14px;"></div>
		<span class="zalogowany-jako-username" style="font-size: 20px;">Graczy online: 0</span>
		<div class="realm-border" onmouseover="tooltip.show('<CENTER><B>Typ realmu:</B> PvP<BR><B><FONT COLOR=#7dafff>0</FONT></B> vs <B><FONT COLOR=#ff3333>0</FONT></B><BR><B>Rev:</B> 3846<BR><BR></CENTER><B>Exp kill rate:</B> 1x<BR><B>Exp quest rate:</B> 1x<BR><B>Exp exploration rate:</B> 1x<BR><B>Drop rate:</B> 1x<BR><B>Gold rate:</B> 1x<BR><B>Reputation rate:</B> 1x<BR><B>Honor rate:</B> 1x<BR><B>Profession rate:</B> 1x');" onmouseout="tooltip.hide();">
		<img alt="" src="{$path}themes/sunwell/images/rightpanel/status_down.png" class="realm-status">
		<div class="realm-name">Feronis</div>
		<div class="realm-text">Up: 0m <span style="color: darkcyan; font-weight: bold;">&nbsp;|&nbsp;</span> Players: 0 (max 2235)</div></div>
		<div class="realm-border" onmouseover="tooltip.show('<CENTER><B>Typ realmu:</B> PvP<BR><B><FONT COLOR=#7dafff>0</FONT></B> vs <B><FONT COLOR=#ff3333>0</FONT></B><BR><B>Rev:</B> 3890<BR><BR></CENTER><B>Exp kill rate:</B> 20x<BR><B>Exp quest rate:</B> 20x<BR><B>Exp exploration rate:</B> 1x<BR><B>Drop rate:</B> 3x<BR><B>Gold rate:</B> 2x<BR><B>Reputation rate:</B> 2x<BR><B>Honor rate:</B> 2x<BR><B>Profession rate:</B> 2x');" onmouseout="tooltip.hide();">
		<img alt="" src="{$path}themes/sunwell/images/rightpanel/status_down.png" class="realm-status"><div class="realm-name">Stormrage</div>
		<div class="realm-text">Up: 0m <span style="color: darkcyan; font-weight: bold;">&nbsp;|&nbsp;</span> Players: 0 (max 1204)</div>
		</div>	
		</div>
</center>
<div class="right-spacer"></div>
<center>
<!--<form action="?login" method="POST" onsubmit="return DoLogin()">
<span class="field-title-text">Account login:</span><br>
<input type="text" class="field-wide" name="username" id="loginUsername"><br><br>
<span class="field-title-text">Account password:</span><br>
<input type="password" class="field-wide" name="" id="loginPassTemp"><br><br>
<input type="hidden" name="password" id="loginPassword">
<div style="margin: 0px 0px 5px 36px; text-align: left; height: 20px;">
<input type="checkbox" name="remember" style="float: left;"><div style="float: left; margin: -1px 0px 0px 6px; color: rgb(229,195,79);">Remember me!</div>
</div>
<button type="submit" class="button-normal">Log in</button> <button type="button" class="button-normal" style="margin-left: 32px;" onclick="document.location='?index.php?id=register';">Register</button>
</form><div style="height: 30px;"></div>
<a href="?index.php?id=resetpass">Forgotten password? Click here.</a> -->
</center>
	<div class="rightcenter">
            <span class="titleright">Navigation</span>
		<ul>
		{foreach from=$menu_side item=menu_2}
			<li><a {$menu_2.link}>{$menu_2.name}</a></li>
		{/foreach}
                </ul>
	</div>
		<div class="right-spacer"></div>			
	{foreach from=$sideboxes item=sidebox}
	<div class="rightcenter">
           <span class="titleright">{$sidebox.name}</span>
		<div style="padding:5px;">
                    {$sidebox.data}
		</div>
	</div>
                <div class="right-spacer"></div>
        {/foreach}

</div>
<div id="content-right-bottombg"></div>
<div id="content-left-bottombg"></div>
<br style="clear: both;">
</div>
<div id="footer-wrap"><div id="footer">
<img alt="sunwell" src="{$path}themes/sunwell/images/footer/logo_hayalet.png" style="float: left;">
<img alt="sunwell" src="{$path}themes/sunwell/images/footer/logo_small.png" style="float: left; margin: 0px 30px 0px 20px;">
Copyright © Sunwell {date("Y")}. All Rights Reserved.<br>
Wrath of the Lich King, and World of Warcraft and Blizzard Entertainment are trademarks or registered trademarks of Blizzard Entertainment, Inc.<br>
This site is in no way associated with Blizzard Entertainment.
<br>&nbsp;
</div></div>&nbsp;        
		{$modals}

<!--<div id="menu">
<div class="menupos" style="width: 110px;" onclick="document.location='index.php';"><a href="index.php">Home</a></div>
<div id="menupos-informacje" style="width: 127px;">
Information
<div style="height: 16px;"></div>
<a href="?index.php?id=whysunwell">Why Sunwell</a><br>
<a href="?index.php?id=rules">Rules</a><br>
<a href="?index.php?id=changelog">Changelog</a><br>
<a href="?index.php?id=bugtracker">Bug Tracker</a><br>
<a href="?index.php?id=premium">Premium</a><br>
</div>
<div class="menupos" style="width: 132px;" onclick="document.location='/?index.php?id=howtoplay';"><a href="?index.php?id=howtoplay">How to play</a></div>
<div class="menupos" style="margin-left: 271px; width: 119px;" onclick="document.location='?/armory/';"><a href="?armory/">Armory</a></div>
<div class="menupos" style="width: 109px;" onclick="document.location='?http://www.sunwell.pl/forum/';"><a href="?http://www.sunwell.pl/forum/">Forum</a></div>
<div class="menupos" style="width: 146px;" onclick="document.location='/?index.php?id=ranking';"><a href="?index.php?id=ranking">Ranking</a></div>
</div>-->
			
</body>
</html>
