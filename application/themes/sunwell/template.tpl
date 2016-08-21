{$head}
<body>

<script type="text/javascript">
    function setLanguage(language)
    {
        $.get(Config.URL + "sidebox_language_picker/language_picker/set/" + language, function()
        {
            window.location.reload(true);
        });
    }
</script>
<a href="https://www.facebook.com/SunwellProject/" target="_blank" class="social fb"></a>
<a href="https://www.youtube.com/channel/UCk6wF4KhrLM24vV1qTXb31Q" target="_blank" class="social yt"></a>
<a href="http://new.sunwell.pl/news/rss" target="_blank" class="social rss"></a>
<div id="lang-en" onclick="setLanguage('english', this)">EN</div>
<div id="lang-pl" onclick="setLanguage('polish', this)">PL</div>
&nbsp;<br>
<div id="menu">
    {foreach from=$menu_top item=menu_1}
        {if $menu_1.childCount > 0}
            <div class="menupos menupos-dropdown">
                {$menu_1.name}
                <ul>
                    {foreach from=$menu_1.children item=menu_1_child}
                        <li onclick="document.location='{$menu_1_child.linkon}';"><a {$menu_1_child.link}>{$menu_1_child.name}</a></li>
                    {/foreach}
                </ul>
            </div>
        {else}
            <a class="menupos" {$menu_1.link}>
                {$menu_1.name}
            </a>
        {/if}
    {/foreach}
</div>
<div id="topnav"></div>
<div id="wrapper">
    <div id="content-left" style="min-height: 925px;">
        <div id="content-righttop"></div>
        <div id="wheel"></div>
        <div id="slider_wrapper" {if !$show_slider}style="display:none;"{/if}>
            <div id="features">
                <div id="slider">
                    {foreach from=$slider item=image}
                        <a href="{$image.link}"><img src="{$image.image}" title="<a id='features-title' href='{$image.link}'>{htmlspecialchars($image.title)}</a><br><p id='features-text'>{htmlspecialchars($image.text)}</p>"/></a>
                    {/foreach}
                </div>
            </div>
        </div>

        {$page}
    </div>
    <div id="content-right">
        {*<div class="rightcenter">*}
            {*<span class="titleright">Navigation</span>*}
            {*<ul>*}
                {*{foreach from=$menu_side item=menu_2}*}
                    {*<li><a {$menu_2.link}>{$menu_2.name}</a></li>*}
                {*{/foreach}*}
            {*</ul>*}
        {*</div>*}
        {*<div class="right-spacer"></div>*}
        {foreach from=$sideboxes item=sidebox}
            {if $sidebox.boxVisible}
            <div class="rightcenter">
                {if $sidebox.titleVisible}<span class="titleright">{$sidebox.name}</span>{/if}
                <div style="padding: 5px 5px 0;">
                    {$sidebox.data}
                </div>
            </div>
            <div class="right-spacer"></div>
            {/if}
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
