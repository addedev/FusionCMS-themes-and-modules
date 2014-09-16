<?php

class gm_apply extends MX_Controller
{
	public function __construct()
	{
		parent::__construct();
		Modules::run('login/is_logged_in');
		$this->load->model('view');
		$this->load->config('config');
	}

	public function index()
	{
		// Prepare the values we want to use in the view
		$data = array(
			"rows" => $this->view->get(),
			"rowser" => $this->view->get_pendings(),
			"questionnr" => $this->config->item('questionnr'),
			"info1" => $this->config->item('info1'),
			"info2" => $this->config->item('info2'),
			"info3" => $this->config->item('info3'),
			"info4" => $this->config->item('info4'),
			"info5" => $this->config->item('info5'),
			"info6" => $this->config->item('info6'),
			"info7" => $this->config->item('info7'),
			"info8" => $this->config->item('info8'),
			"info9" => $this->config->item('info9'),
			"info10" => $this->config->item('info10'),
			"info11" => $this->config->item('info11'),
			"info12" => $this->config->item('info12'),
			"info13" => $this->config->item('info13'),
			"info14" => $this->config->item('info14'),
			"info15" => $this->config->item('info15'),
			"check" => $this->user->isGm()
		);

		// Load the view and pass the data
		$content = $this->template->loadPage("format.tpl", $data);
		$contents = $this->template->loadPage("view.tpl", $data);
		$contentse = $this->template->loadPage("views.tpl", $data);

		// Put the view in a nice content box with a headline
		$box = $this->template->box("Your Application Status", $contents);
		if($this->user->isAdmin() == true)
		{
		$box .= $this->template->box("Pending Applications", $contentse);
		}
		$box .= $this->template->box("Game Master application", $content);

		// Output the view
		$this->template->view($box);
	}
	
	public function submit()
	{
		$this->load->model('add');
		$queryst = $this->add->submit();
		$content = $this->template->loadPage("success.tpl");
		$box = $this->template->box("Success!", $content);
		$this->template->view($box);
	}
	
	public function accept()
	{
		$this->load->model('add');
		$queryst = $this->add->accept();
		$content = $this->template->loadPage("accept.tpl");
		$box = $this->template->box("Success!", $content);
		$this->template->view($box);
	}
	
	public function decline()
	{
		$this->load->model('add');
		$queryst = $this->add->decline();
		$content = $this->template->loadPage("decline.tpl");
		$box = $this->template->box("Success!", $content);
		$this->template->view($box);
	}
}