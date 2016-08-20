<form onSubmit="Settings.submit(); return false" id="settings" class="page_form">
	<table style="width:90%">
		<tr>
			<td style="width:25% !important"><label for="old_password">{lang("old_password", "ucp")}</label></td>
			<td><input type="password" name="old_password" id="old_password"/></td>
		</tr>
		<tr>
			<td><label for="new_password">{lang("new_password", "ucp")}</label></td>
			<td><input type="password" name="new_password" id="new_password"/></td>
		</tr>
		<tr>
			<td><label for="new_password_confirm">{lang("confirm_password", "ucp")}</label></td>
			<td><input type="password" name="new_password_confirm" id="new_password_confirm"/></td>
		</tr>
	</table>

	<center style="margin-bottom:10px;">
		<div style="height: 15px;"></div>
		<button type="submit" class="button-wide">{lang("change_password", "ucp")}</button>
	</center>

	<div id="settings_ajax" style="text-align:center;padding:10px;"></div>
</form>