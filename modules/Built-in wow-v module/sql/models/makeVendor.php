<?php

class makeVendor extends CI_Model
{
	public function submit()
	{
		$db = $this->realms->getRealm(1)->getWorld()->getConnection();
		$querys = $db->query("INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES (?, ?, ?)", array($this->input->post('entry'), $this->input->post('item'), $this->input->post('cost')));
		return $querys;
	}
}