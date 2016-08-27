<?php

/**
 * @property PvE_Stats_model pve_stats_model
 */
class PVE_Statistics extends MX_Controller
{
    function __construct()
    {
        //Call the constructor of MX_Controller
        parent::__construct();

        $this->load->model("pve_stats_model");
        $this->load->config('pve_statistics/pve_config');
    }

    public function index($RealmId = false, $instanceName = "")
    {
        $user_id = $this->user->getId();

        $instances = $this->pve_stats_model->GetInstances();
        $data = array(
            'user_id' => $user_id,
            'realms_count' => count($this->realms),
            'instances_count' => count($instances["dungeons"]) + count($instances["raids"]),
            'dungeons' => $instances["dungeons"],
            'raids' => $instances["raids"],
            'selected_realm' => $RealmId,
            'selected_instance' => $instanceName,
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
        $this->pve_stats_model->setRealm($RealmId);

        if (array_key_exists($instanceName, $instances["dungeons"])){
            $instance = $instances["dungeons"][$instanceName];
        } elseif (array_key_exists($instanceName, $instances["raids"])){
            $instance = $instances["raids"][$instanceName];
        } else {
            $instance = null;
        }

        if ($instance){
            // Run query - $instance['ids'];
            $data['TopPvEKills'] = $this->pve_stats_model->getInstanceRuns($instance, $instanceName, $this->config->item("instance_player_limit"));
        } else {
            $data['TopPvEKills'] = null;
        }

        $output = $this->template->loadPage("index.tpl", $data);

        $this->template->box(lang("statistics_title", "pve_statistics"), $output, true, "", "modules/pve_statistics/js/scripts.js");
    }
}
