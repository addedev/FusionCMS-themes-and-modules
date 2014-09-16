<?php

class chatbox extends MX_Controller
{
	public function __construct()
	{
		parent::__construct();

        Modules::run('login/is_logged_in');
 		$this->load->model('myModel');
	}

	public function index()
	{




		if($this->input->post('submit'))
       {
   

        

           $this->myModel->insert();
         

       }
		// Prepare the values we want to use in the view
		$data = array(
			"get" => $this->myModel->chat(),
			"color" => $this->color()
		);

		// Load the view and pass the data
		$content = $this->template->loadPage("myModule.tpl", $data);

		// Put the view in a nice content box with a headline
		$box = $this->template->box("Chatbox", $content);

		// Output the view
		$this->template->view($box);
	}


	public function color()
	{

     /* 
[Boolean] isGm()
[Boolean] isDev()
[Boolean] isAdmin()
[Boolean] isOwner()*/

      if($this->user->isOwner())
    {
     
      
      $color = "red";

      return $color;

    }else if($this->user->isAdmin()){

    $color = "orange";

      return $color;


  }else if($this->user->isGm()){

    $color = "blue";

      return $color;


       }else if($this->user->isDev()){

    $color = "yellow";

      return $color;
     
    }else{

   return false;

    }


	}
}