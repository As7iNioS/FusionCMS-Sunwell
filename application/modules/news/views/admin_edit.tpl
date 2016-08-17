{TinyMCE()}
<section class="box big">
	<h2>Edit article</h2>

	<form onSubmit="News.send({$article.id}); return false">
		<label for="headline">Headline</label>
		<input type="hidden" id="headline" value="{htmlspecialchars($article.headline)}"/>
		
		<label for="news_content">Content</label>
		<input type="hidden" id="news_content" data-type="textarea" value="{htmlspecialchars($article.content)}"/>
	</form>
	<form onSubmit="News.send({$article.id}); return false">
		<label>Article settings</label>

		<input type="checkbox" id="avatar" {if $article.avatar}checked="yes"{/if} value="1"/>
		<label for="avatar" class="inline_label">Show your avatar</label>

		<input type="submit" value="Save article" />
	</form>
</section>

<script>
	require([Config.URL + "application/themes/admin/js/mli.js"], function()
	{
		new MultiLanguageInput($("#headline"));
        new MultiLanguageInput($("#news_content"));
	});
</script>