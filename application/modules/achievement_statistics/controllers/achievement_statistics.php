<?php

/**
 * @property Achi_Stats_model achi_stats_model
 */
class Achievement_Statistics extends MX_Controller
{
    function __construct()
    {
        //Call the constructor of MX_Controller
        parent::__construct();

        $this->load->model("achi_stats_model");
        $this->load->config('achievement_statistics/config');
    }

    public function index($RealmId = false)
    {
        $user_id = $this->user->getId();

        $data = array(
            'user_id' => $user_id,
            'realms_count' => count($this->realms),
            'selected_realm' => $RealmId,
            'url' => $this->template->page_url,
        );

        // Get the realms
        if (count($this->realms) > 0) {
            /** @var Realm $realm */
            foreach ($this->realms->getRealms() as $realm) {
                //Set the first realm as realmid
                if (!$RealmId) {
                    $RealmId = $realm->getId();
                    $data['selected_realm'] = $RealmId;
                }

                $data['realms'][$realm->getId()] = array('name' => $realm->getName());
            }
        }

        //Set the realm id for the data model
        $this->achi_stats_model->setRealm($RealmId);

        $data['TopAchievements'] = $this->achi_stats_model->getAchievementPoints($this->config->item("instance_player_limit"));

        $output = $this->template->loadPage("index.tpl", $data);

        $this->template->box(lang("statistics_title", "achievement_statistics"), $output, true, "modules/achievement_statistics/css/style.css", "modules/achievement_statistics/js/scripts.js");
    }
}
