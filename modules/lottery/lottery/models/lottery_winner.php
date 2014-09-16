<?php

class Lottery_winner extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function saveWinner($lottery_id, $participant_id) {
        $this->db->insert('lottery_winners', array(
            'lottery_id' => $lottery_id,
            'participant_id' => $participant_id,
            'created' => date('Y-m-d H:i:s')
        ));
    }

    function getAll($lottery_id) {
        $this->db->select('lottery_participants.*');
        $this->db->where('lottery_winners.lottery_id', $lottery_id);
        $this->db->join('lottery_participants', 'lottery_winners.participant_id = lottery_participants.id');
        $q = $this->db->get('lottery_winners');
        return $q->result();
    }

}
