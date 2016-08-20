<section id="statistics_wrapper">

    <section id="checkout"></section>

    <section id="statistics">

        {if $realms_count > 1}
        <section id="statistics_top">
            <section id="statistics_realms">
                <div style="float: right;">
                    <select style="width: 200px;" id="realm-changer" onchange="return RealmChange();">
                        {foreach from=$realms item=realm key=realmId}
                            <option value="{$realmId}"
                                    {if $selected_realm == $realmId}selected="selected"{/if}>{$realm.name}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="clear"></div>
            </section>

            <div class="clear"></div>
        </section>
        {/if}

        <section id="statistics_top_arena_teams">

            <div class="statistics_arena_box">
                <div class="statistics_arena_head">2v2</div>
                {if $Teams2}
                    {foreach from=$Teams2 key=key item=team}
                        <div class="statistics_arena_item">
                            <div id="rank">{$key + 1}</div>
                            <div id="stats">
                                <span id="team-name">{$team.name}</span><br/>
                                <span id="team-rating">{lang("rating", "pvp_statistics")}: {$team.rating}</span><br/>
                                <div id="team-members">
                                    {if $team.members}
                                        {foreach from=$team.members key=key item=member}
                                            <a href="{$url}character/{$selected_realm}/{$member.guid}"
                                               data-tip="<font style='font-weight: bold;'>{$member.name}</font><br />{lang("games_played", "pvp_statistics")}: {$member.games}<br />{lang("games_won", "pvp_statistics")}: {$member.wins}<br />{lang("personal_rating", "pvp_statistics")}: {$member.rating}"
                                               id="team-member">
                                                <img src='{$url}application/images/stats/{$member.class}.gif'
                                                     align='absbottom'/>
                                            </a>
                                        {/foreach}
                                    {/if}
                                    <div class="clear"></div>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    {/foreach}
                {else}
                    <div class="statistics_arena_item">
                        <br/>{lang("no_2v2_teams", "pvp_statistics")}<br/><br/>
                    </div>
                {/if}
            </div>

            <div class="statistics_arena_box">
                <div class="statistics_arena_head">3v3</div>
                {if $Teams3}
                    {foreach from=$Teams3 key=key item=team}
                        <div class="statistics_arena_item">
                            <div id="rank">{$key + 1}</div>
                            <div id="stats">
                                <span id="team-name">{$team.name}</span><br/>
                                <span id="team-rating">{lang("rating", "pvp_statistics")}: {$team.rating}</span><br/>
                                <div id="team-members">
                                    {if $team.members}
                                        {foreach from=$team.members key=key item=member}
                                            <a href="{$url}character/{$selected_realm}/{$member.guid}"
                                               data-tip="<font style='font-weight: bold;'>{$member.name}</font><br />{lang("games_played", "pvp_statistics")}: {$member.games}<br />{lang("games_won", "pvp_statistics")}: {$member.wins}<br />{lang("personal_rating", "pvp_statistics")}: {$member.rating}"
                                               id="team-member">
                                                <img src='{$url}application/images/stats/{$member.class}.gif'
                                                     align='absbottom'/>
                                            </a>
                                        {/foreach}
                                    {/if}
                                    <div class="clear"></div>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    {/foreach}
                {else}
                    <div class="statistics_arena_item">
                        <br/>{lang("no_3v3_teams", "pvp_statistics")}<br/><br/>
                    </div>
                {/if}
            </div>

            <div class="statistics_arena_box" style="margin-right: 0;">
                <div class="statistics_arena_head">5v5</div>
                {if $Teams5}
                    {foreach from=$Teams5 key=key item=team}
                        <div class="statistics_arena_item">
                            <div id="rank">{$key + 1}</div>
                            <div id="stats">
                                <span id="team-name">{$team.name}</span><br/>
                                <span id="team-rating">{lang("rating", "pvp_statistics")}: {$team.rating}</span><br/>
                                <div id="team-members">
                                    {if $team.members}
                                        {foreach from=$team.members key=key item=member}
                                            <a href="{$url}character/{$selected_realm}/{$member.guid}"
                                               data-tip="<font style='font-weight: bold;'>{$member.name}</font><br />{lang("games_played", "pvp_statistics")}: {$member.games}<br />{lang("games_won", "pvp_statistics")}: {$member.wins}<br />{lang("personal_rating", "pvp_statistics")}: {$member.rating}"
                                               id="team-member">
                                                <img src='{$url}application/images/stats/{$member.class}.gif'
                                                     align='absbottom'/>
                                            </a>
                                        {/foreach}
                                    {/if}
                                    <div class="clear"></div>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    {/foreach}
                {else}
                    <div class="statistics_arena_item">
                        <br/>{lang("no_5v5_teams", "pvp_statistics")}<br/><br/>
                    </div>
                {/if}
            </div>

            <div class="clear"></div>
        </section>

        <div class="spacer"></div>

        <section class="statistics_top_hk" style="display:block;">

            <table id="rankingtable" cellspacing="0" cellpadding="0">
                <tr>
                    <th width="10%" align="center">{lang("rank", "pvp_statistics")}</th>
                    <th width="15%" align="center">{lang("kills", "pvp_statistics")}</th>
                    <th width="30%">{lang("character", "pvp_statistics")}</th>
                    <th width="15%" align="center">{lang("level", "pvp_statistics")}</th>
                    <th width="15%" align="center">{lang("race", "pvp_statistics")}</th>
                    <th width="15%" align="center">{lang("class", "pvp_statistics")}</th>
                </tr>

                {if $TopHK}
                    {foreach from=$TopHK item=character}
                        <tr>
                            <td width="10%" align="center">{$character.rank}</td>
                            <td width="15%" align="center">{$character.kills}</td>
                            <td width="30%"><a data-tip="{lang("view_profile", "pvp_statistics")}"
                                               href="{$url}character/{$selected_realm}/{$character.guid}">{$character.name}</a>
                            </td>
                            <td width="15%" align="center">{$character.level}</td>
                            <td width="15%" align="center"><img
                                        src="{$url}application/images/stats/{$character.race}-{$character.gender}.gif"/>
                            </td>
                            <td width="15%" align="center"><img
                                        src="{$url}application/images/stats/{$character.class}.gif"/></td>
                        </tr>
                    {/foreach}
                {else}
                    <tr>
                        <td colspan="6">
                            <center>{lang("no_players_with_hk", "pvp_statistics")}</center>
                        </td>
                    </tr>
                {/if}
            </table>

        </section>

    </section>
</section>