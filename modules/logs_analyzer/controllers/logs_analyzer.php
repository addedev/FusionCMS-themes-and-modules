<?php

/*

GM Logs Analyzer
Copyright SimionBaws, 2013

For support: simion.agv@gmail.com

*/

class Logs_analyzer extends MX_Controller {

    public function __construct() {
        $this->load->library('administrator');
        $this->load->library('javascript');
        $this->load->config('logs');
        $this->load->config('wow_zones');

        parent::__construct();

    }

    private function _error($message, $class = 'error') {
        die("<div class='message {$class}'>{$message}</div>");
    }

	public function index() {

        $data = array(
            'logsListUrl' => site_url('logs_analyzer/logsList')
        );


        $this->administrator->setTitle("GM Logs Analyzer");


        // Load the view and pass the data
        $content = $this->template->loadPage("gmLogs.tpl", $data);

        // Put the view in a nice content box with a headline
        $page = $this->administrator->box("GM Logs Analyzer", $content);

        // Output the view
        $this->administrator->view($page, "modules/logs_analyzer/assets/css/logs.css");
    }

    public function logsList() {

        $filePath = $this->config->item('logs_file_path');

        if (!strlen($filePath)) {
            $this->_error('Log file path is not set.');
        }

        // prepare filter
        $filter = null;
        if (isset($_GET['filter'])) {
            $filter = $_GET['filter'];
        }

        $logs = $this->_getAsArray($filePath, $filter);


        if (!$logs && $filter) {
            $this->_error('No results. Please review your filter.');
        }
        if (!$logs) {
            die('No logs to display');
        }

        $data = array(
            'logs' => $logs,
        );

        die($this->template->loadPage("logsList.tpl", $data));

    }

    private function _getAsArray($file, $filter = null) {
        // $handle = fopen($file, 'r');
        // if (!$handle) {
        //     echo 'no :(';
        //     return false;
        // }
        $lines = array();
        $i = 0;
        $file_lines = file($file);
        foreach($file_lines as $LL) {
            $i++;
            $line = $this->_parseLine($LL, $i);
            if ($filter) {
                if ($this->_filter($line, $filter)) {
                    $lines[] = $line;
                }
            } elseif ($line) {
                    $lines[] = $line;
            }
        }


        if ($this->config->item('last_commands_first')) {
            $lines = array_reverse($lines);
        }

        return $lines;
    }

    private function _filter($line, $filter) {
        foreach($filter as $k => $v) {
            // if user completed this field
            if (strlen($v)) {
                $line[$k] = strtolower($line[$k]);
                $v = strtolower($v);
                if (strpos($line[$k], $v) === false) {
                    return false;
                }
            }
        }
        return true;
    }

    private function _parseLine($line, $i) {

        $tags = array();
        $rowClass = 'default';

        $command = $this->_extract('Command: .', '[Player', $line);
        if (!$command) {
            return false;
        }
        $command_text = $command;
        $base_command = $this->_extract('Command: .', ' ', $line);

        if ($this->config->item('enable_wowhead_links')) {
            if (strpos('.'.$base_command, '.add') !== false) {
                $item_id = $this->_extract(".{$base_command} ", ' ', $line);
                if ($item_id) {
                    $command_text = "{$base_command} <a href='http://wowhead.com/item={$item_id}' rel='item={$item_id}'>{$item_id}</a>";
                }
            } elseif (strpos('.'.$base_command, '.lea') !== false) {
                $spell_id = $this->_extract(".{$base_command} ", ' ', $line);
                if (is_numeric($spell_id)) {
                    $command_text = "{$base_command} <a href='http://wowhead.com/spell={$spell_id}' rel='spell={$spell_id}'>{$spell_id}</a>";
                }
            }
        }

        $tags[] = array(
            'class' => 'crt-number',
            'text' => "{$i}. "
        );

        $player = $this->_extract('Player: ', ' ', $line, true);
        $tags[] = array(
            'class' => 'gamemaster-name',
            'text' => $player
        );

        $selected_player = $this->_extract('Selected player: ', ' ', $line, true);
        // gm excuted command on someone else
        if (strlen($selected_player) && $selected_player != $player) {
            $tags[] = array(
                'class' => 'selected-user-name',
                'text' => "-> <span class='selected-p'>{$selected_player}</span>"
            );
            $rowClass = 'other-player';
        }


        $tags[] = array(
            'class' => 'command c-'.$command,
            'text' => ".{$command_text}"
        );

        $tags[] = array(
            'class' => 'world-map-zone',
            'text' => $this->_zone($this->_extract('Map: ', ' ', $line, true))
        );


        // $tags[] = array(
        //     'class' => 'user-id',
        //     'text' => "(" . $this->_extract('(Account:', ')', $line, true) . ")"
        // );

        return array(
            'visible' => $tags,
            'rowClass' => $rowClass,
            // attrs for filtering
            'player' => $player,
            'command' => '.'.$command,
            'selected_player' => $selected_player,
        );
    }

    private function _extract($start, $end, $str, $trim = false, $ucfirst = false) {

        if (!$str || !$start && !$end) {
            return '';
        }
        $x = explode($start, $str);
        if (!isset($x[1])) {
            return '';
        }

        $x2 = explode($end, $x[1]);

        if (isset($x2[0])) {
            $result = $x2[0];
        } else {
            $result = $x[1];
        }

        if ($trim) {
            $result = trim($result);
        }

        if ($ucfirst) {
            $result = ucfirst($result);
        }

        return $result;
    }

    private function _zone($id) {

        $zones = $this->config->item('zones');
        if (isset($zones[$id])) {
            return $zones[$id];
        }
        return '';
    }

}
