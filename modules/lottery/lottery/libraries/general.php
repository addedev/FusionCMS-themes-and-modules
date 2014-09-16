<?php
class General {

    private static $instance = false;

    public static function getInstance() {
        if (!self::$instance) {
          self::$instance = new General();
        }

        return self::$instance;
      }
    public function formatRewards($data, $itemList = true) {
        if ($itemList) {
            $ids = $this->extractRewardsIds($data);
            $html = '<div class="reward-items">';
            foreach($ids as $id) {
                if ($id[1] > 1) {
                    $html .= $id[1] . " x ";
                }
                $html .= "<a href='http://wowhead.com/item={$id[0]}' rel='item={$id[0]}'>{$id[0]}</a>, ";
            }
            return $html;
        } else {
            return $data;
        }
    }

    public function extractRewardsIds($data) {
        $ids = explode(',', $data);
        $list = array();
        foreach ($ids as $id) {
            $id = trim($id);
            if (strpos($id, 'x') !== false) {
                // we have a multiplier
                $x = explode('x', $id);
                $id = $x[1];
                $multiplier = $x[0];
            } else {
                $multiplier = 1;
            }
            $list[] = array($id, $multiplier);
        }
        return $list;
    }


}
