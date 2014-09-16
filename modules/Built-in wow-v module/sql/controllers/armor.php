<?php

class armor extends MX_Controller
{
	public function __construct()
	{
		parent::__construct();
		
		Modules::run('login/is_logged_in');
		if(!$this->user->isGm())
		{
			redirect('error/rank');
			die();
		}
	}

	public function index()
	{
		// Prepare the values we want to use in the view
		$data = array(
			"date" => date("Y-m-d")
		);

		// Load the view and pass the data
		$content = $this->template->loadPage("armor.tpl", $data);

		// Put the view in a nice content box with a headline
		$box = $this->template->box("Armor Manager", $content);

		// Output the view
		$this->template->view($box);
	}
	
	public function submit()
	{
		$this->load->model('makeArmor');
		$querys = $this->makeArmor->submit();
		$content = $this->template->loadPage("success.tpl");
		$box = $this->template->box("Success!", $content);
		$this->template->view($box);
	}
}