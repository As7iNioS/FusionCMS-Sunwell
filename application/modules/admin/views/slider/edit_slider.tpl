<section class="box big">
	<h2>Edit slide</h2>

	<form onSubmit="Slider.save(this, {$slide.id}); return false" id="submit_form">
		<label for="image">Image URL</label>
		<input type="text" name="image" id="image" placeholder="http://" value="{preg_replace('/{path}/', '', $slide.image)}"/>

		<label for="link">Link (optional)</label>
		<input type="text" name="link" id="link" placeholder="http://" value="{$slide.link}"/>

		<label for="title">Title</label>
		<input type="hidden" name="title" id="title" value="{htmlspecialchars($slide.title)}"/>

		<label for="text">Description</label>
		<input type="hidden" name="text" id="text" value="{htmlspecialchars($slide.text)}"/>

		<input type="submit" value="Save slide" />
	</form>
</section>

<script>
	require([Config.URL + "application/themes/admin/js/mli.js"], function()
	{
		new MultiLanguageInput($("#title"));
		new MultiLanguageInput($("#text"));
	});
</script>