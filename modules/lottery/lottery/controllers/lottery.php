<?php

/**
 * @package Lottery
 * @version 1.0
 * @author Simion Agavriloaei
 * @link
 */

class Lottery extends MX_Controller {

    private $css;
    private $js;
    private $characters = array();

    public function __construct() {

        $this->load->config('lottery/lottery_config');
        $this->load->config('lottery/lottery_error_messages');
        $this->load->model('Lottery_session');
        $this->load->model('Lottery_participant');
        $this->load->model('Lottery_winner');
        // $this->load->model('armory_model');
        $this->load->library('lottery/general');
        $this->css = "modules/lottery/assets/css/lottery.css";
        $this->js = "modules/lottery/assets/js/lottery.js";

        parent::__construct();

    }

    private function _error($message) {
        $data = array(
            "module" => "lottery",
            "headline" => "Lottery",
            "content" => "<div class='missing-content'>{$message}</div>"
        );
        $this->template->setTitle('Error - Lottery');
        $page = $this->template->loadPage('page.tpl', $data);
        $this->template->view($page, $this->css, $this->js);
        die();
    }

    public function finalize($id) {
        // check if we must generate winners
        if (!$this->Lottery_session->isFinalized($id) && $this->Lottery_session->hasExpired($id)) {
            $this->Lottery_session->finalize($id);
            // run the algorithm
            return $this->generateWinners($id);
        }
    }

    private function generateWinners($id) {
        // damn...
        $participants = $this->Lottery_participant->getAll($id);
        $lottery = $this->Lottery_session->get($id);
        $count = count($participants);
        $winners = array();
        for ($i = 1; $i <= $lottery->winners_count; $i++) {
            shuffle($participants);
            $random_index = rand(0, count($participants) - 1);
            $winners[$i] = $participants[$random_index];
            unset($participants[$random_index]);
            $participants = array_values($participants);
        }
        foreach($winners as $winner) {
            $this->Lottery_winner->saveWinner($lottery->id, $winner->id);
        }
        return true;
    }

    public function navigation($active) {
        $data = array(
            "module" => "lottery",
            "active" => $active,
            "url" => $this->template->page_url,
        );
        $menu = $this->template->loadPage('navigation.tpl', $data);
        die($menu);
    }

    public function edition($id = null) {
        Modules::run('login/is_logged_in');
        $lottery = $this->Lottery_session->get($id);
        if (!$lottery) {
            $this->_error('The lottery edition you are looking for does not exist');
        }
        $characters = $this->_getAllCharacters();
        if (!$characters) {
            $this->_error($this->config->item('error_message_no_characters'));
        }

        $title = "Lottery edition #{$lottery->id}, " . date('d M Y');
        $this->template->setTitle($title);


        // prepare all data
        $view_data = array(
            "module" => "lottery",
            "lottery" => $lottery,
            "cost" => $this->parseCost(array(
                'vp' => $lottery->vp,
                'dp' => $lottery->dp
            )),
            "user_id" => $this->user->getId(),
            "isFinalized" => $this->Lottery_session->isFinalized($lottery->id),
            "hasExpired" => $this->Lottery_session->hasExpired($lottery->id),
            "participant" => $this->Lottery_participant->get($lottery->id),
            "characters" => $characters,
            "expiresIn" => $this->_expiresInFormatted($lottery->end),
            "General" => General::getInstance(),
            "url" => $this->template->page_url,
        );

        if ($view_data['hasExpired'] && !$view_data['isFinalized']) {
            $view_data['isFinalized'] = $this->finalize($lottery->id);
        }

        // get winners
        if ($view_data['isFinalized']) {
            $winners = $this->Lottery_winner->getAll($lottery->id);
            $winners_chars = array();
            foreach($winners as $k => $p) {
                $char = $this->getChar($p->realm_id, $p->character_guid);
                if ($char) {
                    $winners_chars[] = array_merge($char, array(
                        'rank' => $k+1
                    ));
                }
            }
            $view_data['winners'] = $winners_chars;
        }

        $view = $this->template->loadPage('view.tpl', $view_data);

        // last part
        $page_data = array(
            "module" => "lottery",
            "headline" => $title,
            "content" => $view,
        );
        $page = $this->template->loadPage('page.tpl', $page_data);
        $this->template->view($page, $this->css, $this->js);
    }

    public function history() {

        $this->template->setTitle('Lottery editions history');

        $view_data = array(
            'module' => 'lottery',
            'url' => $this->template->page_url,
            'lotteries' => $this->Lottery_session->getLotteries()
        );
        $view = $this->template->loadPage('history.tpl', $view_data);
        $page_data = array(
            "module" => "lottery",
            "headline" => 'Lottery editions history',
            "content" => $view,
        );
        $page = $this->template->loadPage('page.tpl', $page_data);
        $this->template->view($page, $this->css);
    }

    public function index() {
        Modules::run('login/is_logged_in');
        // check for existing lottery and redirect player to it
        $lottery_id = $this->Lottery_session->last();

        if ($lottery_id) {
            redirect('/lottery/edition/' . $lottery_id);
        }

        $this->_error($this->config->item('error_message_no_lottery_started'));
    }

    public function subscribe () {
        $this->load->model('vote/vote_model');

        Modules::run('login/is_logged_in');
        $data = $this->input->post();
        if (!$this->realms->realmExists($data['realm_id'])) {
            die('That realm does not exist');
        }


        // get subscription cost
        $cost = $this->Lottery_session->cost($data['lottery_id']);

        if ($cost['vp'] || $cost['dp']) {
            // check for vp/dp cost
            $vp = $this->internal_user_model->getVp();
            $dp = $this->internal_user_model->getDp();
            if ($cost['vp'] > $vp || $cost['dp'] > $dp) {
                die("You need " . $this->parseCost($cost) . " to subscribe your character");
            }
        }


        // if ($this->user->isGm()) {
        //     die($this->config->item('error_message_no_staff_allowed_to_subscribe'));
        // }
        //
        // chech if character is yours
        if (!isset($this->characters[$data['realm_id']])) {
            $realm = $this->realms->getRealm($data['realm_id']);
            $this->characters[$data['realm_id']] = $realm->getCharacters();
            $belongs = $this->characters[$data['realm_id']]->characterBelongsToAccount($data['character_guid'], $data['account_id']);
            if (!$belongs) {
                die ('That character does not belong to you');
            }
        }
        die($this->Lottery_participant->add($data, $cost));
    }

    private function parseCost($c) {
        $str = '';
        if ($c['vp']) {
            $str .= "{$c['vp']} voting points";
        }
        if ($c['vp'] && $c['dp']) {
            $str .= " and ";
        }
        if ($c['dp']) {
            $str .= "{$c['dp']} donation points";
        }
        if (empty($str)) {
            $str = 'no cost';
        }
        return "<span class='lottery-cost'>{$str}</span>";
    }


    public function participants($lottery_id) {
        $participants = $this->Lottery_participant->getAll($lottery_id);
        $characters = array();
        foreach($participants as $p) {
            $char = $this->getChar($p->realm_id, $p->character_guid);
            if ($char) {
                $characters[] = $char;
            }
        }
        $page = $this->template->loadPage('participants.tpl', array(
            'characters' => $characters,
            "module" => "lottery",
        ));
        die($page);
    }


    private function _getAllCharacters($user_id = null) {
        if (!$user_id) {
            $user_id = $this->user->getId();
        }
        $characters = array();
        foreach ($this->realms->getRealms() as $realm) {
            $realm_characters = $realm->getCharacters()->getCharactersByAccount($user_id);
            if (is_array($realm_characters)) {
                foreach($realm_characters as $character) {
                    $characters[] = array_merge(
                        $character,
                        array(
                            'realm_id' => $realm->getId(),
                            'realm_name' => $realm->getName(),
                        )
                    );
                }
            }
        }
        if (!count($characters)) {
            return false;
        }
        return $characters;
    }

    private function getChar($realm_id, $guid) {
        if (!$this->realms->realmExists($realm_id)) {
            return false;
        }

        $realm = $this->realms->getRealm($realm_id);
        if (!isset($this->characters[$realm_id])) {
            $this->characters[$realm_id] = $realm->getCharacters();
        }
        $name = $this->characters[$realm_id]->getNameByGuid($guid);
        if (!$name) {
            $name = '[unknown character]';
        }
        return array(
            'id' => $guid,
            'name' => $name,
            'realm_id' => $realm_id,
            'anchor' => anchor("character/{$realm_id}/{$guid}", $name)
        );
    }

    private function _formatInterval(DateInterval $interval) {
        $result = "";
        if ($interval->y) { $result .= $interval->format("<span>%y</span>y "); }
        if ($interval->m) { $result .= $interval->format("<span>%m</span>m "); }
        if ($interval->d) { $result .= $interval->format("<span>%d</span>d "); }
        if ($interval->h) { $result .= $interval->format("<span>%h</span>h "); }
        if ($interval->i) { $result .= $interval->format("<span>%i</span>m "); }
        // if ($interval->s) { $result .= $interval->format("<span>%s</span>s "); }

        return $result;
    }

    private function _expiresInFormatted($end_date) {
        $first_date = new DateTime(date('Y-m-d H:i:s', strtotime($end_date)));
        $second_date = new DateTime(date('Y-m-d H:i:s'));
        $difference = $second_date->diff($first_date);

        return $this->_formatInterval($difference);
    }

    public function get_winners($id) {
        $winners = $this->Lottery_winner->getAll($id);
        $winners_chars = array();
        foreach($winners as $k => $p) {
            $char = $this->getChar($p->realm_id, $p->character_guid);
            if ($char) {
                $winners_chars[] = array_merge($char, array(
                    'rank' => $k+1
                ));
            }
        }
        return $winners_chars;
    }
}
