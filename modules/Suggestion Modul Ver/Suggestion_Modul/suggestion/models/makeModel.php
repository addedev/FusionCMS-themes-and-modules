<?php

class makeModel extends CI_Model
{
        public function submit()
        {
                $userid = $this->user->getNickname();
                $id = $this->db->query("SELECT id FROM account_data WHERE nickname = ?", array($userid));
                $id_row = $id->result_array();
                $querys = $this->db->query("INSERT INTO vorschlag (details, user_id, closed) VALUES (? ,? ,?)", array($this->input->post('details'), $id_row[0]['id'], ($this->input->post('0'))));
                return $querys;
        }
}