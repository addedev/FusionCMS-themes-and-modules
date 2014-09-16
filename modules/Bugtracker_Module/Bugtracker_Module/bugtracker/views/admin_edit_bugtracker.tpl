<section class="box big">
	<h2>Edit report</h2>

	<form onSubmit="Bugtracker.save(this, {$bugtracker.report_id}); return false" id="submit_form">
		
		<label for="text">Message</label>
		<textarea id="text" name="text" rows="4">{$bugtracker.bugtracker}</textarea>
	
		<input type="submit" value="Save report" />
	</form>
</section>