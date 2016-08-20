{form_open('login')}
	<center id="sidebox_login">
        <label for="login_username">{lang("username", "sidebox_info_login")}:</label>
		<input type="text" name="login_username" id="login_username">
        <div style="height: 15px;"></div>
        <label for="login_password">{lang("password", "sidebox_info_login")}:</label>
		<input type="password" name="login_password" id="login_password">
        <div style="height: 15px;"></div>
		<div style="margin: 0 0 5px 22px; text-align: left; height: 20px;">
            <label for="login_remember" style="margin-left: 5px;">{lang("remember_me", "sidebox_info_login")}</label><input type="checkbox" name="login_remember" id="login_remember" style="float: left;">
		</div>
		<button class="button-normal" type="submit" name="login_submit">{lang("log_in", "sidebox_info_login")}</button>
		<a class="button-normal" style="margin-left: 32px;" href="{$url}register">{lang("register", "sidebox_info_login")}</a>
        <div style="height: 30px;"></div>
        <a href="{$url}password_recovery">{lang("forgot_password_link", "sidebox_info_login")}</a>
	</center>
</form>