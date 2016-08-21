<center>

    <div id="realmstatuscode">
        {foreach from=$realms item=realm}
            <div class="realm-border"
                 onmouseover="tooltip.show(
                         '<CENTER><B>{lang("realm_type", "sidebox_status")}:</B> PvP<BR><B><FONT COLOR=#7dafff>{$realm->getOnline("alliance")}</FONT></B> vs <B><FONT COLOR=#ff3333>{$realm->getOnline("horde")}</FONT></B><BR><B>{lang("max_players", "sidebox_status")}:</B> {$realm->getMaxPlayerCount()}<BR><B>{lang("revision", "sidebox_status")}:</B> {$realm->getRevision()}<BR><BR></CENTER><B>{lang("rate_xp_kill", "sidebox_status")}:</B> 1x<BR><B>{lang("rate_xp_quest", "sidebox_status")}:</B> 1x<BR><B>{lang("rate_xp_exploration", "sidebox_status")}:</B> 1x<BR><B>{lang("rate_drop", "sidebox_status")}:</B> 1x<BR><B>{lang("rate_gold", "sidebox_status")}:</B> 1x<BR><B>{lang("rate_reputation", "sidebox_status")}:</B> 1x<BR><B>{lang("rate_honor", "sidebox_status")}:</B> 1x<BR><B>{lang("rate_profession", "sidebox_status")}:</B> 1x'
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
                <div class="realm-text">{lang("uptime", "sidebox_status")}: {$realm->getUptime()} <span style="color: darkcyan; font-weight: bold;">&nbsp;|&nbsp;</span>
                    {lang("players", "sidebox_status")}: {$realm->getOnline()}<span style="color: darkcyan; font-weight: bold;">
                </div>
            </div>
        {/foreach}
    </div>
</center>

<div id="realmlist">set realmlist {$realmlist}</div>
