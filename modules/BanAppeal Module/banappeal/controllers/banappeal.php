<?php

class banappeal extends MX_Controller
{
	public function __construct()
	{
		parent::__construct();
		Modules::run('login/is_logged_in');
		$this->load->model('myModel');
	}

	public function index()
	{
	

	if($this->user->isOwner())
	{


        $data = array(
			"status" => $this->user->getAccountStatus(),
			"rows" => $this->myModel->lista()
		);

		// Load the view and pass the data
		$content = $this->template->loadPage("appeals.tpl", $data);

		// Put the view in a nice content box with a headline
		$box = $this->template->box("Appeals", $content);

		// Output the view
		$this->template->view($box);


	}else{

     if($this->user->getAccountStatus()!= "Active")
     {

        $data = array(
			"status" => $this->user->getAccountStatus()
		);

		// Load the view and pass the data
		$content = $this->template->loadPage("banned.tpl", $data);

		// Put the view in a nice content box with a headline
		$box = $this->template->box("Ban Appeal", $content);

		// Output the view
		$this->template->view($box);


     }else{

		$data = array(
			"status" => $this->user->getAccountStatus(),
		);

		// Load the view and pass the data
		$content = $this->template->loadPage("myModule.tpl", $data);

		// Put the view in a nice content box with a headline
		$box = $this->template->box("Ban Appeal", $content);

		// Output the view
		$this->template->view($box);

	 }
}

	}

    public function submit()
    {



       $data = array(
			"rows" =>  $this->myModel->get()
		);

		$content = $this->template->loadPage("sent.tpl", $data);
		$box = $this->template->box("Your appeal was sent", $content);
		$this->template->view($box);


    }


     public function decision()
    {

        if($this->input->post('accept')){

       $data = array(
			"rows" =>  $this->myModel->unban()
		);

		$content = $this->template->loadPage("accepted.tpl", $data);
		$box = $this->template->box("Player Unbanned", $content);
		$this->template->view($box);

       }else{



       $data = array(
			"rows" =>  $this->myModel->let()
		);

		$content = $this->template->loadPage("denied.tpl", $data);
		$box = $this->template->box("Appeal denied", $content);
		$this->template->view($box);


       }
    }




}

