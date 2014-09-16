<?php

class Admin extends MX_Controller
{
	public function __construct()
	{
		// Make sure to load the administrator library!
		$this->load->library('administrator');
		$this->load->library('fusioneditor');
		$this->load->model('bugtracker_model');
		
		parent::__construct();
	}

	public function index()
	{
		// Change the title
		$this->administrator->setTitle("Bugtracker");
		
		$reports = $this->bugtracker_model->getBugtracker();

		if($reports)
		{
			foreach($reports as $key => $value)
			{
				if(strlen($reports[$key]['bugtracker']) > 30)
				{
					$reports[$key]['bugtracker'] = mb_substr($reports[$key]['bugtracker'], 0, 30) . '...';
				}
			}
		}

		// Prepare my data
		$data = array(
			'url' => $this->template->page_url,
			'reports' => $reports,
			'fusionEditor' => $this->fusioneditor->create("text"),
			'categories' => $this->bugtracker_model->getCategories()
		);

		// Load my view
		$output = $this->template->loadPage("admin.tpl", $data);

		// Put my view in the main box with a headline
		$content = $this->administrator->box('Bugtracker', $output);

		// Output my content. The method accepts the same arguments as template->view
		$this->administrator->view($content, false, "modules/bugtracker/js/admin_bugtracker.js");
	}
	
	public function create()
	{
		$name = $this->input->post("typeName");

		$this->bugtracker_model->addCategory($name);

		die('window.location.reload(true)');
	}

	public function addReport($id)
	{
		$data['bugtracker'] = $this->input->post("report_message");
		$data['author'] = $this->user->getNickname();
		$data['type'] = $id;
		$data['time'] = time();

 		$data['id'] = $this->bugtracker_model->add($data);

 		$data['date'] = date("Y/m/d");

		die(json_encode($data));
	}
	
	public function edit($id = false)
	{
		if(!is_numeric($id) || !$id)
		{
			die();
		}

		$report = $this->bugtracker_model->getReport($id);

		if(!$report)
		{
			show_error("There is no report with ID ".$id);

			die();
		}

		// Change the title
		$this->administrator->setTitle("Report #".$id);
		
		$fusionEditor = $this->fusioneditor->create("text", false, 250, $report['bugtracker']);

		// Prepare my data
		$data = array(
			'url' => $this->template->page_url,
			'fusionEditor' => $fusionEditor,
			'bugtracker' => $report
		);

		// Load my view
		$output = $this->template->loadPage("admin_edit_bugtracker.tpl", $data);

		// Put my view in the main box with a headline
		$content = $this->administrator->box('<a href="'.$this->template->page_url.'bugtracker/admin">Bugtracker</a> &rarr; Report #'.$id, $output);

		// Output my content. The method accepts the same arguments as template->view
		$this->administrator->view($content, false, "modules/bugtracker/js/admin_bugtracker.js");
	}
	
	public function delete($id = false)
	{
		if(!$id || !is_numeric($id))
		{
			die();
		}

		$this->bugtracker_model->deleteReport($id);
	}

	public function deleteCategory($id = false)
	{
		if(!$id || !is_numeric($id))
		{
			die();
		}

		$this->bugtracker_model->deleteCategory($id);
	}
	
	public function save($id = false)
	{
		if(!$id || !is_numeric($id))
		{
			die();
		}

		$data["bugtracker"] = $this->input->post("text");

		$this->bugtracker_model->edit($id, $data);

		die('window.location="'.$this->template->page_url.'bugtracker/admin"');
	}

	public function saveCategory($id = false)
	{
		if(!$id || !is_numeric($id))
		{
			die();
		}

		$data['typeName'] = $this->input->post('typeName');

		$this->bugtracker_model->saveCategory($id, $data);
	}
}