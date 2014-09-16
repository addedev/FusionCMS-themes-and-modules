<?php
/**
 * @package Lottery
 * @version 1.0
 * @author Simion Agavriloaei
 * @link
 */

class Admin extends MX_Controller {

    public function __construct() {
        $this->load->library('administrator');
        $this->load->model('Lottery_session');
        $this->load->helper('tinymce_helper');
        $this->load->config('lottery_config');
        parent::__construct();
    }

    public function index() {
        $this->administrator->setTitle('Lottery');

        $data = array(
            'url' => $this->template->page_url,
            'vp' => $this->config->item('default_vote_points_required_for_subscription'),
            'dp' => $this->config->item('default_donation_points_required_for_subscription'),
            'lotteries' => $this->Lottery_session->getLotteries()
        );
        // load view
        $output = $this->template->loadPage('admin_lottery.tpl', $data);
        // put view in a box
        $content = $this->administrator->box('Lottery', $output);
        // output to admin
        $this->administrator->view($content, "modules/lottery/assets/css/lottery.css", "modules/lottery/assets/js/admin_lottery.js");
    }

    public function create($id = null) {

        if ($this->Lottery_session->sessionExists()) {
            die('An active lottery session is currently running. <br/>
                You cannot start two lottery sessions at a time');
        }

        $data = $this->input->post();

        $postArticle = $data['post_article'];
        unset($data['post_article']);

        if ($data['days'] <= 1 || !is_numeric($data['days'])) {
            die("Invalid number of days");
        }
        if (!$data['winners_count']) {
            die('Invalid number of winners');
        }

        $lottery_id = $this->Lottery_session->createLottery($id, $data);

        // if new, post article
         /*$this->administrator->isEnabled("news") &&*/
        if (!$id && $postArticle && $lottery_id) {
            // post article
            $this->load->model('news/news_model');

            // add some data to content
            $banner = $this->config->item('lottery_banner_for_news_article');
            if (strlen($banner)) {
                $img = "<img src='{$banner}'>";
            } else {
                $img = '';
            }
            $head_content = "
                <div class='lottery-summary-article'>
                    <div style='text-align:center'>{$img}</div>
                    <b>Start date:</b> " . date('d F') . " <br/>
                    <b>End date: " . date('d F, h:i A', strtotime("+ {$data['days']} days")) . "</b> <br/>
                    <b>Number of winners: </b> {$data['winners_count']} <br/>
                    <b>Rewards:</b> {$data['rewards']} <br/>
                    " . anchor("lottery/edition/".$lottery_id, 'Click here to subscribe your character', array('data-direct' => '1')) . "
                    <br/>
                    <br/>
                </div>";
            $content = $head_content . $data['description'];
            $content .= '<i style="font-size: 10px; padding-top: 10px 0; display: block;">This article was published automatically</i>';
            $headline = str_replace('[id]', $lottery_id, $this->config->item('automatic_article_title'));
            $this->news_model->create($headline, '', false, $content);
            $this->cache->delete('news_*.cache');
        }

        if ($lottery_id) {
            die("yes");
        }

        die("Unexpected error :(");
    }

    public function delete($id) {
        $this->Lottery_session->delete($id);
        die("Lottery #{$id} has been deleted");
    }


}
