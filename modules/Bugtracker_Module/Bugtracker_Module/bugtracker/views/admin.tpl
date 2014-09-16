<section class="box big" id="main_bugtracker">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_grid.png"/>
		Reports (<div style="display:inline;" id="bugtracker_count">{if !$reports}0{else}{count($reports)}{/if}</div>)
	</h2>
	
	<span>
		<a class="nice_button" href="javascript:void(0)" onClick="Bugtracker.add()">Create category</a>
	</span>

	{if $categories}
	{foreach from=$categories item=category}
		<ul id="bugtracker_list">
			<li id="headline_{$category.id}">
				<table width="100%">
					<tr>
						<td width="5%"><a href="javascript:void(0)" onClick="Bugtracker.addReport({$category.id})" data-tip="Bug Report"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_plus.png" /></a></td>
						<td><b>{$category.typeName}</b></td>
						
						<td style="text-align:right;" width="10%">
							<a href="javascript:void(0)" onClick="Bugtracker.renameCategory({$category.id}, this)" data-tip="Rename category"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;
							<a href="javascript:void(0)" onClick="Bugtracker.removeCategory({$category.id}, this)" data-tip="Delete category and all it's entries"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
						</td>
					</tr>
				</table>
			</li>
			{foreach from=$reports item=report}
				{if $category.id == $report.type}
					<li>
						<table width="100%">
							<tr>
								<td width="40%">{$report.bugtracker}</td>
								<td width="20%">{$report.author}</td>
								<td width="20%">{date('Y/m/d', $report.time)}</td>
								
								<td style="text-align:right;" width="10%">
									<a href="{$url}bugtracker/admin/edit/{$report.report_id}" data-tip="Edit"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;
									<a href="javascript:void(0)" onClick="Bugtracker.remove({$report.report_id}, this)" data-tip="Delete"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
								</td>
							</tr>
						</table>
					</li>
				{/if}
			{/foreach}
		</ul>
	{/foreach}
	{/if}
</section>

<section class="box big" id="add_bugtracker" style="display:none;">
	<h2><a href='javascript:void(0)' onClick="Bugtracker.add()" data-tip="Return to Bugtracker">Bugtracker</a> &rarr; New category</h2>

	<form onSubmit="Bugtracker.create(this); return false" id="submit_form">
		<label for="name">Category name</label>
		<input type="text" name="typeName" id="typeName" />
	
		<input type="submit" value="Submit category" />
	</form>
</section>