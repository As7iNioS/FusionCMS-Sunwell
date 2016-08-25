<?php

class PvE_Stats_model extends CI_Model
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

    public function GetInstances($type = ""){
        $instances['dungeons'] = [
            'utgarde_keep_n' => [
                'name' => 'Utgarde Keep (N)',
                'ids' => '3679'
            ],
            'utgarde_keep_h' => [
                'name' => 'Utgarde Keep (H)',
                'ids' => '5608'
            ],
            'nexus_n' => [
                'name' => 'The Nexus (N)',
                'ids' => '3639'
            ],
            'nexus_h' => [
                'name' => 'The Nexus (H)',
                'ids' => '5609'
            ],
            'azjol_nerub_n' => [
                'name' => 'Azjol-Nerub (N)',
                'ids' => '3643'
            ],
            'azjol_nerub_h' => [
                'name' => 'Azjol-Nerub (H)',
                'ids' => '5610'
            ],
            'ahnkahet_n' => [
                'name' => 'Ahn\'kahet (N)',
                'ids' => '3647'
            ],
            'ahnkahet_h' => [
                'name' => 'Ahn\'kahet (H)',
                'ids' => '5611'
            ],
            'draktharon_n' => [
                'name' => 'Drak\'tharon Keep (N)',
                'ids' => '3651'
            ],
            'draktharon_h' => [
                'name' => 'Drak\'tharon Keep (H)',
                'ids' => '5612'
            ],
            'violet_hold_n' => [
                'name' => 'The Violet Hold (N)',
                'ids' => '3652'
            ],
            'violet_hold_h' => [
                'name' => 'The Violet Hold (H)',
                'ids' => '5613'
            ],
            'gundrak_n' => [
                'name' => 'Gundrak (N)',
                'ids' => '3656'
            ],
            'gundrak_h' => [
                'name' => 'Gundrak (H)',
                'ids' => '5614'
            ],
            'halls_of_stone_n' => [
                'name' => 'Halls of Stone (N)',
                'ids' => '3659'
            ],
            'halls_of_stone_h' => [
                'name' => 'Halls of Stone (H)',
                'ids' => '5615'
            ],
            'halls_of_lightning_n' => [
                'name' => 'Halls of lightning (N)',
                'ids' => '3663'
            ],
            'halls_of_lightning_h' => [
                'name' => 'Halls of lightning (H)',
                'ids' => '5616'
            ],
            'utgarde_pinnacle_n' => [
                'name' => 'Utgarde Pinnacle (N)',
                'ids' => '3669'
            ],
            'utgarde_pinnacle_h' => [
                'name' => 'Utgarde Pinnacle (H)',
                'ids' => '5618'
            ],
            'cot_stratholme_n' => [
                'name' => 'The Culling of Stratholme (N)',
                'ids' => '3674'
            ],
            'cot_stratholme_h' => [
                'name' => 'The Culling of Stratholme (H)',
                'ids' => '5620'
            ],
            'oculus_n' => [
                'name' => 'Oculus (N)',
                'ids' => '3667'
            ],
            'oculus_h' => [
                'name' => 'Oculus (H)',
                'ids' => '5617'
            ],
            'toc_n' => [
                'name' => 'Trial of the Champion (N)',
                'ids' => '12552'
            ],
            'toc_h' => [
                'name' => 'Trial of the Champion (H)',
                'ids' => '12553'
            ],
            'forge_of_souls_n' => [
                'name' => 'Forge of Souls (N)',
                'ids' => '13166, 13168'
            ],
            'forge_of_souls_h' => [
                'name' => 'Forge of Souls (H)',
                'ids' => '13167, 13169'
            ],
            'pit_of_saron_n' => [
                'name' => 'Pit of Saron (N)',
                'ids' => '13170, 13172, 13174'
            ],
            'pit_of_saron_h' => [
                'name' => 'Pit of Saron (H)',
                'ids' => '13173, 13175, 13182'
            ],
            'halls_of_reflection_n' => [
                'name' => 'Halls of Reflection (N)',
                'ids' => '13176, 13178, 13180'
            ],
            'halls_of_reflection_h' => [
                'name' => 'Halls of Reflection (H)',
                'ids' => '13177, 13179, 13181'
            ],
        ];
        $instances['raids'] = [
            'naxx_10' => [
                'name' => 'Naxxramas 10 (N)',
                'ids' => '5100, 5101, 5102, 5104, 5108, 5110, 5112, 5113, 5114, 5117, 5119, 5120, 5121, 5122, 5123, 7805'
            ],
            'naxx_25' => [
                'name' => 'Naxxramas 25 (N)',
                'ids' => '5103, 5111, 5124, 5125, 5126, 5127, 5128, 5129, 5130, 5131, 5132, 5133, 5134, 5135, 5136, 7806'
            ],
            'os_10' => [
                'name' => 'The Obsidian Sanctum 10 (N)',
                'ids' => '5138'
            ],
            'os_25' => [
                'name' => 'The Obsidian Sanctum 25 (N)',
                'ids' => '5139'
            ],
            'eoe_10' => [
                'name' => 'Eye of Eternity 10 (N)',
                'ids' => '5137'
            ],
            'eoe_25' => [
                'name' => 'Eye of Eternity 25 (N)',
                'ids' => '5140'
            ],
            'voa_10' => [
                'name' => 'Vault of Archavon 10 (N)',
                'ids' => '6395, 9952, 11902, 13107'
            ],
            'voa_25' => [
                'name' => 'Vault of Archavon 25 (N)',
                'ids' => '6396, 10542, 11903, 13108'
            ],
            'ulduar_10' => [
                'name' => 'Ulduar 10 (N)',
                'ids' => '9938, 9939, 9940, 9941, 9943, 9947, 9948, 9950, 9951, 10558, 10559, 10560, 10565, 10580'
            ],
            'ulduar_25' => [
                'name' => 'Ulduar 25 (N)',
                'ids' => '9954, 9955, 9956, 9957, 9959, 9963, 9964, 9966, 9967, 10561, 10562, 10563, 10566, 10581'
            ],
            'toc_10' => [
                'name' => 'Trial of the Crusader 10 (N)',
                'ids' => '12228, 12232, 12236, 12240, 12244'
            ],
            'toc_25' => [
                'name' => 'Trial of the Crusader 25 (N)',
                'ids' => '12230, 12234, 12238, 12242, 12246'
            ],
            'toc_10h' => [
                'name' => 'Trial of the Crusader 10 (H)',
                'ids' => '12229, 12233, 12237, 12241, 12245'
            ],
            'toc_25h' => [
                'name' => 'Trial of the Crusader 25 (H)',
                'ids' => '12231, 12235, 12239, 12243, 12247'
            ],
            'icc_10' => [
                'name' => 'Icecrown Citadel 10 (N)',
                'ids' => '13089, 13093, 13094, 13095, 13096, 13097, 13098, 13099, 13100, 13101, 13102, 13103'
            ],
            'icc_25' => [
                'name' => 'Icecrown Citadel 25 (N)',
                'ids' => '13092, 13105, 13109, 13112, 13115, 13118, 13121, 13124, 13127, 13130, 13133, 13136'
            ],
            'icc_10h' => [
                'name' => 'Icecrown Citadel 10 (H)',
                'ids' => '13090, 13104, 13110, 13113, 13116, 13119, 13122, 13125, 13128, 13131, 13134, 13137'
            ],
            'icc_25h' => [
                'name' => 'Icecrown Citadel 25 (H)',
                'ids' => '13091, 13106, 13111, 13114, 13117, 13120, 13123, 13126, 13129, 13132, 13135, 13138'
            ],
            'rs_10' => [
                'name' => 'Ruby Sanctum 10 (N)',
                'ids' => '13466'
            ],
            'rs_25' => [
                'name' => 'Ruby Sanctum 25 (N)',
                'ids' => '13465'
            ],
            'rs_10h' => [
                'name' => 'Ruby Sanctum 10 (H)',
                'ids' => '13468'
            ],
            'rs_25h' => [
                'name' => 'Ruby Sanctum 25 (H)',
                'ids' => '13467'
            ],
        ];

        if (!$type){
            return $instances;
        } else {
            return $instances[$type];
        }
    }

    public function getInstanceRuns($instance, $instanceKey, $playerLimit)
    {
        //make sure the count param is digit
        if (!is_int($playerLimit)) {
            $playerLimit = 10;
        }

        $cacheName = "pve_ranking_".$this->realm->getId()."_".$instanceKey;
        $data = $this->cache->get($cacheName);

        if($data)
        {
            return $data;
        }

        $players = [];
        $this->connect();
        $result = $this->connection->query("SELECT c.`guid`, c.`name`, c.`level`, c.`race`, c.`class`, c.`gender`, MIN(cap.counter) kills 
FROM character_achievement_progress cap
LEFT OUTER JOIN characters c ON c.guid = cap.guid
WHERE cap.`criteria` IN (?) AND c.`guid` IS NOT NULL
GROUP BY cap.`guid`
HAVING COUNT(DISTINCT cap.`criteria`) = ?
ORDER BY kills DESC
LIMIT ?;", array($instance['ids'], substr_count($instance['ids'], ",") + 1, $playerLimit));

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