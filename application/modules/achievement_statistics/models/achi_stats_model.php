<?php

class Achi_Stats_model extends CI_Model
{
    /**
     * @var Realm
     */
    public $realm;
    private $connection;

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Assign the realm object to the model
     * @param $id
     */
    public function setRealm($id)
    {
        $this->realm = $this->realms->getRealm($id);
    }

    /**
     * Connect to the character database
     */
    public function connect()
    {
        $this->realm->getCharacters()->connect();
        $this->connection = $this->realm->getCharacters()->getConnection();
    }

    public function getAchievementPoints($playerLimit)
    {
        //make sure the count param is digit
        if (!is_int($playerLimit)) {
            $playerLimit = 25;
        }

        $cacheName = "achievement_ranking_".$this->realm->getId();
        $data = $this->cache->get($cacheName);

        if($data)
        {
            return $data;
        }

        $players = [];
        $this->connect();
        $result = $this->connection->query("SELECT c.`guid`, c.`name`, c.`level`, c.`race`, c.`class`, c.`gender`, cs.achievementPoints 
FROM characters c 
LEFT OUTER JOIN character_stats cs ON cs.guid = c.guid
WHERE (c.deleteDate IS NULL OR c.deleteDate = 0) AND achievementPoints > 0
ORDER BY achievementPoints DESC
LIMIT ?;", array($playerLimit));

        if ($result && $result->num_rows() > 0) {
            $players = $result->result_array();

            // Add rank
            $i = 1;
            foreach ($players as $key => $player) {
                $players[$key]['rank'] = $i;
                $i++;
            }
        }

        unset($result);

        // Cache it for 1 hour
        $this->cache->save($cacheName, $players, 60*60*1);

        return $players;
    }
}