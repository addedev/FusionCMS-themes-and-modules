<?php

class makeBroadcast extends CI_Model
{
	public function submit()
	{
		$db = $this->realms->getRealm(1)->getWorld()->getConnection();
		$querys = $db->query("INSERT INTO autobroadcast (text) VALUES (?)", array($this->input->post('text')));
		return $querys;
	}
}