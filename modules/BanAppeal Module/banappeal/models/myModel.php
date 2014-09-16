<?php


class myModel extends CI_Model{


 public function get()
 {
 
 $name = $this->user->getUsername();

 $text = htmlspecialchars($this->input->post('mess'));

 $data = date("Y-m-d");


 
 $query = $this->db->query("INSERT INTO appeals(message,remetent,data) VALUES('$text','$name','$data')"); 



}

public function lista()
{

 $query = $this->db->query("SELECT message,remetent,data FROM appeals ORDER BY id DESC");

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


public function unban()
{

$username = $this->input->post('test1');
$username1 = $this->user->getId($username);

$db = $this->external_account_model->getConnection();

$db->query("DELETE FROM account_banned WHERE id='$username1'");


$bug = $this->input->post('test');
$bug1 = $this->input->post('test1');
$query = $this->db->query("DELETE FROM appeals WHERE message='$bug' and remetent='$bug1' "); 

}

public function let()
{

$bug = $this->input->post('test');
$bug1 = $this->input->post('test1');
$query = $this->db->query("DELETE FROM appeals WHERE message='$bug' and remetent='$bug1' "); 
	
}


}




?>