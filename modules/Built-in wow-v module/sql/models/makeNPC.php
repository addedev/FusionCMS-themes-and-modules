<?php

class makeNpc extends CI_Model
{
	public function submit()
	{
		$db = $this->realms->getRealm(1)->getWorld()->getConnection();
		$id = $db->query("SELECT * FROM creature_classlevelstats WHERE class = 2 and level = ?", array($this->input->post('minlvl')));
		$result = $id->result_array();
		$hp = $this->input->post('health') / $result[0]['basehp0'];
		$mana = $this->input->post('mana') / $result[0]['basemana'];
		$armor = $this->input->post('armor') / $result[0]['armor'];
		$querys = $db->query("INSERT INTO creature_template (entry, modelid1, name, subname, minlevel, maxlevel, faction_a, faction_h, scale, rank, mindmg, maxdmg, baseattacktime, unit_class, type, lootid, mingold, maxgold, AIName, health_mod, mana_mod, armor_mod) 
		VALUES (? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,'1' ,? ,? ,? ,? ,'SmartAI' ,? ,? ,?)", array($this->input->post('entry'), $this->input->post('display'), $this->input->post('name'), $this->input->post('subname'), $this->input->post('minlvl'), $this->input->post('maxlvl'), $this->input->post('faction'), $this->input->post('faction'), $this->input->post('scale'), $this->input->post('rank'), $this->input->post('mindmg'), $this->input->post('maxdmg'), $this->input->post('Speed'), $this->input->post('type'), $this->input->post('entry'), $this->input->post('drop'), $this->input->post('drop'), $hp, $mana, $armor));
		return $querys;
	}
}