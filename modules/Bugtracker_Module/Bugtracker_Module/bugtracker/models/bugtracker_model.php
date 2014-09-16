<?php

class Bugtracker_model extends CI_Model 
{
	public function __construct()
	{
		parent::__construct();
	}
	
	public function add($data)
	{
		$this->db->insert("bugtracker", $data);
	}
	
	public function getBugtracker($limit  = false)
	{
		if($limit)
		{
			$query = $this->db->query("SELECT * FROM bugtracker c, bugtracker_type t WHERE c.type = t.id ORDER BY c.time DESC LIMIT ?", array($limit));
		}
		else
		{
			// This query also gets the type from the foreign key.
			$query = $this->db->query("SELECT * FROM bugtracker c, bugtracker_type t WHERE c.type = t.id ORDER BY c.time DESC");
		}
		
		if($query->num_rows() > 0)
		{
			return $query->result_array();
		}
		else 
		{
			return false;	
		}
	}
	
	public function getReport($id)
	{
		if(!$id)
		{
			return false;
		}
		else
		{
			$query = $this->db->query("SELECT * FROM bugtracker c, bugtracker_type t WHERE c.type = t.id AND c.report_id = ?", array($id));
			
			if($query->num_rows() > 0)
			{
				$result = $query->result_array();
				return $result[0];
			}
			else 
			{
				return false;	
			}
		}
	}

	public function getCategories()
	{
		$query = $this->db->query("SELECT * FROM bugtracker_type ORDER BY id ASC");

		if($query->num_rows() > 0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	public function addCategory($name)
	{
		$this->db->query("INSERT INTO bugtracker_type(typeName) VALUES(?)", array($name));
	}

	public function deleteReport($id)
	{
		$this->db->query("DELETE FROM bugtracker WHERE report_id = ?", array($id));
	}

	public function deleteCategory($id)
	{
		$this->db->query("DELETE FROM bugtracker WHERE type = ?", array($id));
		$this->db->query("DELETE FROM bugtracker_type WHERE id = ?", array($id));
	}

	public function addReport($text, $category)
	{
		$data = array(
			"bugtracker" => $text,
			"author" => $this->user->getNickname(),
			"type" => $category,
			"time" => time()
		);

		$this->db->insert("bugtracker", $data);

		$query = $this->db->query("SELECT report_id FROM bugtracker ORDER BY report_id DESC LIMIT 1");

		if($query->num_rows() > 0)
		{
			$row = $query->result_array();

			return $row[0]['report_id'];
		}
		else
		{
			return false;
		}
	}
	
	public function saveCategory($id, $data)
	{
		$this->db->where('id', $id);
		$this->db->update('bugtracker_type', $data);
	}

	public function edit($id, $data)
	{
		$this->db->where('report_id', $id);
		$this->db->update('bugtracker', $data);
	}
}
