<?php

/**
 * @property Internal_user_model internal_user_model
 * @property User user
 * @property External_account_model external_account_model
 */
class Ucp extends MX_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->user->userArea();

        $this->load->config('links');
    }

    public function index()
    {
        requirePermission("view");

        $this->template->setTitle(lang("user_panel", "ucp"));

        $cache = $this->cache->get("profile_characters_".$this->user->getId());

        if($cache !== false)
        {
            $characters = $cache;
        }
        else
        {
            $characters_data = array(
                "characters" => $this->realms->getTotalCharacters(),
                "realms" => $this->realms->getRealms(),
                "url" => $this->template->page_url,
                "realmObj" => $this->realms
            );

            $characters = $this->template->loadPage("ucp_characters.tpl", $characters_data);

            $this->cache->save("profile_characters_".$this->user->getId(), $characters, 60*60);
        }

        $data = array(
            "vp" => $this->internal_user_model->getVp(),
            "dp" => $this->internal_user_model->getDp(),
            "status" => $this->user->getAccountStatus(),
            "characters" => $characters,
            "id" => $this->user->getId(),
            "last_login" => $this->external_account_model->getLastLogin(),
            "ip_address" => $_SERVER["REMOTE_ADDR"],
            "char_count" => $this->realms->getTotalCharacters(),
            "market_pp" => 0, // TODO
            "privileges" => [
                lang("none", "ucp")
            ],

            "config" => array(
                "vote" => $this->config->item('ucp_vote'),
                "donate" => $this->config->item('ucp_donate'),
                "store" => $this->config->item('ucp_store'),
                "settings" => $this->config->item('ucp_settings'),
                "teleport" => $this->config->item('ucp_teleport'),
            )
        );

        $this->template->view($this->template->loadPage("page.tpl", array(
            "module" => "default",
            "headline" => lang("user_panel", "ucp"),
            "content" => $this->template->loadPage("ucp.tpl", $data)
        )), "modules/ucp/css/ucp.css");
    }
}
