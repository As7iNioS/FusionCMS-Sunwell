<?php

class Data_model extends CI_Model
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

    /***************************************
     *          TOP ARENA FUNCTIONS
     ***************************************/

    public function getTeams($count = 5, $type = 2)
    {
        //make sure the count param is digit
        if (!is_int($count)) {
            $count = 5;
        }

        $cacheName = "pvp_ranking_".$this->realm->getId()."_".$type;
        $data = $this->cache->get($cacheName);

        if($data)
        {
            return $data;
        }

        $teams = [];
        $this->connect();

        $result = $this->connection->query("SELECT `arenaTeamId` AS arenateamid, `rating`, `rank`, `name`, `captainGuid` AS captain, `type` FROM `arena_team` WHERE `type` = ? ORDER BY rating DESC LIMIT ?;", array($type, $count));

        if ($result && $result->num_rows() > 0) {
            $teams = $result->result_array();

            // Get the team members
            if ($teams) {
                foreach ($teams as $key => $arr) {
                    $members = $this->getTeamMembers((int)$arr['arenateamid']);
                    //Save the team members
                    $teams[$key]['members'] = $members;
                }
            }
        }

        unset($result);

        // Cache it for 5 minutes
        $this->cache->save($cacheName, $teams, 60*60*1);

        return $teams;
    }

    public function getTeamMembers($team)
    {
        $this->connect();

        $result = $this->connection->query("SELECT 
                                    `arena_team_member`.`arenaTeamId` AS arenateamid, 
                                    `arena_team_member`.`guid` AS guid, 
                                    `arena_team_member`.`personalRating` AS rating,
                                    `arena_team_member`.`seasonGames` AS games,
                                    `arena_team_member`.`seasonWins` AS wins,
                                    `characters`.`name` AS name,
                                    `characters`.`class` AS class,
                                    `characters`.`level` AS level
                                FROM `arena_team_member` 
                                RIGHT JOIN `characters` ON `characters`.`guid` = `arena_team_member`.`guid` 
                                WHERE `arena_team_member`.`arenaTeamId` = ? ORDER BY guid ASC;", array($team));

        if ($result && $result->num_rows() > 0) {
            return $result->result_array();
        }

        unset($result);

        return false;
    }

    public function getTopHKPlayers($count = 10)
    {
        //make sure the count param is digit
        if (!is_int($count)) {
            $count = 10;
        }

        $cacheName = "pvp_ranking_".$this->realm->getId()."_hk";
        $data = $this->cache->get($cacheName);

        if($data)
        {
            return $data;
        }

        $players = [];
        $this->connect();

        $result = $this->connection->query("SELECT `guid`, `name`, `level`, `race`, `class`, `gender`, `totalKills` AS kills FROM `characters` WHERE `totalKills` > 0 ORDER BY `totalKills` DESC LIMIT ?;", array($count));

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