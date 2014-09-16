<?php

class addChar extends CI_Model
{
	public function submit()
	{
		$db = $this->realms->getRealm($this->config->item('realmid'))->getCharacters()->getConnection();
		$select3 = $db->query("SELECT * FROM characters WHERE guid = ?", array($this->input->post('my_chars')));
		$s_row = $select3->result_array();
		$querys = $db->query("INSERT INTO submited_chars (name, level, armory, class, description, s_id) VALUES (?, ?, ?, ?, ?, ?)", array($s_row[0]['name'], $s_row[0]['level'], $s_row[0]['guid'], $this->input->post('class'), $this->input->post('description'), $this->user->getId()));
		return $querys;
	}
	
	public function get()
	{
		$db = $this->realms->getRealm($this->config->item('realmid'))->getCharacters()->getConnection();
		$select2 = $db->query("SELECT * FROM characters WHERE account = ?", array($this->user->getId()));
		if($select2->num_rows())
		{
			$row = $select2->result_array();
			
			return $row;
		}
		else
		{
			return false;
		}
	}
	
	public function getProposal()
	{
		$db = $this->realms->getRealm($this->config->item('realmid'))->getCharacters()->getConnection();
		$select2 = $db->query("SELECT * FROM char_proposal WHERE s_id = ?", array($this->user->getId()));
		if($select2->num_rows())
		{
			$rowser = $select2->result_array();
			
			return $rowser;
		}
		else
		{
			return false;
		}
	}
	
	public function getProposals()
	{
		$db = $this->realms->getRealm($this->config->item('realmid'))->getCharacters()->getConnection();
		$select2 = $db->query("SELECT * FROM char_proposal WHERE p_id = ?", array($this->user->getId()));
		if($select2->num_rows())
		{
			$rowser = $select2->result_array();
			
			return $rowser;
		}
		else
		{
			return false;
		}
	}
	
	public function submitAccept()
	{
		$db = $this->realms->getRealm($this->config->item('realmid'))->getCharacters()->getConnection();
		$select3 = $db->query("SELECT * FROM char_proposal WHERE s_id = ?", array($this->user->getId()));
		$s_row = $select3->result_array();
		$query_p = $db->query("UPDATE characters SET account = ? where guid = ?", array($s_row[0]['p_id'], $s_row[0]['s_char']));
		$query_pa = $db->query("UPDATE characters SET account = ? where guid = ?", array($s_row[0]['s_id'], $s_row[0]['p_char']));
		$query_per = $db->query("UPDATE characters SET at_login = 8 where guid = ?", array($s_row[0]['s_char']));
		$query_pre = $db->query("UPDATE characters SET at_login = 8 where guid = ?", array($s_row[0]['p_char']));
		$query_log = $db->query("INSERT INTO char_trade_logs (Propose_char, Seller_char, Propose_acc, Seller_acc) VALUES (?, ?, ?, ?)", array($s_row[0]['p_char'], $s_row[0]['s_char'], $s_row[0]['p_id'], $s_row[0]['s_id']));
		$query_d = $db->query("Delete from char_proposal where p_char = ?", array($s_row[0]['p_char']));
		$query_dd = $db->query("Delete from submited_chars where s_id = ?", array($s_row[0]['s_id']));
		$query_da = $db->query("Delete from char_proposal where s_char = ?", array($s_row[0]['s_char']));
	}
	
	public function submitDecline()
	{
		$db = $this->realms->getRealm($this->config->item('realmid'))->getCharacters()->getConnection();
		$select3 = $db->query("SELECT * FROM char_proposal WHERE s_id = ?", array($this->user->getId()));
		$s_row = $select3->result_array();
		$query_d = $db->query("Delete from char_proposal where p_char = ?", array($s_row[0]['p_char']));
		$query_da = $db->query("Delete from char_proposal where s_char = ?", array($s_row[0]['s_char']));
	}
	
	public function submitCancel()
	{
		$db = $this->realms->getRealm($this->config->item('realmid'))->getCharacters()->getConnection();
		$select3 = $db->query("SELECT * FROM char_proposal WHERE p_id = ?", array($this->user->getId()));
		$s_row = $select3->result_array();
		$query_ders = $db->query("Delete from char_proposal where p_char = ?", array($s_row[0]['p_char']));
	}
}