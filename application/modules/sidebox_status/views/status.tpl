<center>
    <div id="realmstatuscode">
        {foreach from=$realms item=realm}
            <div class="realm-border"
                 onmouseover="tooltip.show(
                         '<CENTER><B>Typ realmu:</B> PvP<BR><B><FONT COLOR=#7dafff>{$realm->getOnline("alliance")}</FONT></B> vs <B><FONT COLOR=#ff3333>{$realm->getOnline("horde")}</FONT></B><BR><B>Max graczy:</B> {$realm->getMaxPlayerCount()}<BR><B>Rev:</B> {$realm->getRevision()}<BR><BR></CENTER><B>Exp kill rate:</B> 1x<BR><B>Exp quest rate:</B> 1x<BR><B>Exp exploration rate:</B> 1x<BR><B>Drop rate:</B> 1x<BR><B>Gold rate:</B> 1x<BR><B>Reputation rate:</B> 1x<BR><B>Honor rate:</B> 1x<BR><B>Profession rate:</B> 1x'
                         );"
                 onmouseout="tooltip.hide();">
                {if $realm->isOnline()}
                    <img alt="" src="{$url}application/themes/sunwell/images/rightpanel/status_up.png"
                         class="realm-status">
                {else}
                    <img alt="" src="{$url}application/themes/sunwell/images/rightpanel/status_down.png"
                         class="realm-status">
                {/if}

                <div class="realm-name">{$realm->getName()}</div>
                <div class="realm-text">Up: {$realm->getUptime()} <span style="color: darkcyan; font-weight: bold;">&nbsp;|&nbsp;</span>
                    Graczy: {$realm->getOnline()}<span style="color: darkcyan; font-weight: bold;">
                </div>
            </div>
        {/foreach}
    </div>
</center>

<div id="realmlist">set realmlist {$realmlist}</div>
