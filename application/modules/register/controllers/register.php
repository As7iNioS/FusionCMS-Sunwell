<?php

/**
 * @property User user
 * @property Activation_model activation_model
 * @property External_account_model external_account_model
 */
class Register extends MX_Controller
{
    private $usernameError;
    private $emailError;

    public function __construct()
    {
        parent::__construct();

        // Make sure that we are not logged in yet
        $this->user->guestArea();

        requirePermission("view");

        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');

        $this->load->helper('email_helper');

        $this->load->config('bridge');
        $this->load->config('activation');
        $this->load->config('captcha');

        $this->load->model('activation_model');
    }

    public function index()
    {
        clientLang("username_limit_length", "register");
        clientLang("username_limit", "register");
        clientLang("username_not_available", "register");
        clientLang("email_not_available", "register");
        clientLang("email_invalid", "register");
        clientLang("password_short", "register");
        clientLang("password_match", "register");

        $this->template->setTitle(lang("register", "register"));

        //Load the form validations for if they tried to sneaky bypass our js system
        $this->form_validation->set_rules('register_username', 'username', 'trim|required|min_length[4]|max_length[14]|xss_clean|alpha_numeric');
          $this->form_validation->set_rules('register_email', 'email', 'trim|required|valid_email|xss_clean');
        $this->form_validation->set_rules('register_password', 'password', 'trim|required|min_length[6]|xss_clean');
        $this->form_validation->set_rules('register_password_confirm', 'password confirmation', 'trim|required|matches[register_password]|xss_clean');

        $this->form_validation->set_error_delimiters('<img src="'.$this->template->page_url.'application/images/icons/exclamation.png" data-tip="', '" />');

        require_once('application/libraries/captcha.php');

        $captchaObj = new Captcha($this->config->item('use_captcha'));

        if(count($_POST))
        {
            $emailAvailable = $this->email_check($this->input->post('register_email'));
            $usernameAvailable = $this->username_check($this->input->post('register_username'));
        }
        else
        {
            $emailAvailable = false;
            $usernameAvailable = false;
        }

        //Check if everything went correct
        if($this->form_validation->run() == FALSE
        || strtoupper($this->input->post('register_captcha')) != strtoupper($captchaObj->getValue())
        || !count($_POST)
        || !$usernameAvailable
        || !$emailAvailable)
        {
            $fields = array('username', 'email', 'password', 'password_confirm');

            $data = array(
                        "username_error" => $this->usernameError,
                        "email_error" => $this->emailError,
                        "password_error" => "",
                        "password_confirm_error" => "",
                        "use_captcha" => $this->config->item('use_captcha'),
                        "captcha_error" => "",
                        "url" => $this->template->page_url
                    );

            if(count($_POST) > 0)
            {
                // Loop through fields and assign error or success image
                foreach($fields as $field)
                {
                    if(strlen(form_error('register_' . $field)) == 0 && empty($data[$field."_error"]))
                    {
                        $data[$field."_error"] = '<img src="'.$this->template->page_url.'application/images/icons/accept.png" />';
                    }
                    elseif(empty($data[$field."_error"]))
                    {
                        $data[$field."_error"] = form_error('register_' . $field);
                    }
                }

                if($this->input->post('register_captcha') != $captchaObj->getValue())
                {
                    $data['captcha_error'] = '<img src="'.$this->template->page_url.'application/images/icons/exclamation.png" />';
                }
            }

            // If not then display our page again
            $this->template->view($this->template->loadPage("page.tpl", array(
                "module" => "default",
                "headline" => "Account creation",
                "content" => $this->template->loadPage("register.tpl", $data),
            )), false, "modules/register/js/validate.js", "Account Creation");
        }
        else
        {
            if(!$this->username_check($this->input->post("register_username")))
            {
                die();
            }

            // Show success message
            $data = array(
                        "url" => $this->template->page_url,
                        "account" => $this->input->post('register_username'),
                        "bridgeName" => $this->config->item('forum_bridge'),
                        "username" => $this->input->post('register_username'),
                        "email" => $this->input->post('register_email'),
                        "password" => $this->input->post('register_password'),
                        "email_activation" => $this->config->item('enable_email_activation')
                    );

            if($data["email_activation"])
            {
                $key = $this->activation_model->add($data["username"], $data["password"], $data["email"]);

                $link = base_url().'register/activate/'.$key;

                sendMail($data["email"], $this->config->item('activation_sender_mail'), $this->config->item('server_name').': activate account', 'You have created the account '.$data["username"].', please go here to activate it: <a href="'.$link.'">'.$link.'</a>');
            }
            else
            {
                //Register our user.
                $this->external_account_model->createAccount($data["username"], $data["password"], $data["email"]);

                if($this->config->item('use_forum_bridge'))
                {
                    if(file_exists('application/modules/register/plugins/'.$this->config->item('forum_bridge').".php"))
                    {
                        //$this->plugins->{$this->config->item('forum_bridge')}->register($data['username'], $data['password'], $data['email']);
                    }
                    else
                    {
                        show_error("The forum bridge <b>".$this->config->item('forum_bridge')."</b> does not exist in <b>application/modules/register/plugins/</b>");
                        die();
                    }
                }

                // Log in
                $sha_pass_hash = $this->user->createHash($data["username"], $data["password"]);
                $check = $this->user->setUserDetails($data["username"], $sha_pass_hash);
            }

            $title = ($data['email_activation']) ? lang("confirm_account", "register") : lang("created", "register");

            $this->template->view($this->template->box($title, $this->template->loadPage("register_success.tpl", $data)));
        }
    }

    public function email_check($email)
    {
        if(!$this->external_account_model->emailExists($email))
        {
            $this->emailError = '';

            // The email does not exists so they can register
            return true;
        }
        else
        {
            // Email exists
            $this->emailError = '<img src="'.$this->template->page_url.'application/images/icons/exclamation.png" data-tip="This email is not available" />';

            return false;
        }
    }

    public function username_check($username)
    {
        if(!$this->external_account_model->usernameExists($username))
        {
            $this->usernameError = '';

            // The user does not exists so they can register
            return true;
        }
        else
        {
            // User exists
            $this->usernameError = '<img src="'.$this->template->page_url.'application/images/icons/exclamation.png" data-tip="This username is not available" />';

            return false;
        }
    }

    public function activate($key = false)
    {
        if(!$key)
        {
            $this->template->box(lang("invalid_key", "register"), lang("invalid_key_long", "register"), true);
        }

        $account = $this->activation_model->getAccount($key);

        if(!$account)
        {
            $this->template->box(lang("invalid_key", "register"), lang("invalid_key_long", "register"), true);
        }

        $this->activation_model->remove($account['id'], $account['username'], $account['email']);

        $this->external_account_model->createAccount($account['username'], $account['password'], $account['email'], false);

        // Log in
        $this->user->setUserDetails($account['username'], $account['password']);

        // Show success message
        $data = array(
            "url" => $this->template->page_url,
            "account" => $account['username'],
            "bridgeName" => $this->config->item('forum_bridge'),
            "username" => $account['username'],
            "email" => $account['email'],
            "password" => $account['password'],
            "email_activation" => false
        );

        if($this->config->item('use_forum_bridge'))
        {
            if(file_exists('application/modules/register/plugins/'.$this->config->item('forum_bridge').".php"))
            {
                $this->plugins->{$this->config->item('forum_bridge')}->register($data['username'], $data['password'], $data['email']);
            }
            else
            {
                show_error("The forum bridge <b>".$this->config->item('forum_bridge')."</b> does not exist in <b>application/modules/register/plugins/</b>");
                die();
            }
        }

        $title = lang("created", "register");

        $this->template->view($this->template->box($title, $this->template->loadPage("register_success.tpl", $data)));
    }
}