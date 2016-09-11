<?php

class Auth_model
{
    private $db;
    private $config;
    private $realmId;

    /**
     * Initialize the realm
     * @param Array $config Database config
     */
    public function __construct($config)
    {
        $this->config = $config;

        $this->realmId = $this->config['id'];
    }

    /**
     * Connect to the database if not already connected
     */
    public function connect()
    {
        if(empty($this->db))
        {
            $this->db = get_instance()->load->database($this->config['auth'], true);
        }
    }

    public function getConnection()
    {
        $this->connect();

        return $this->db;
    }

    /**
     * Get uptime
     * @return Mixed
     */
    public function getStartTime()
    {
        // Make sure we're connected
        $this->connect();

        $query = $this->db->query("SELECT starttime from uptime WHERE realmid=? ORDER BY starttime DESC LIMIT 1", array($this->realmId));

        if($this->db->_error_message())
        {
            die($this->db->_error_message());
        }

        if($query->num_rows() > 0)
        {
            return $query->result_array()[0]['starttime'];
        }
        else
        {
            return 0;
        }
    }

    /**
     * Get revision
     * @return Mixed
     */
    public function getRevision()
    {
        // Make sure we're connected
        $this->connect();

        $query = $this->db->query("SELECT revision from uptime WHERE realmid=? ORDER BY starttime DESC LIMIT 1", array($this->realmId));

        if($this->db->_error_message())
        {
            die($this->db->_error_message());
        }

        if($query->num_rows() > 0)
        {
            return $query->result_array()[0]['revision'];
        }
        else
        {
            return 0;
        }
    }

    /**
     * Get max players this session
     * @return Mixed
     */
    public function getMaxPlayers()
    {
        // Make sure we're connected
        $this->connect();

        $query = $this->db->query("SELECT maxplayers from uptime WHERE realmid=? ORDER BY starttime DESC LIMIT 1", array($this->realmId));

        if($this->db->_error_message())
        {
            die($this->db->_error_message());
        }

        if($query->num_rows() > 0)
        {
            return $query->result_array()[0]['maxplayers'];
        }
        else
        {
            return 0;
        }
    }
}