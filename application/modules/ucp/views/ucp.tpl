<div id="ucp-title-and-textbox">
    <div style="text-align: center;">{lang("info_title", "ucp")}</div>
    <div id="ucp-textbox">
        <table width="100%">
            <tr>
                <td width="50%">{lang("last_login", "ucp")}</td>
                <td width="50%">{$last_login}</td>
            </tr>
            <tr>
                <td width="50%">{lang("ip_address", "ucp")}</td>
                <td width="50%">{$ip_address}</td>
            </tr>
            <tr>
                <td width="50%">{lang("char_count", "ucp")}</td>
                <td width="50%">{$char_count}</td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td width="50%">{lang("vp_amount", "ucp")}</td>
                <td width="50%"><span class="gold-number-small">{$vp}</span></td>
            </tr>
            <tr>
                <td width="50%">{lang("pp_amount", "ucp")}</td>
                <td width="50%"><span class="pp-number-small">{$dp}</span></td>
            </tr>
            <tr>
                <td width="50%">{lang("pp_market", "ucp")}</td>
                <td width="50%"><span class="pp-number-small">{$market_pp}</span></td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td colspan="2">{lang("privileges", "ucp")}:</td>
            </tr>
            {foreach from=$privileges item=privilege}
                <tr>
                    <td colspan="2" class="ucp">{$privilege}</td>
                </tr>
            {/foreach}
        </table>
    </div>
</div>
<div id="ucp-title-and-textbox">
    <div style="text-align: center;">{lang("locking_title", "ucp")}</div>
    <div id="ucp-textbox">
        <table width="100%">
            <tr>
                <td colspan="2" style="font-weight: normal;">{lang("locking_description", "ucp")}</td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="lock_account_data"/>
                        {lang("lock_account_data", "ucp")}
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="lock_pp_transfer"/>
                        {lang("lock_pp_transfer", "ucp")}
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="lock_character_transfer"/>
                        {lang("lock_character_transfer", "ucp")}
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="lock_privileges"/>
                        {lang("lock_privileges", "ucp")}
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="lock_premium_services"/>
                        {lang("lock_premium_services", "ucp")}
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="lock_item_market"/>
                        {lang("lock_item_market", "ucp")}
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="lock_pp_market"/>
                        {lang("lock_pp_market", "ucp")}
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="lock_slave_market"/>
                        {lang("lock_slave_market", "ucp")}
                    </label>
                </td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td colspan="2"><center><button type="submit" class="button-normal" style="margin: 0 auto;">{lang("confirm", "ucp")}</button></center></td>
            </tr>
        </table>
    </div>
</div>

<div class="spacer"></div>

<center>
	{if hasPermission('view', "vote") && $config['vote']}
        <a href="{$url}{$config.vote}" class="button-wide" style="margin: 0 2px 5px 2px;">{lang("vote_panel", "ucp")}</a>
	{/if}

	{if hasPermission('view', "donate") && $config['donate']}
        <a href="{$url}{$config.donate}" class="button-wide" style="margin: 0 2px 5px 2px;">{lang("donate_panel", "ucp")}</a>
	{/if}

	{if hasPermission('view', "store") && $config['store']}
        <a href="{$url}{$config.store}" class="button-wide" style="margin: 0 2px 5px 2px;">{lang("item_store", "ucp")}</a>
	{/if}

	{if hasPermission('canUpdateAccountSettings', 'ucp') && $config['settings']}
        <a href="{$url}{$config.settings}" class="button-wide" style="margin: 0 2px 5px 2px;">{lang("account_settings", "ucp")}</a>
	{/if}
</center>

<div class="spacer"></div>
{$characters}