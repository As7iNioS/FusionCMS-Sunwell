{$head}
	<body>
		<!--[if lte IE 8]>
			<style type="text/css">
				body {
					background-image:url(images/bg.jpg);
					background-position:top center;
				}
			</style>
		<![endif]-->
<div id="lang-en" onclick="document.location='/?index.php?lang=en';">EN</div><div id="lang-pl" onclick="document.location='/?index.php?lang=pl';">PL</div>&nbsp;<br>
<section id="wrapper">
			{$modals}
			<header id="hand"></header>
                        
			<ul id="top_menu">
				{foreach from=$menu_top item=menu_1}
					<li><a {$menu_1.link}>{$menu_1.name}</a></li>
				{/foreach}
			</ul>

			<div id="main">
				<aside id="left">
                                            
<div id="menu">
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
</div>
<ul id="left_menu">
	{foreach from=$menu_side item=menu_2}
		<li><a {$menu_2.link}><img src="{$image_path}bullet.png">{$menu_2.name}</a></li>
	{/foreach}
</ul>

					{foreach from=$sideboxes item=sidebox}
						<article>
							<h1 class="top">{$sidebox.name}</h1>
							<section class="body">
								{$sidebox.data}
							</section>
						</article>
					{/foreach}
				</aside>

				<aside id="right">
					<section id="slider_bg" {if !$show_slider}style="display:none;"{/if}>
						<div id="slider">
							{foreach from=$slider item=image}
								<a href="{$image.link}"><img src="{$image.image}" title="{$image.text}"/></a>
							{/foreach}
						</div>
					</section>

					{$page}
				</aside>

				<div class="clear"></div>
			</div>
			<footer>
				<a href="http://www.fusion-hub.com" id="logo" target="_blank"></a>
				<p>&copy; Copyright {date("Y")} {$serverName}</p>
			</footer>
		</section>
	</body>
</html>