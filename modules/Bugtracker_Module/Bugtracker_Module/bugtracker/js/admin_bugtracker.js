var Bugtracker = {
	
	/**
	 * General identifier used on #{ID}_count, #add_{ID}, #{ID}_list and #main_{ID}
	 */
	identifier: "bugtracker",
	identifier2: "Bugreport",

	/**
	 * Links for the ajax requests
	 */
	Links: {
		remove: "bugtracker/admin/delete/",
		removeCategory: "bugtracker/admin/deleteCategory/",
		create: "bugtracker/admin/create/",
		save: "bugtracker/admin/save/",
		saveCategory: "bugtracker/admin/saveCategory/",
	},

	/**
	 * Removes an entry from the list
	 * @param  Int id
	 * @param  Object element
	 */
	remove: function(id, element)
	{
		var identifier2 = this.identifier2,
			removeLink = this.Links.remove;

		UI.confirm("Do you really want to delete this " + identifier2 + "?", "Yes", function()
		{
			$("#" + identifier2 + "_count").html(parseInt($("#" + identifier2 + "_count").html()) - 1);

			$(element).parents("li").slideUp(300, function()
			{
				$(this).remove();
			});

			$.get(Config.URL + removeLink + id);
		});
	},

	/**
	 * Toggle between the "add" form and the list
	 */
	add: function(categoryId)
	{
		var id = this.identifier;

		if($("#add_" + id).is(":visible"))
		{
			$("#add_" + id).fadeOut(150, function()
			{
				$("#main_" + id).fadeIn(150);
			});
		}
		else
		{
			$("#main_" + id).fadeOut(150, function()
			{
				$("#add_" + id).fadeIn(150);
			});
		}
	},

	/**
	 * Submit the form contents to the create link
	 * @param Object form
	 */
	create: function(form)
	{
		var values = {csrf_token_name: Config.CSRF};

		$(form).find("input, select").each(function()
		{
			if($(this).attr("type") != "submit")
			{
				values[$(this).attr("name")] = $(this).val();
			}
		});

		$.post(Config.URL + this.Links.create, values, function(data)
		{
			console.log(data);
			eval(data);
		});
	},

	/**
	 * Submit the form contents to the save link
	 * @param Object form
	 */
	save: function(form, id)
	{
		var values = {csrf_token_name: Config.CSRF};

		$(form).find("input, textarea, select").each(function()
		{
			if($(this).attr("type") != "submit")
			{
				values[$(this).attr("name")] = $(this).val();
			}
		});

		$.post(Config.URL + this.Links.save + id, values, function(data)
		{
			console.log(data);
			eval(data);
		});
	},

	/**
	 * ----------- Module specific code -----------
	 */
	addReport: function(id)
	{
		var addHTML = '<textarea id="report_message" rows="4" placeholder="bugtracker message..."></textarea>';

		UI.confirm(addHTML, "Submit", function()
		{
			var report_message = $("#report_message").val();

			$.post(Config.URL + "bugtracker/admin/addReport/" + id, {csrf_token_name:Config.CSRF, report_message:report_message}, function(data)
			{
				data = JSON.parse(data);
				console.log(data);
				$("#headline_" + id).after('<li style="display:none;">' +
						'<table width="100%">' +
							'<tr>' +
								'<td width="40%">' + data.bugtracker +'</td>' +
								'<td width="20%">' + data.author + '</td>' +
								'<td width="20%">' + data.date + '</td>' +
								'<td style="text-align:right;" width="10%">' +
									'<a href="' + Config.URL + 'bugtracker/admin/edit/' + data.id + '" data-tip="Edit"><img src="' + Config.URL + 'application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;'+
									'<a href="javascript:void(0)" onClick="Bugtracker.remove(' + data.id + ', this)" data-tip="Delete"><img src="' + Config.URL + 'application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>'+
								'</td>' +
							'</tr>' +
						'</table>' +
					'</li>');
				$("#headline_" + id).next().slideDown(300);
			});
		});
	},

	/**
	 * Removes a category
	 * @param  Int id
	 * @param  Object element
	 */
	removeCategory: function(id, element)
	{
		var identifier = this.identifier,
			removeLink = this.Links.removeCategory;

		UI.confirm("Do you really want to delete this category and all it's reports?", "Yes", function()
		{
			var entries = $(element).parents("ul").children("li").length - 1;

			$("#" + identifier + "_count").html(parseInt($("#" + identifier + "_count").html()) - entries);

			$(element).parents("ul").fadeOut(300, function()
			{
				$(this).remove();
			});

			$.get(Config.URL + removeLink + id);
		});
	},

	renameCategory: function(id, field)
	{
		var nameField = $(field).parents("td").prev("td").children("b");

		var renameHTML = "<input type='text' id='rename' value=" + nameField.html() + ">";

		UI.confirm(renameHTML, "Save", function()
		{
			var name = $("#rename").val();

			nameField.html(name);

			$.post(Config.URL + Bugtracker.Links.saveCategory + id, {csrf_token_name:Config.CSRF, typeName:name});
		});
	}
}