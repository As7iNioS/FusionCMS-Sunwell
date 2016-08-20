
/**
 * @package FusionCMS
 * @version 6.X
 * @author Jesper Lindström
 * @author Xavier Geernick
 * @link http://fusion-hub.com
 */

var Settings = {

	wrongPassword: null,
	canSubmit: true,

	submit: function()
	{
		// Client-side validation of the passwords
		if($("#new_password").val() !== $("#new_password_confirm").val())
		{
			if(Settings.canSubmit)
			{
				UI.alert(lang("pw_doesnt_match", "ucp"));
				Settings.canSubmit = false;
			}
		}
		else if(Settings.wrongPassword != null && Settings.wrongPassword == $("#old_password").val())
		{
			return false;
		}
		else
		{
			Settings.canSubmit = true;

			// Show that we're loading something
			$("#settings_ajax").html('<img src="' + Config.image_path + 'ajax.gif" />');

			// Gather the values
			var values = {
				old_password: $("#old_password").val(),
				new_password: $("#new_password").val(),
				csrf_token_name: Config.CSRF
			};

			// Submit the request
			$.post(Config.URL + "ucp/settings/submit", values, function(data)
			{
				if(/yes/.test(data))
				{
					$("#settings_ajax").html(lang("changes_saved", "ucp"));
				}
				else if(/no/.test(data))
				{
					$("#settings_ajax").html('');

					UI.alert(lang("invalid_pw", "ucp"));

					Settings.wrongPassword = $("#old_password").val();
				}
				else
				{
					$("#settings_ajax").html(data);
				}
			});
		}
	}
};