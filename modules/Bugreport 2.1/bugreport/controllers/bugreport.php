<?php

class bugreport extends MX_Controller
{
	public function __construct()
	{
		parent::__construct();

		Modules::run('login/is_logged_in');

		 $this->load->model('myModel');
	}

	public function index()
	{
		// Prepare the values we want to use in the view
		$data = array(
			"rows" => $this->myModel->lista(),
			"check" => $this->check()
		);
       




		// Load the view and pass the data
		$content = $this->template->loadPage("myModule.tpl", $data);
		$content1 = $this->template->loadPage("reports.tpl", $data);
	

		// Put the view in a nice content box with a headline
		$box = $this->template->box("BugReport", $content);
		$box .= $this->template->box("Reports", $content1);


        


		// Output the view
		$this->template->view($box);
	
	}

	public function submit()
	{

		$data = array(
			"rows" =>  $this->myModel->get()
		);

		$content = $this->template->loadPage("sent.tpl", $data);
		$box = $this->template->box("Your bug have been sent", $content);
		$this->template->view($box);


	}

	public function check()
	{

    if($this->user->isOwner())
    {
     
     

     return true;

    }else{

    return false;
    	
    }

	}

	public function fixed()
	{

       if($this->input->post('submit'))
       {
		
		  $this->myModel->fix();

		  $content = $this->template->loadPage("fixed.tpl");
		$box = $this->template->box("Bug status changed", $content);
		$this->template->view($box);

		}
	}


}