<section class="sidebox_info">
	<table width="100%">
		<tr>
			<td><img src="{$url}application/images/icons/computer_error.png" align="absmiddle" /> {lang("last_ip", "sidebox_info")}</td>
			<td>{$lastIp}</td>
		</tr>
		<tr>
			<td><img src="{$url}application/images/icons/computer.png" align="absmiddle" /> {lang("current_ip", "sidebox_info")}</td>
			<td>{$currentIp}</td>
		</tr>
		<tr>
			<td><img src="{$url}application/images/icons/lightning.png" align="absmiddle" /> {lang("vp", "sidebox_info")}</td>
			<td id="info_vp">{$vp}</td>
		</tr>
		<tr>
			<td><img src="{$url}application/images/icons/coins.png" align="absmiddle" /> {lang("dp", "sidebox_info")}</td>
			<td id="info_dp">{$dp}</td>
		</tr>
	</table>
	<div style="height: 15px;"></div>
	<button type="button" class="button-normal" onclick="document.location='{$url}ucp';">{lang("user_panel", "sidebox_info")}</button>
	<button type="button" class="button-normal" style="margin-left: 32px;" onclick="document.location='{$url}logout';">{lang("log_out", "sidebox_info")}</button>
</section>