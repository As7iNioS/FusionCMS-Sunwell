<section class="sidebox_info">
    <span class="zalogowany-jako-username">{lang("welcome", "sidebox_info_login")}, {$login}!</span>
    <center>
        <a class="button-normal" href="{$url}ucp">{lang("user_panel", "sidebox_info_login")}</a>
        <a class="button-normal" style="margin-left: 32px;" href="{$url}logout">{lang("log_out", "sidebox_info_login")}</a>
        {if hasPermission('view', "gm")}
            <div style="height: 15px;"></div>
            <a href="{$url}gm" class="button-wide">{lang("gm_panel", "sidebox_info_login")}</a>
        {/if}
        {if hasPermission('view', "admin")}
            <div style="height: 15px;"></div>
            <a href="{$url}admin" class="button-wide">{lang("admin_panel", "sidebox_info_login")}</a>
        {/if}
	</center>
</section>