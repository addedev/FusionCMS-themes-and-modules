<?php

class add extends CI_Model
{
	public function submit()
	{
		$userid = $this->user->getNickname();
		$id = $this->db->query("SELECT id FROM account_data WHERE nickname = ?", array($userid));
		$id_row = $id->result_array();
		$queryst = $this->db->query("INSERT INTO dev_apply (user_id, name, age, country, info1, info2, info3, info4, info5, info6, info7, info8, info9, info10, info11, info12, info13, info14, info15) VALUES (? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?, ?)", array($id_row[0]['id'], $this->input->post('name'), $this->input->post('age'), $this->input->post('country'), $this->input->post('info1'), $this->input->post('info2'), $this->input->post('info3'), $this->input->post('info4'), $this->input->post('info5'), $this->input->post('info6'), $this->input->post('info7'), $this->input->post('info8'), $this->input->post('info9'), $this->input->post('info10'), $this->input->post('info11'), $this->input->post('info12'), $this->input->post('info13'), $this->input->post('info14'), $this->input->post('info15')));
		return $queryst;
	}
	
	public function accept()
	{
		$db = $this->external_account_model->getConnection();
		$queryst = $db->query("INSERT INTO account_access (id, gmlevel, RealmID) VALUES (? ,3, -1)", array($this->input->post('applyid')));
		$queryst = $db->query("INSERT INTO rbac_account_groups (accountId, groupId, realmId) VALUES (? , 1, -1)", array($this->input->post('applyid')));
		$queryst = $db->query("INSERT INTO rbac_account_groups (accountId, groupId, realmId) VALUES (? , 2, -1)", array($this->input->post('applyid')));
		$queryst = $db->query("INSERT INTO rbac_account_groups (accountId, groupId, realmId) VALUES (? , 3, -1)", array($this->input->post('applyid')));
		$queryst = $this->db->query("INSERT INTO acl_account_groups (account_id, group_id) VALUES (? , 3)", array($this->input->post('applyid')));
		$queryst = $this->db->query("UPDATE dev_apply SET status = 'Accepted' where user_id = ?", array($this->input->post('applyid')));
		return $queryst;
	}
	
	public function decline()
	{
		$userid = $this->user->getNickname();
		$id = $this->db->query("SELECT id FROM account_data WHERE nickname = ?", array($userid));
		$id_row = $id->result_array();
		$queryst = $this->db->query("UPDATE dev_apply SET status = 'Declined' where user_id = ?", array($this->input->post('applyid')));
		return $queryst;
	}
}