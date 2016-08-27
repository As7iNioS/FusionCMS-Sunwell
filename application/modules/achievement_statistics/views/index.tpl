<section id="statistics_wrapper">

    <section id="checkout"></section>

    <section id="statistics">

        <section id="statistics_top">
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
                    <th width="10%" align="center">{lang("rank", "achievement_statistics")}</th>
                    <th width="30%">{lang("character", "achievement_statistics")}</th>
                    <th width="15%" align="center">{lang("level", "achievement_statistics")}</th>
                    <th width="15%" align="center">{lang("race", "achievement_statistics")}</th>
                    <th width="15%" align="center">{lang("class", "achievement_statistics")}</th>
                    <th width="15%" align="center">{lang("points", "achievement_statistics")}</th>
                </tr>

                {if $TopAchievements}
                    {foreach from=$TopAchievements item=character}
                        <tr>
                            <td width="10%" align="center">{$character.rank}</td>
                            <td width="30%"><a data-tip="{lang("view_profile", "achievement_statistics")}"
                                               href="{$url}character/{$selected_realm}/{$character.guid}">{$character.name}</a>
                            </td>
                            <td width="15%" align="center">{$character.level}</td>
                            <td width="15%" align="center"><img
                                        src="{$url}application/images/stats/{$character.race}-{$character.gender}.gif"/>
                            </td>
                            <td width="15%" align="center"><img
                                        src="{$url}application/images/stats/{$character.class}.gif"/></td>
                            <td width="15%" align="center">{$character.achiPoints}&nbsp;<img
                                        src="{$url}application/images/armory/icons/achievement.png" style="max-height: 16px; margin-bottom: -3px;"/></td>
                        </tr>
                    {/foreach}
                {else}
                    <tr>
                        <td colspan="6">
                            <center>{lang("no_players_with_pve_kills", "achievement_statistics")}</center>
                        </td>
                    </tr>
                {/if}
            </table>

        </section>

    </section>
</section>