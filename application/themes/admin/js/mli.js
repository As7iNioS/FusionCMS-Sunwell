/**
 * [MLI] MultiLanguageInput
 * @package FusionCMS
 * @version 6.1
 * @author Jesper Lindström
 * @link http://fusion-hub.com
 */

function MultiLanguageInput(field)
{
	var originalData = field.val(),
		isJson = true,
		data = {},
        isTextArea = field.data("type") == "textarea",
		area;

	/**
	 * Start it all; assign events and so on
	 */
	var initialize = function()
	{
		field.prop("type", "hidden");
		field.after('<div class="languages"></div>');

		area = field.next('.languages');

		// Check if it's JSON or not
		try
		{
			data = JSON.parse(originalData);

			for(var i in data)
			{
				area.append(isTextArea ? createTextArea(i, data[i]) : createField(i, data[i]));
			}
		}
		catch(exception)
		{
			isJson = false;
			data = {};
			data[Config.defaultLanguage] = originalData;
			field.val(JSON.stringify(data));
			area.append(
                isTextArea ? createTextArea(Config.defaultLanguage, originalData) : createField(Config.defaultLanguage, originalData)
            );
		}

		var addTranslation = $('<a href="javascript:void(0)">(add translation)</a>');

		addTranslation.on('click', function()
		{
			var options = getLanguageOptions();

			var languages = '<select id="insertLanguage">' + options + '</select>';
            var lang = $("#insertLanguage").val();

            if(options)
			{
				UI.confirm(languages, 'Insert', function()
				{
					data[lang] = "";
                    area.append(
                        isTextArea ? createTextArea(lang) : createField(lang)
                    );
				});
			}
			else
			{
				UI.alert("There are no more languages");
			}
		});

		field.prev("label").append(" ").append(addTranslation);
	};

	var getLanguageOptions = function()
	{
		var html = "";

		Config.languages.forEach(function(language)
		{
			if(typeof data[language] == "undefined")
			{
				html += "<option value='" + language + "'>" + language + "</option>";
			}
		});

		return html;
	};

    /**
     * Create the element for a text field
     * @param language
     * @param text
     */
	var createField = function(language, text)
	{
	    if (language == null) return;

		if(!text)
		{
			text = "";
		}

		text = text.replace("'", "&apos;");
		text = text.replace("\"", "&quot;");
		var newField = $("<input type='text' data-lang='" + language + "' style='padding-left:70px;' value='" + text + "'/>");

		// Assign blur event
		newField.on('blur', function()
		{
			// Update the data
			data[language] = $(this).val();
			field.val(JSON.stringify(data));
		});

		var flag = '<div style="position:absolute;margin-top:11px;margin-left:10px;font-weight:bold;font-size:12px;">' + language + '</div>';

		return [flag, newField];
	};

    /**
     * Create the element for a text field
     * @param language
     * @param text
     */
	var createTextArea = function(language, text)
	{
        if (language == null) return;

        if(!text)
		{
			text = "";
		}

		var newField = $("<textarea class='tinymce' data-lang='" + language + "' style='padding-left:70px;'  cols='30' rows='10'>" + text + "</textarea>");

		var flag = '<div style="margin: 10px 0 5px 5px;font-weight:bold;font-size:12px;">' + language + '</div>';

        require([Config.URL + "application/js/tiny_mce/jquery.tinymce.js"], function()
        {
            newField.tinymce({
                script_url : Config.URL + 'application/js/tiny_mce/tiny_mce.js',
                height: "300",

                // General options
                theme : "advanced",
                plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

                // Theme options
                theme_advanced_buttons1 : "bold,italic,underline,|,justifyleft,justifycenter,justifyright,formatselect,fontselect,fontsizeselect,charmap,emotions,iespell,media,|,fullscreen,bullist,numlist,removeformat",
                theme_advanced_buttons2 : "outdent,indent,|,undo,redo,|,link,unlink,image,cleanup,code,|,forecolor,tablecontrols,|,visualaid",
                theme_advanced_buttons3 : "",
                theme_advanced_buttons4 : "",
                theme_advanced_toolbar_location : "top",
                theme_advanced_toolbar_align : "left",
                theme_advanced_statusbar_location : "bottom",
                theme_advanced_resizing : true,

                // Example content CSS (should be your site CSS)
                content_css : "",

                // Drop lists for link/image/media/template dialogs
                template_external_list_url : "lists/template_list.js",
                external_link_list_url : "lists/link_list.js",
                external_image_list_url : "lists/image_list.js",
                media_external_list_url : "lists/media_list.js",

                // Replace values for the template plugin
                template_replace_values : {
                    username : "Some User",
                    staffid : "991234"
                },
                setup : function(ed) {
                    ed.onInit.add(function (ed) {
                        /* onBlur */
                        tinymce.dom.Event.add(ed.getBody(), 'blur', function (e) {
                            data[language] = tinymce.activeEditor.getContent({format : 'raw'});;
                            field.val(JSON.stringify(data));
                        });
                    });
                }
            });
        });

        return [flag, newField];
	};

	// Start it all
	initialize();
}