<?php

class Suggestion extends MX_Controller
{
        public function __construct()
        {
                parent::__construct();

                Modules::run('login/is_logged_in');
        }

        public function index()
        {
                $this->load->model('viewModel');
                $rows = $this->viewModel->get();

                foreach($rows as $key => $value)
                {
                        $rows[$key]['nickname'] = $this->user->getNickname($value['user_id']);
                }
                $data = array(
                        "rows" => $rows
                );


                $content = $this->template->loadPage("make.tpl");


                $box = $this->template->box("Submit suggestion", $content);

                // Output the view
                $this->template->view($box, "modules/suggestion/css/main.css");

        }

        public function submit()
        {
                $this->load->model('makeModel');
                $querys = $this->makeModel->submit();
                $content = $this->template->loadPage("success.tpl");
                $box = $this->template->box("Success!", $content);
                $this->template->view($box);
        }
        public function view($id = false)
        {
                    if(!$this->user->isGm())
                {
                        redirect('error/rank');
                        die();
                }
                $this->load->model('viewModel');
                $rows = $this->viewModel->get();

                foreach($rows as $key => $value)
                {
                        $rows[$key]['nickname'] = $this->user->getNickname($value['user_id']);
                }
                $data = array(
                        "rows" => $rows
                );


                $contents = $this->template->loadPage("view.tpl", $data);


                $box = $this->template->box("Suggestions", $contents);

                // Output the view
                $this->template->view($box, "modules/suggestion/css/main.css");
                }
        }
        