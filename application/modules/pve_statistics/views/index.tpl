<section id="statistics_wrapper">

    <input type="hidden" id="realmId" name="realmId" value="{$selected_realm}" />
    <input type="hidden" id="instanceId" name="instanceId" value="{$selected_instance}" />
    <section id="checkout"></section>

    <section id="statistics">

        <section id="statistics_top">
            {if $instances_count > 0}
                    <div style="float: left;">
                        <select style="width: 225px;" id="instance-changer" onchange="return InstanceChange();">
                            <option> --- {lang("drop_pick_instance", "pve_statistics")} --- </option>
                            <option> --- {lang("dungeons", "pve_statistics")} --- </option>
                            {foreach from=$dungeons item=instance key=instanceId}
                                <option value="{$instanceId}"
                                        {if $selected_instance == $instanceId}selected="selected"{/if}>{$instance.name}</option>
                            {/foreach}
                            <option> --- {lang("raids", "pve_statistics")} --- </option>
                            {foreach from=$raids item=instance key=instanceId}
                                <option value="{$instanceId}"
                                        {if $selected_instance == $instanceId}selected="selected"{/if}>{$instance.name}</option>
                            {/foreach}
                        </select>
                    </div>
            {/if}

            {if $realms_count > 0}
                <div style="float: right;">
                    <select style="width: 200px;" id="realm-changer" onchange="return RealmChange();">
                        {foreach from=$realms item=realm key=realmId}
                            <option value="{$realmId}"
                                    {if $selected_realm == $realmId}selected="selected"{/if}>{$realm.name}</option>
                        {/foreach}
                    </select>
                </div>
            {/if}

            <div class="clear"></div>
        </section>

        <div class="spacer"></div>

        <section class="statistics_top_hk" style="display:block;">

            <table id="rankingtable" cellspacing="0" cellpadding="0">
                <tr>
                    <th width="10%" align="center">{lang("rank", "pve_statistics")}</th>
                    <th width="30%">{lang("character", "pve_statistics")}</th>
                    <th width="15%" align="center">{lang("level", "pve_statistics")}</th>
                    <th width="15%" align="center">{lang("race", "pve_statistics")}</th>
                    <th width="15%" align="center">{lang("class", "pve_statistics")}</th>
                    <th width="15%" align="center">{lang("runs", "pve_statistics")}</th>
                </tr>

                {if $TopPvEKills && $selected_instance}
                    {foreach from=$TopPvEKills item=character}
                        <tr>
                            <td width="10%" align="center">{$character.rank}</td>
                            <td width="30%"><a data-tip="{lang("view_profile", "pve_statistics")}"
                                               href="{$url}character/{$selected_realm}/{$character.guid}">{$character.name}</a>
                            </td>
                            <td width="15%" align="center">{$character.level}</td>
                            <td width="15%" align="center"><img
                                        src="{$url}application/images/stats/{$character.race}-{$character.gender}.gif"/>
                            </td>
                            <td width="15%" align="center"><img
                                        src="{$url}application/images/stats/{$character.class}.gif"/></td>
                            <td width="15%" align="center">{$character.kills}</td>
                        </tr>
                    {/foreach}
                {else}
                    <tr>
                        <td colspan="6">
                            <center>{lang("no_players_with_pve_kills", "pve_statistics")}</center>
                        </td>
                    </tr>
                {/if}
            </table>

        </section>

    </section>
</section>