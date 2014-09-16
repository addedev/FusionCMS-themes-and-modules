<?php

class Current_lottery extends MX_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function view () {
        return $this->template->loadPage("current_lottery_wrapper.tpl", array(
            "module" => "sidebox_current_lottery",
        ));
    }

}
