<?php

class broadcast extends MX_Controller
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
		
		// Load the view and pass the data
		$content = $this->template->loadPage("broadcast.tpl");

		// Put the view in a nice content box with a headline
		$box = $this->template->box("Broadcast Manager", $content);

		// Output the view
		$this->template->view($box);
	}
	
	public function submit()
	{
		$this->load->model('makeBroadcast');
		$querys = $this->makeBroadcast->submit();
		$content = $this->template->loadPage("success.tpl");
		$box = $this->template->box("Success!", $content);
		$this->template->view($box);
	}
}