<?php

class sql extends MX_Controller
{
	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		// Prepare the values we want to use in the view
		$data = array(
			"date" => date("Y-m-d")
		);

		// Load the view and pass the data
		$content = $this->template->loadPage("sql.tpl", $data);

		// Put the view in a nice content box with a headline
		$box = $this->template->box("SQL Manager", $content);

		// Output the view
		$this->template->view($box);
	}
}