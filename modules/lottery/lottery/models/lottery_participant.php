<?php

class Lottery_participant extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function add($data, $cost) {

        $this->load->model('Lottery_session');
        $this->load->model('vote/vote_model');
        $this->load->model('donate/donate_model');

        // check if lottery is open
        if ($this->Lottery_session->hasExpired($data['lottery_id'])) {
            return "Lottery edition has expired or is invalid";
        }
        // check if character belongs to user
        // $isOwner = $characters->characterBelongsToAccount($data['character_guid'], $data['account_id']);
        // if (!$isOwner) {
        //     return "That character does not belong to you";
        // }

        // check if user does not have another character subscribed
        if ($this->get($data['lottery_id'])) {
            return "You already subscribed a character.";
        }


        // get subscription cost
        if ($cost['vp'] || $cost['dp']) {
            $this->vote_model->updateVp($this->user->getId(), - $cost['vp']);
            $this->donate_model->giveDP($this->user->getId(), - $cost['dp']);
        }

        // all godd, subscribe him
        $this->db->insert('lottery_participants', array_merge($data, array(
            'created' => date('Y-m-d H:i:s'),
        )));
        return "yes";
    }

    function getAll($lottery_id) {
        $this->db->where('lottery_id', $lottery_id);
        $q = $this->db->get('lottery_participants');
        return $q->result();
    }

    function get($lottery_id, $user_id = null) {
        if (!$user_id) {
            $user_id = $this->user->getId();
        }
        $this->db->where('account_id', $user_id);
        $this->db->where('lottery_id', $lottery_id);
        $q = $this->db->get('lottery_participants');
        if (!$q->num_rows()) {
            // not participant :(
            return false;
        }
        return $q->row();
    }

    function count($id) {
        $this->db->select('count(*) as count');
        $this->db->where('lottery_id', $id);
        return $this->db->count_all_results('lottery_participants');
    }

    function userIsSubscribed($user_id, $lottery_id) {
        $this->db->where('account_id', $user_id);
        $this->db->where('lottery_id', $lottery_id);
        return $this->db->count_all_results('lottery_participants');
    }
}
