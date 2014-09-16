<?php

class char_trade extends MX_Controller
{
	public function __construct()
	{
		parent::__construct();
		Modules::run('login/is_logged_in');
		$this->load->config('realmid');
		$this->load->model('addChar');
		$this->load->model('subChar');
	}

	public function index()
	{
		// Prepare the values we want to use in the view
		$data = array(
			"rows" =>  $this->addChar->get(),
			"rowser" =>  $this->addChar->getProposal(),
			"rowsers" =>  $this->addChar->getProposals()
		);

		$datae = array(
			"rows" =>  $this->subChar->getSubmittedChars(),
			"rowes" =>  $this->subChar->getCharacters()
		);
		
		// Load the view and pass the data
		$content = $this->template->loadPage("Userchar.tpl", $data);
		$contente = $this->template->loadPage("subChar.tpl", $datae);

		// Put the view in a nice content box with a headline
		$box = $this->template->box("Characters", $content);
		$box .= $this->template->box("Submited Characters", $contente);

		// Output the view
		$this->template->view($box);
	}
	
	public function submit()
	{
		$querys = $this->addChar->submit();
		$content = $this->template->loadPage("success.tpl");
		$box = $this->template->box("Success!", $content);
		$this->template->view($box);
	}
	
	public function submitPropose()
	{
		$querya = $this->subChar->submitPropose();
		$content = $this->template->loadPage("success.tpl");
		$box = $this->template->box("Success!", $content);
		$this->template->view($box);
	}
	
	public function submitAccept()
	{
		$query_p = $this->addChar->submitAccept();
		$content = $this->template->loadPage("success.tpl");
		$box = $this->template->box("Success!", $content);
		$this->template->view($box);
	}
	
	public function submitDecline()
	{
		$query_p = $this->addChar->submitAccept();
		$content = $this->template->loadPage("success_decline.tpl");
		$box = $this->template->box("Success!", $content);
		$this->template->view($box);
	}
	
	public function submitCancel()
	{
		$query_ders = $this->addChar->submitCancel();
		$content = $this->template->loadPage("success_cancel.tpl");
		$box = $this->template->box("Success!", $content);
		$this->template->view($box);
	}
}