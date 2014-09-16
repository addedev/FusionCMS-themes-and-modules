<?php

class Lottery_session extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function cost($id) {
        $this->db->where('id', $id);
        $q = $this->db->get('lotteries');
        $r = $q->row();

        return array(
            'vp' => $r->vp,
            'dp' => $r->dp
        );
    }

    function finalize($id) {
        $this->db->where('id', $id);
        $this->db->update('lotteries', array(
            'finished' => 1
        ));
    }

    function get($id) {
        $this->db->where('id', $id);
        $q = $this->db->get('lotteries');
        return $q->row();
    }

    function last($row = false) {
        $this->db->order_by('created', 'desc');
        $q = $this->db->get('lotteries');
        if ($row) {
            return $q->row();
        }
        $r = $q->row();
        if (isset($r->id)) {
            return $r->id;
        }
        return false;
    }

    function delete($id) {
        $this->db->where('id', $id);
        $this->db->delete('lotteries');
    }

    function getLotteries() {
        $this->db->order_by('created', 'desc');
        $q = $this->db->get('lotteries');
        return $q->result();
    }

    function isFinalized($id) {
        $this->db->where('id', $id);
        $this->db->where('finished', 1);
        $q = $this->db->get('lotteries');

        if ($q->num_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    function hasExpired($id) {
        $this->db->where('id', $id);
        $this->db->where('end <=', date('Y-m-d H:i:s'));

        $q = $this->db->get('lotteries');

        if ($q->num_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    function sessionExists() {
        $this->db->where('end >=', date('Y-m-d H:i:s'));
        $this->db->where('finished', 0);
        $q = $this->db->get('lotteries');
        return $q->num_rows();
    }


    function createLottery($id, $data) {

        if ($this->sessionExists()) {
            return false;
        }

        $data['end'] = date('Y-m-d H:i:s', strtotime("+ {$data['days']} days"));
        unset($data['days']);
        if (!$id) {
            // default data if lottery is new
            $data['created'] = date('Y-m-d H:i:s');
            $data['finished'] = 0;
            $data['created_by'] = $this->user->getId();
            if ($this->db->insert('lotteries', $data)) {
                return $this->db->insert_id();
            }
        } else {
            $this->db->where('id', $id);
            if ($this->db->update('lotteries', $data)) {
                return true;
            }
        }
        // unextected error?!?!
        return false;
    }

}
