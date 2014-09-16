	<div id="bugtracker_add">

		<form id="report_form" onSubmit="Bugtracker.addReport(); return false" style="display:none;">
			<textarea type="text" name="report" rows="5" cols="80" id="report_text" placeholder="Please subscribe the bug ..." required  /></textarea>
			<select style="width:20%" name="category" id="bugtracker_types">
				{foreach from=$categories item=category}
					<option value="{$category.id}">{$category.typeName}</option>
				{/foreach}
			</select>
			<input type="submit" value="Add"/>
		</form>

		<a href="javascript:void(0)" onClick="$('#category_form').hide();$('#report_form').fadeToggle(150)" class="nice_button">Report Bug</a>
		

	</div>

{if $is_dev}
	{if $reports}
	<div id="bugtracker">
		<br><br><br><br><br><br><br><br><br><br><br>
		{foreach from=$reports key=k item=report_time}
			<table class="nice_table">
				<tr>
					<td><div class="bugtracker_info">Reports from {$k}</div></td>
				</tr>
				{foreach from=$report_time key=k_type item=report_type}
				
					<tr>
						<td><a>{htmlspecialchars($k_type)}</a></td>
					</tr>

					{foreach from=$report_type item=report}
						<tr>
							<td>{if $is_dev}<a href="{$url}bugtracker/remove/{$report.report_id}" style="display:inline !important;margin:0px !important;"><img src="{$url}application/images/icons/delete.png" align="absmiddle" /></a>{/if} &nbsp;{htmlspecialchars($report.bugtracker)}</td><td>{$report.author}</td>
						</tr>
					{/foreach}
				
				{/foreach}
			</table>
		{/foreach}
	</div>
	{else}
		<div id="bugtracker">
			<br><br><br><br><br><br><br><br><br><br><br>
			<center style="padding:10px;">There are no Bugreports to show.</center>
		</div>
	{/if}
{else}
	<div id="bugtracker">
		<br><br><br><br><br><br><br><br><br><br><br>
		<center style="padding:10px;">You are not allowed to see Bugreports</center>
	</div>
{/if}	