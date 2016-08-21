<?php

class Changelog_model extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}
	
	public function add($data)
	{
		$this->db->insert("changelog", $data);
	}
	
	public function getChangelog($limit  = false)
	{
		if($limit)
		{
			$query = $this->db->query("SELECT * FROM changelog c, changelog_type t WHERE c.type = t.id ORDER BY c.time DESC LIMIT ?", array($limit));
		}
		else
		{
			// This query also gets the type from the foreign key.
			$query = $this->db->query("SELECT * FROM changelog c, changelog_type t WHERE c.type = t.id ORDER BY c.time DESC");
		}
		
		if($query->num_rows() > 0)
		{
			return $query->result_array();
		}
		else 
		{
			return false;	
		}
	}
	
	public function getChange($id)
	{
		if(!$id)
		{
			return false;
		}
		else
		{
			$query = $this->db->query("SELECT * FROM changelog c, changelog_type t WHERE c.type = t.id AND c.change_id = ?", array($id));
			
			if($query->num_rows() > 0)
			{
				$result = $query->result_array();
				return $result[0];
			}
			else 
			{
				return false;	
			}
		}
	}

	public function getCategories()
	{
		$query = $this->db->query("SELECT * FROM changelog_type ORDER BY id ASC");

		if($query->num_rows() > 0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	public function addCategory($name)
	{
		$this->db->query("INSERT INTO changelog_type(typeName) VALUES(?)", array($name));
	}

	public function deleteChange($id)
	{
		$this->db->query("DELETE FROM changelog WHERE change_id = ?", array($id));
	}

	public function deleteCategory($id)
	{
		$this->db->query("DELETE FROM changelog WHERE type = ?", array($id));
		$this->db->query("DELETE FROM changelog_type WHERE id = ?", array($id));
	}

	public function addChange($text, $category, $author = "", $time = 0)
	{
		$data = array(
			"changelog" => nl2br(trim($text)),
			"author" => $author ? $author : $this->user->getNickname(),
			"type" => $category,
			"time" => $time ? $time : time()
		);

		$this->db->insert("changelog", $data);

		$query = $this->db->query("SELECT change_id FROM changelog ORDER BY change_id DESC LIMIT 1");

		if($query->num_rows() > 0)
		{
			$row = $query->result_array();

			return $row[0]['change_id'];
		}
		else
		{
			return false;
		}
	}
	
	public function saveCategory($id, $data)
	{
		$this->db->where('id', $id);
		$this->db->update('changelog_type', $data);
	}

	public function edit($id, $data)
	{
		$this->db->where('change_id', $id);
		$this->db->update('changelog', $data);
	}

	public function fetchChanges($username, $password){
        $query = $this->db->query("SELECT id, lastCommit, repoName FROM changelog_type WHERE repoName IS NOT NULL");

        if($query->num_rows() > 0)
        {
            $repositories = $query->result_array();

            $fetchedCommits = 0;
            foreach ($repositories as $repo) {
                $url = "https://bitbucket.org/api/2.0/repositories/maczuga/{$repo["repoName"]}/commits";

                $commits = $this->GetCommits($url, $repo, $username, $password);
                $lastCommit = end($commits)["hash"];
                $fetchedCommits += count($commits);

                if (empty($commits)) continue;

                // Insert commits
                foreach ($commits as $commit) {
                    $this->addChange($commit["message"], $repo["id"], $commit["author"], $commit["date"]);
                }

                // Update changelog_type
                $this->db->query("UPDATE changelog_type SET `lastCommit` = ? WHERE id = ?", [$lastCommit, $repo["id"]]);
            }

            if (!$fetchedCommits){
                die("You are up to date!");
            }

            return true;
        }
        else
        {
            die("No repositories was configured!");
        }
    }

    private function GetCommits($url, $repo, $username, $password)
    {
        try {
            $commits = [];

            $curl = curl_init();
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
            curl_setopt($curl, CURLOPT_USERPWD, $username . ":" . $password);
            curl_setopt($curl, CURLOPT_TIMEOUT, 5);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            $resp = curl_exec($curl);

            // validate CURL status
            if (curl_errno($curl))
                throw new Exception(curl_error($curl), 500);

            // validate HTTP status code (user/password credential issues)
            $status_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
            if ($status_code != 200)
                throw new Exception("Response with Status Code [" . $status_code . "].", 500);

            curl_close($curl);

            $json = json_decode($resp, true);
            $revCommits = array_reverse($json["values"]);

            $lastCommitPos = -1;
            for ($i = 0; $i < count($revCommits); $i++){
                $commit = $revCommits[$i];

                if ($commit["hash"] == $repo["lastCommit"]){
                    $lastCommitPos = $i;
                    break;
                }
            }
            if (array_key_exists("next", $json) && $lastCommitPos == -1){
                $commits = array_merge($commits, $this->GetCommits($json["next"], $repo, $username, $password));
            }

            for ($i = $lastCommitPos + 1; $i < count($revCommits); $i++){
                $commit = $revCommits[$i];

                if (substr($commit["message"], 0, 5) === "Merge") continue;

                $author = "---";
                if (array_key_exists("author", $commit))
                    if (array_key_exists("user", $commit["author"]))
                        if (array_key_exists("username", $commit["author"]["user"]))
                            $author = $commit["author"]["user"]["username"];

                $commits[] = [
                    "hash" => $commit["hash"],
                    "author" => $author,
                    "date" => strtotime(str_replace("T", " ", substr($commit["date"], 0, 19))),
                    "message" => $commit["message"],
                    "type" => $commit["type"],
                ];
            }

            return $commits;
        }
        catch(Exception $ex) {
            if ($curl != null) curl_close($curl);
            die($ex->getMessage());
        }
    }
}
