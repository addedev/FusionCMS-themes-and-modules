<?php

class subChar extends CI_Model
{
	public function submitPropose()
	{
		$db = $this->realms->getRealm($this->config->item('realmid'))->getCharacters()->getConnection();
		$select3 = $db->query("SELECT * FROM submited_chars WHERE id = ?", array($this->input->post('charid')));
		$s_row = $select3->result_array();
		$querya = $db->query("INSERT INTO char_proposal (p_char, s_char, p_id, s_id) VALUES (?, ?, ?, ?)", array($this->input->post('my_chars'), $s_row[0]['armory'], $this->user->getId(), $s_row[0]['s_id']));
		return $querya;
	}
	
	public function getSubmittedChars()
	{
		$db = $this->realms->getRealm($this->config->item('realmid'))->getCharacters()->getConnection();
		$select4 = $db->query("SELECT * FROM submited_chars WHERE s_id != ?", array($this->user->getId()));
		if($select4->num_rows())
		{
			$row = $select4->result_array();
			
			return $row;
		}
		else
		{
			return false;
		}
	}
	
	public function getCharacters()
	{
		$db = $this->realms->getRealm($this->config->item('realmid'))->getCharacters()->getConnection();
		$select2 = $db->query("SELECT * FROM characters WHERE account = ?", array($this->user->getId()));
		if($select2->num_rows())
		{
			$rowes = $select2->result_array();
			
			return $rowes;
		}
		else
		{
			return false;
		}
	}
}