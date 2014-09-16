<?php

class view extends CI_Model
{
	public function get()
	{
		$query = $this->db->query("SELECT * FROM gm_apply where user_id = ?", array($this->user->getId()));
		if($query->num_rows())
		{
			$row = $query->result_array();
			
			return $row;
		}
		else
		{
			return false;
		}
	}
	
	public function get_pendings()
	{
		$query = $this->db->query("SELECT * FROM gm_apply where status = 'Pending'");
		if($query->num_rows())
		{
			$row = $query->result_array();
			
			return $row;
		}
		else
		{
			return false;
		}
	}
}