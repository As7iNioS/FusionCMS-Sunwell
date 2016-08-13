{$head}
<body onload="javascript:loaded();">

<div id="lang-en" onclick="setLanguage('english', this)">EN</div>
<div id="lang-pl" onclick="setLanguage('polish', this)">PL</div>
&nbsp;<br>
<div id="menu">
    {foreach from=$menu_top item=menu_1}
        <div class="menupos" onclick="document.location='{$menu_1.linkon}';">
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
<div id="footer-wrap">
    <div id="footer">
        <img alt="sunwell" src="{$path}themes/sunwell/images/footer/logo_hayalet.png" style="float: left;">
        <img alt="sunwell" src="{$path}themes/sunwell/images/footer/logo_small.png"
             style="float: left; margin: 0px 30px 0px 20px;">
        Copyright © Sunwell {date("Y")}. All Rights Reserved.<br>
        Wrath of the Lich King, and World of Warcraft and Blizzard Entertainment are trademarks or registered trademarks
        of Blizzard Entertainment, Inc.<br>
        This site is in no way associated with Blizzard Entertainment.
        <br>&nbsp;
    </div>
</div>
&nbsp;
{$modals}

</body>
</html>
