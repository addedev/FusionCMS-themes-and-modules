<?php
class Status extends MX_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('lottery/Lottery_session');
        $this->load->model('lottery/Lottery_winner');
        $this->load->model('lottery/Lottery_participant');
    }
    public function index() {
        // get current lottery data
        $lottery = $this->Lottery_session->last(true);

        if (!$lottery) {
            die('No lottery started yet');
        }

        $data = array(
            "module" => "sidebox_current_lottery",
            "lottery" => $lottery,
            "url" => $this->template->page_url,
            "hasExpired" => $this->Lottery_session->hasExpired($lottery->id),
            "cost" => $this->parseCost(array(
                'vp' => $lottery->vp,
                'dp' => $lottery->dp
            ))
        );

        $isFinalized = $this->Lottery_session->isFinalized($lottery->id);
        $data["isFinalized"] = $isFinalized;
        if ($data['hasExpired'] && !$data['isFinalized']) {
            $data['isFinalized'] = Modules::run('lottery/finalize', $lottery->id);
            $isFinalized = true;
        }

        if ($isFinalized) {
            // current lottery is finalized, but there are no other lotteries started
            // get the winneras
            $data["winners"] = Modules::run('lottery/get_winners', $lottery->id);
        } elseif ($data["hasExpired"]) {
            // has
        }

        // so, lottery is ongoing, count number of subscribers
        $data["expiresIn"] = $this->_expiresInFormatted($lottery->end);
        $data["participantsCount"] = $this->Lottery_participant->count($lottery->id);
        $data["edition"] = "#{$lottery->id}, ".date('d F Y');
        $data["isSubscribed"] = $this->Lottery_participant->userIsSubscribed($this->user->getId(), $lottery->id);

        $page = $this->template->loadPage('status.tpl', $data);
        die($page);
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

}
