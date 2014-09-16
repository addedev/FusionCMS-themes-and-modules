<?php

class Bugtracker extends MX_Controller
{
	private $bugtracker_days;
	
	public function __construct()
	{
		parent::__construct();

		$this->load->model('bugtracker_model');
		$this->load->config('bugtracker');
	}
	
	public function index()
	{
		$this->template->setTitle("Bugtracker");
		
		$bugtracker_items = $this->bugtracker_model->getBugtracker($this->config->item('bugtracker_limit'));
		
		if($bugtracker_items)
		{
			//Sort by time, this will move every single item to an array with as key the time.
			$bugtracker_items = $this->sortByTime($bugtracker_items);
		}
		
		$data = array(
			"reports" => $bugtracker_items,
			"is_dev" => $this->user->isDev(),
			"url" => $this->template->page_url,
			"categories" => $this->bugtracker_model->getCategories(),
			'attributes' => array("id" => "category_form", "style" => "display:none;")
		);

		$content =  $this->template->loadPage("bugtracker.tpl", $data);
		
		$this->template->box("Bugtracker", $content, true, "modules/bugtracker/css/bugtracker.css", "modules/bugtracker/js/bugtracker.js");
	}
	
	public function sortByTime($bugtracker_items)
	{
		$new_array = array();
		
		foreach($bugtracker_items as $item)
		{
			//If we dont got the time yet add it to the new array
			if(!array_key_exists(date("Y/m/d", $item['time']), $new_array))
			{
				//Assign an array to that key
				$new_array[date("Y/m/d", $item['time'])] = array();
			}
			
			//Do the same but then for the typeName
			if(!array_key_exists($item['typeName'], $new_array[date("Y/m/d", $item['time'])]))
			{
				//Assign an array to that key
				$new_array[date("Y/m/d", $item['time'])][$item['typeName']] = array();
			}
			
			array_push($new_array[date("Y/m/d", $item['time'])][$item['typeName']], $item);
		}

		return $new_array;
	}

	public function addCategory()
	{
		$category = $this->input->post('category');

		if($category && $this->user->isDev())
		{
			$id = $this->bugtracker_model->addCategory($category);

			redirect('bugtracker');
		}
		else
		{
			$this->index();
		}
	}

	public function addReport()
	{
		$report = $this->input->post('report');
		$category = $this->input->post('category');

		if($category && $report)
		{
			$id = $this->bugtracker_model->addReport($report, $category);

			die($id."");
		}
		else
		{
			$this->index();
		}
	}

	public function remove($id = false)
	{
		if($id && is_numeric($id) && $this->user->isDev())
		{
			$this->bugtracker_model->deleteReport($id);

			$this->index();
		}
		else
		{
			$this->index();
		}
	}
}
