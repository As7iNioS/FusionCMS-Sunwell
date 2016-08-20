<div id="ucp-title-and-textbox">
    <div style="text-align: center;">Informacje</div>
    <div id="ucp-textbox">
        <table width="100%">
            <tr>
                <td width="50%">Ostatnie logowanie</td>
                <td width="50%">{$last_login}</td>
            </tr>
            <tr>
                <td width="50%">Adres IP</td>
                <td width="50%">{$ip_address}</td>
            </tr>
            <tr>
                <td width="50%">Liczba postaci</td>
                <td width="50%">{$char_count}</td>
            </tr>
            <tr>
                <td width="50%">Konto zamrożone</td>
                <td width="50%">{$frozen_status}</td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td width="50%">Ilość VP</td>
                <td width="50%"><span class="gold-number-small">{$vp}</span></td>
            </tr>
            <tr>
                <td width="50%">Ilość PP</td>
                <td width="50%"><span class="pp-number-small">{$dp}</span></td>
            </tr>
            <tr>
                <td width="50%">PP na Bazarze</td>
                <td width="50%"><span class="pp-number-small">{$market_pp}</span></td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td colspan="2">Aktywne przywileje:</td>
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
    <div style="text-align: center;">Locking System</div>
    <div id="ucp-textbox">
        <table width="100%">
            <tr>
                <td colspan="2" style="font-weight: normal;">Wybierz czynności, które mają być <b>zablokowane</b>. Każdorazowa zmiana (także odblokowanie) wymaga potwierdzenia e-mailem.</td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="account_data_change"/>
                        Zmiana danych konta
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="account_data_change"/>
                        Transfer PP
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="account_data_change"/>
                        Przesyłanie postaci
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="account_data_change"/>
                        Dodawanie przywilejów
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="account_data_change"/>
                        Usługi premium
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="account_data_change"/>
                        Kupowanie itemów premium
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="account_data_change"/>
                        Bazar
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: normal;">
                    <label>
                        <input type="checkbox" name="account_data_change"/>
                        Slave market
                    </label>
                </td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td colspan="2"><center><button type="submit" class="button-normal" style="margin: 0 auto;">Zatwierdź</button></center></td>
            </tr>
        </table>
    </div>
</div>

<div class="spacer"></div>

<center>
	{if hasPermission('view', "vote") && $config['vote']}
        <a href="{$url}{$config.vote}" class="button-wide" style="margin: 0 2px 5px 2px;">Vote panel</a>
	{/if}

	{if hasPermission('view', "donate") && $config['donate']}
        <a href="{$url}{$config.donate}" class="button-wide" style="margin: 0 2px 5px 2px;">Donate panel</a>
	{/if}

	{if hasPermission('view', "store") && $config['store']}
        <a href="{$url}{$config.store}" class="button-wide" style="margin: 0 2px 5px 2px;">Item store</a>
	{/if}

	{if hasPermission('canUpdateAccountSettings', 'ucp') && $config['settings']}
        <a href="{$url}{$config.settings}" class="button-wide" style="margin: 0 2px 5px 2px;">Account settings</a>
	{/if}
</center>

<div class="spacer"></div>
{$characters}