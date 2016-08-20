<?php

/**
 * @property Internal_user_model user
 */
class Info_login extends MX_Controller
{
    public function view()
	{

		if($this->user->isOnline())
		{
			$data = array(
					"module" => "sidebox_info_login",
					"url" => $this->template->page_url,
                    "login" => $this->user->getNickname()
				);

			$page = $this->template->loadPage("info.tpl", $data);
		}
		else
		{
			$this->load->helper('form');

			$data = array(
					"module" => "sidebox_info_login",
					"url" => $this->template->page_url,
				);

			$page = $this->template->loadPage("login.tpl", $data);
		}

		return $page;
	}
}
