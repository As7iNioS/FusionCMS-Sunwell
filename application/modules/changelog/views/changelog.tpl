{if $changes}
<div id="changelog">
	{foreach from=$changes key=k item=change_time}
		<table class="nice_table">
			<tr>
				<td><div class="changelog_info">{lang("changes_made_on", "changelog")} {$k}</div></td>
			</tr>
			{foreach from=$change_time key=k_type item=change_type}
				
				<tr>
					<td><a>{htmlspecialchars($k_type)}</a></td>
				</tr>

				{foreach from=$change_type item=change}
					<tr>
						<td>{if hasPermission("canRemoveChange")}<a href="{$url}changelog/remove/{$change.change_id}" style="display:inline !important;margin:0px !important;"><img src="{$url}application/images/icons/delete.png" align="absmiddle" /></a>{/if}{$change.changelog}<br><small>{$change.author}</small></td>
					</tr>
				{/foreach}
				
			{/foreach}
			<div class="spacer"></div>
		</table>
	{/foreach}
</div>
{else}
	<div id="changelog">
		<center style="padding:10px;">{lang("no_changes", "changelog")}</center>
	</div>
{/if}