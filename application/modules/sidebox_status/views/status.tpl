    <center>
            <div id="realmstatuscode">
                <div style="height: 14px;"></div>
                <span class="zalogowany-jako-username" style="font-size: 20px;">Graczy online: 0</span>
{foreach from=$realms item=realm}
                <div class="realm-border" onmouseover="tooltip.show('<CENTER><B>Typ realmu:</B> PvP<BR><B><FONT COLOR=#7dafff>0</FONT></B> vs <B><FONT COLOR=#ff3333>0</FONT></B><BR><B>Rev:</B> 3846<BR><BR></CENTER><B>Exp kill rate:</B> 1x<BR><B>Exp quest rate:</B> 1x<BR><B>Exp exploration rate:</B> 1x<BR><B>Drop rate:</B> 1x<BR><B>Gold rate:</B> 1x<BR><B>Reputation rate:</B> 1x<BR><B>Honor rate:</B> 1x<BR><B>Profession rate:</B> 1x');" onmouseout="tooltip.hide();">
                    {if $realm->isOnline()}
				<img alt="" src="http://new.sunwell.pl/application/themes/sunwell/images/rightpanel/status_up.png" class="realm-status">
			{else}
				<img alt="" src="http://new.sunwell.pl/application/themes/sunwell/images/rightpanel/status_down.png" class="realm-status">
			{/if}
                    
                    <div class="realm-name">{$realm->getName()}</div>
                    <div class="realm-text">Up: 0m <span style="color: darkcyan; font-weight: bold;">&nbsp;|&nbsp;</span> Players: {$realm->getOnline()}
                    </div>
                </div>
	
		<!--
			Other values, for designers:

			$realm->getOnline("horde")
			$realm->getPercentage("horde")

			$realm->getOnline("alliance")
			$realm->getPercentage("alliance")

		-->
{/foreach}
            </div>
 </center>
    
<div id="realmlist">set realmlist {$realmlist}</div>
