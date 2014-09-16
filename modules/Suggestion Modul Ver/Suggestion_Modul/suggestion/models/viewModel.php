<?php

class viewModel extends CI_Model
{
        public function get()
        {
                $query = $this->db->query("SELECT * FROM vorschlag ORDER BY ID DESC");

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