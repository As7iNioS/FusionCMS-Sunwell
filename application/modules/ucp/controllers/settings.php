<?php

class Settings extends MX_Controller
{
    function __construct()
    {
        //Call the constructor of MX_Controller
        parent::__construct();

        $this->load->config('settings');

        //Make sure that we are logged in
        $this->user->userArea();
    }

    public function index()
    {
        requirePermission("canUpdateAccountSettings");

        clientLang("pw_doesnt_match", "ucp");
        clientLang("changes_saved", "ucp");
        clientLang("invalid_pw", "ucp");

        $this->template->setTitle(lang("settings", "ucp"));

        $data = array(
            "module" => "default",
            "headline" => breadcumb(array(
                            "ucp" => lang("ucp"),
                            "ucp/settings" => lang("settings", "ucp")
                        )),
            "content" => $this->template->loadPage("settings.tpl")
        );

        $page = $this->template->loadPage("page.tpl", $data);

        //Load the template form
        $this->template->view($page, false, "modules/ucp/js/settings.js");
    }

    public function submit()
    {
        $oldPassword = $this->input->post('old_password');
        $newPassword = $this->input->post('new_password');

        if($oldPassword && $newPassword)
        {
            // Get the current password
            $currentPassword = $this->user->getPassword();

            // Hash the entered password
            $passwordHash = $this->user->createHash($this->user->getUsername(), $oldPassword);

            // Check if passwords match
            if(strtoupper($currentPassword) == strtoupper($passwordHash))
            {
                $hash = $this->user->createHash($this->user->getUsername(), $newPassword);

                $this->user->setPassword($hash);

                $this->plugins->onChangePassword($this->user->getId(), $hash);
            }
            else
            {
                die('no');
            }
        }

        die('yes');
    }
}
