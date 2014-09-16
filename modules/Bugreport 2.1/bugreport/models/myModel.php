<?php


class myModel extends CI_Model{


 public function get()
 {
 
 $name = $this->user->getUsername();

 $text = htmlspecialchars($this->input->post('bug'));

 $data = date("Y-m-d");

 $prior = $this->input->post('importance');

 
 $query = $this->db->query("INSERT INTO bugreport(bug,remetent,data,priority) VALUES('$text','$name','$data','$prior')"); 



}

public function lista()
{

 $query = $this->db->query("SELECT bug,remetent,data,status,priority FROM bugreport ORDER BY id DESC");

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


public function fix()
{

$bug = $this->input->post('bugname');
$query = $this->db->query("UPDATE bugreport SET status=1 WHERE bug='$bug' "); 

}


}




?>