<?php


class myModel extends CI_Model{


 public function insert()
 {
 
 $name = $this->user->getUsername();

 $text = htmlspecialchars($this->input->post('text'));

 $data = date("Y-m-d, H:i");

  if(empty($text)){

         	 echo "<script>alert('You cant send a blank message.')</script>";

     


 
         }else{

 
 $query = $this->db->query("INSERT INTO chatbox(message,name,data) VALUES('$text','$name','$data')"); 


}

}

public function chat()
{

 $query = $this->db->query("SELECT message,name,data FROM chatbox ORDER BY id DESC");

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




?>