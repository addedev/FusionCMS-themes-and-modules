<?php

class TopDonateVote extends MX_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->load->model('TopDonateModel');
	}

	public function index()
	{
		$rwquerd = $this->TopDonateModel->getThingData();

		$rwquerp = $this->TopDonateModel->getPurchaseData();


		$data = array(
			"date" => date("Y-m-d"),
			"rowschad" => $rwquerd,
			"rowschap" => $rwquerp
		);

		// Load the view and pass the data
		$content = $this->template->loadPage("TopDonateView.tpl", $data);

		// Put the view in a nice content box with a headline
		$box = $this->template->box("Top 10 Donators and Voters", $content);

		// Output the view
		$this->template->view($box);
	}
}