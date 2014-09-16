<?php

class makeVendor extends CI_Model
{
	public function submit()
	{
		$db = $this->realms->getRealm(1)->getWorld()->getConnection();
		$querys = $db->query("INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance, lootmode, groupid, mincountOrRef, Maxcount) VALUES (?, ?, ?, 1, ?, ?, ?)", array($this->input->post('entry'), $this->input->post('item'), $this->input->post('chance'), $this->input->post('groupid'), $this->input->post('minc'), $this->input->post('maxc')));
		return $querys;
	}
}