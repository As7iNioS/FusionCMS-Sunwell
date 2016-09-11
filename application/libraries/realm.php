<?php

/**
 * @package FusionCMS
 * @author Jesper Lindström
 * @author Xavier Geerinck
 * @author Elliott Robbins
 * @link http://fusion-hub.com
 * @property IEmulator $emulator
 */

class Realm
{
    // Config
    private $id;
    private $name;
    private $playerCap;
    private $config;

    // Objects
    private $CI;
    private $characters;
    private $world;
    private $auth;
    private $emulator;

    // Runtime values
    private $online;
    private $onlineFaction;
    private $isOnline;
    private $startTime;
    private $revision;
    private $maxPlayers;

    /**
     * Initialize the realm
     * @param Int $id
     * @param String $name
     * @param Int $playerCap
     * @param Array $config
     */
    public function __construct($id, $name, $playerCap, $config, $emulator)
    {
        // Assign the values
        $this->id = $id;
        $this->name = $name;
        $this->playerCap = $playerCap;
        $this->config = $config;
        $this->config['emulator'] = $emulator;
        $this->isOnline = null;
        $this->onlineFaction = array();

        $overrideParts = array(
            'username',
            'password',
            'hostname',
            'port'
        );

        foreach($overrideParts as $part)
        {
            $this->config["override_".$part."_char"] = $this->config['characters'][$part];
            $this->config["override_".$part."_world"] = $this->config['world'][$part];
            $this->config["override_".$part."_auth"] = $this->config['auth'][$part];
        }

        $this->config['characters_database'] = $this->config['characters']['database'];
        $this->config['world_database'] = $this->config['world']['database'];
        $this->config['auth_database'] = $this->config['auth']['database'];

        // Get the CodeIgniter instance
        $this->CI = &get_instance();

        // Load the objects
        require_once('application/models/world_model.php');
        require_once('application/models/characters_model.php');
        require_once('application/models/auth_model.php');

        // Make sure the emulator is installed
        if(file_exists('application/emulators/'.$emulator.'.php'))
        {
            require_once('application/emulators/'.$emulator.'.php');
        }
        else
        {
            show_error("The entered emulator (".$emulator.") doesn't exist in application/emulators/");
        }

        // Pass the realm ID to the emulator layer
        $config['id'] = $id;

        // Initialize the objects
        $this->emulator = new $emulator($config);
        $this->characters = new Characters_model($config);
        $this->world = new World_model($config);
        $this->auth = new Auth_model($config);
    }

    /**
     * Get the amount of online players
     * @param String $faction horde/alliance
     * @return Int
     */
    public function getOnline($faction = false)
    {
        if(!$faction)
        {
            if(!empty($this->online))
            {
                return $this->online;
            }
            else
            {
                // Get the online count
                $cache = $this->CI->cache->get("online_".$this->id);

                // Can we use the cache?
                if($cache !== false)
                {
                    $this->online = $cache;
                }
                else
                {
                    // Load and save as cache
                    $this->online = $this->characters->getOnlineCount();

                    // Cache it for 5 minutes
                    $this->CI->cache->save("online_".$this->id, $this->online, 60*5);
                }

                return $this->online;
            }
        }
        else
        {
            if(!empty($this->onlineFaction[$faction]))
            {
                return $this->onlineFaction[$faction];
            }
            else
            {
                $cache = $this->CI->cache->get("online_".$this->id."_".$faction);

                // Can we use the cache?
                if($cache !== false)
                {
                    $this->onlineFaction[$faction] = $cache;
                }
                else
                {
                    // Load and save as cache
                    $this->onlineFaction[$faction] = $this->characters->getOnlineCount($faction);

                    // Cache it for 5 minutes
                    $this->CI->cache->save("online_".$this->id."_".$faction, $this->onlineFaction[$faction], 60*5);
                }
            }

            return $this->onlineFaction[$faction];
        }
    }

    /**
     * Get the amount of characters that belongs to a certain account
     * @param Int $account
     * @return Int
     */
    public function getCharacterCount($account = false)
    {
        // Default to the current user
        if(!$account)
        {
            $account = $this->CI->user->getId();
        }

        // Check for cache to use
        $cache = $this->CI->cache->get("total_characters_".$this->id."_".$account);

        // Cache is fresh
        if($cache !== false)
        {
            return $cache;
        }
        else
        {
            // Refresh cache
            $count = $this->characters->getCharacterCount($account);

            $this->CI->cache->save("total_characters_".$this->id."_".$account, $count, 60*60);

            return $count;
        }
    }

    /**
     * Get the percentage of online/cap
     * @param String $faction horde/alliance
     * @return Int
     */
    public function getPercentage($faction = false)
    {
        if(!$faction)
        {
            $online = $this->getOnline();
            $cap = $this->getCap();
        }
        else
        {
            $online = $this->getOnline($faction);
            $cap = $this->getOnline();
        }

        // Prevent division by zero
        if($online == 0
        || $cap == 0)
        {
            return 0;
        }

        // Make sure 100 is the max percentage they can get
        elseif($online > $cap)
        {
            return 100;
        }

        // Calculate percentage
        else
        {
            $percentage = round(($online / $cap) * 100);
        }

        return $percentage;
    }

    /**
     * Get the realm name
     * @return String
     */
    public function getName()
    {
        return addslashes($this->name);
    }

    /**
     * Get the realm id
     * @return Int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Get the player cap
     * @return Int
     */
    public function getCap()
    {
        return $this->playerCap;
    }

    public function getWorld()
    {
        return $this->world;
    }

    public function getCharacters()
    {
        return $this->characters;
    }

    public function getAuth()
    {
        return $this->auth;
    }

    /**
     * @return IEmulator
     */
    public function getEmulator()
    {
        return $this->emulator;
    }

    /**
     * Check if the realm is up and running
     * @param Boolean $realtime
     * @return Boolean
     */
    public function isOnline($realtime = false)
    {
        if($this->isOnline != null)
        {
            return $this->isOnline;
        }
        else
        {
            if(!$realtime)
            {
                $data = $this->CI->cache->get("isOnline_".$this->getId());

                if($data !== false)
                {
                    return ($data == "yes") ? true : false;
                }
            }

            if(@fsockopen($this->config['hostname'], $this->config['realm_port'], $errno, $errstr, 1.5))
            {
                $this->isOnline = true;
            }
            else
            {
                $this->isOnline = false;
            }

            $this->CI->cache->save("isOnline_".$this->getId(), ($this->isOnline) ? "yes" : "no", 60*5);

            return $this->isOnline;
        }
    }

    /**
     * Get config value
     * @param String $key
     * @return String
     */
    public function getConfig($key)
    {
        if(array_key_exists($key, $this->config))
        {
            return $this->config[$key];
        }
        else
        {
            return false;
        }
    }

    /**
     * Get realm uptime
     * @param Boolean $realtime
     * @return Boolean
     */
    public function getUptime($realtime = false)
    {
        if($this->startTime == null){
            if(!$realtime)
            {
                $this->startTime = $this->CI->cache->get("starttime_".$this->getId());
            }

            if ($this->startTime == null){
                $this->startTime = $this->getAuth()->getStartTime();
            }

            if ($this->startTime == null){
                return "-";
            }
        }

        // Cache it for 5 minutes
        $this->CI->cache->save("starttime_".$this->id, $this->startTime, 60*5);

        $startTime = DateTime::createFromFormat('U', $this->startTime);
        $startTime->setTimezone(new DateTimeZone("UTC"));
        $currentTime = new DateTime();
        $currentTime->setTimezone(new DateTimeZone("UTC"));

        $interval = $currentTime->diff($startTime);

        $diffStr = "";

        if ($interval->m > 0){
            $diffStr .= $interval->m . lang("months") . " ";
        }
        if ($interval->d > 0){
            $diffStr .= $interval->d . lang("days") . " ";
        }
        if ($interval->h > 0){
            $diffStr .= $interval->h . lang("hours") . " ";
        }
        if ($interval->i > 0){
            $diffStr .= $interval->i . lang("minutes") . " ";
        }
        if ($interval->s > 0){
            $diffStr .= $interval->s . lang("seconds") . " ";
        }
        $diffStr = trim($diffStr);

        return $diffStr;
    }

    /**
     * Get realm revision
     * @param Boolean $realtime
     * @return Boolean
     */
    public function getRevision($realtime = false)
    {
        if($this->revision != null)
        {
            return $this->revision;
        }
        else
        {
            if(!$realtime)
            {
                $data = $this->CI->cache->get("revision_".$this->getId());

                if($data)
                {
                    return $data;
                }
            }

            $this->revision = $this->getAuth()->getRevision();

            // Cache it for 5 minutes
            $this->CI->cache->save("revision_".$this->id, $this->revision, 60*5);

            return $this->revision;
        }
    }

    /**
     * Get max player count this session
     * @param Boolean $realtime
     * @return Boolean
     */
    public function getMaxPlayerCount($realtime = false)
    {
        if($this->maxPlayers != null)
        {
            return $this->maxPlayers;
        }
        else
        {
            if(!$realtime)
            {
                $data = $this->CI->cache->get("maxplayers_".$this->getId());

                if($data)
                {
                    return $data;
                }
            }

            $this->maxPlayers = $this->getAuth()->getMaxPlayers();

            // Cache it for 5 minutes
            $this->CI->cache->save("maxplayers_".$this->id, $this->maxPlayers, 60*5);

            return $this->maxPlayers;
        }
    }
}