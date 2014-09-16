var Bugtracker = {

	addReport: function()
	{
		var reportTypeId = $("#bugtracker_types").val();
		var reportText = $("#report_text").val();

		if(reportText.length > 0)
		{
			$.post(Config.URL + "bugtracker/addReport", {report:reportText, category: reportTypeId, csrf_token_name: Config.CSRF}, function(id)
			{
				$("#report_text").val('');

				var typeText = $("#bugtracker_types option[value='" + $("#bugtracker_types").val() + "']").html();
				var bugtrackerArea = $("#bugtracker");
				var dateText = Bugtracker.formatDate(new Date());
				var typeHTML = '<tr id="report_' + typeText + '">' +
									'<td><a>' + typeText + '</a></td>' +
								'</tr>';
				var dateHTML = '<tr id="my_date">' +
									'<td><div class="bugtracker_info">Reports made on ' + dateText + '</div></td>' +
								'</tr>';
				var ReportHTML = '<tr>' +
									'<td><a href="' + Config.URL + 'bugtracker/remove/' + id + '" style="display:inline !important;margin:0px !important;"><img src="' + Config.URL + 'application/images/icons/delete.png" align="absmiddle" /></a> &nbsp;' + reportText + '</td>' +
								'</tr>';

				// Remove the "There are no changes to show." message
				if(bugtrackerArea.children('table').length == 0)
				{
					// Add the entry
					var output = '<table class="nice_table">' +
									dateHTML +
									typeHTML +
									reportHTML +
								'</table>';

					bugtrackerArea.html(output);
				}
				else
				{
					var dateElement = false;

					// Loop through all date groups
					bugtrackerArea.children('table').each(function()
					{
						// Does one exist with the current date?
						if($(this).find('.bugtracker_info').html() == "Reports made on " + dateText)
						{
							// Use it
							dateElement = $(this).find('.bugtracker_info').parent().parent();
						}
					});

					if(dateElement == false)
					{
						// If not, create one
						bugtrackerArea.prepend('<table class="nice_table">' +
												dateHTML +
											'</table>');

						dateElement = $("#my_date");
					}

					var typeElement = false;

					// Search the type groups for the same one
					dateElement.parent().find('td a').each(function()
					{
						if($(this).html() == typeText)
						{
							typeElement = $(this).parent().parent();
						}
					});

					if(typeElement == false)
					{
						dateElement.after(typeHTML);
						typeElement = $("#report_" + typeText);
					}

					typeElement.after(changeHTML);
				}
			});
		}
	},

	formatDate: function(date)
	{
		var year = date.getFullYear();
		var month = ((date.getUTCMonth() + 1) < 10) ? "0" + (date.getUTCMonth() + 1): (date.getUTCMonth() + 1);
		var day = (date.getDate() < 10) ? "0" + date.getDate() : date.getDate();

		return year + "/" + month + "/" + day;
	}
}