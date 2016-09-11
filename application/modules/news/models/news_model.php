<?php

class News_model extends CI_Model 
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Get news entries
     * @param Int $start
     * @param Int $limit
     * @return Array
     */
    public function getArticles($start = 0, $limit = 1)
    {
        if($start === true)
        {
            $this->db->select('id, headline, content, timestamp, author_id, avatar');
        }
        else
        {
            $this->db->select('id, headline, content, timestamp, author_id, avatar');
            $this->db->limit($limit, $start);
        }

        $this->db->order_by('id', 'desc');
        $query = $this->db->get('articles');
        $result = $query->result_array();

        // Did we have any results?
        if($result)
        {
            return $this->template->format($result);
        }
    }

    /**
     * Get the article with the specified id.
     * @param $id
     * @return bool
     */
    public function getArticle($id)
    {
        $query = $this->db->query("SELECT * FROM articles WHERE id=?", array($id));

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

    /**
     * Get the tags for the given article id
     * @param $articleId
     * @return array|bool
     */
    public function getTags($articleId)
    {
        $this->db->select('t.name');
        $this->db->where('at.article_id', $articleId);
        $this->db->where('at.tag_id = t.id');
        $query = $this->db->get('tag t, article_tag at');

        if($query->num_rows() > 0)
        {
            $result = $query->result_array();
            return $result;
        }
        else
        {
            return false;
        }
    }

    /**
     * Count the articles
     * @return Int
     */
    public function countArticles()
    {
        return $this->db->count_all('articles');
    }

    /**
     * Create a news article
     * @param $headline
     * @param $content
     * @return bool
     */
    public function create($headline, $content)
    {
        if (!is_string($headline) || !is_string($content))
            return false;

        $data = array(
            'headline' => $headline,
            'content' => $content,
            'timestamp' => time(),
            'author_id' => $this->user->getId()
        );

        $this->db->insert("articles", $data);

        return true;
    }

    /**
     * Update the article with the given id
     * @param $id
     * @param $headline
     * @param $content
     * @return bool
     */
    public function update($id, $headline, $content)
    {
        if (!is_numeric($id) || !is_string($headline) || !is_string($content))
            return false;

        $data = array(
            'headline' => $headline,
            'content' => $content,
        );

        $this->db->where('id', $id);
        $this->db->update("articles", $data);

        return true;
    }

    /**
     * Delete the article with the given id.
     * @param $articleId
     * @return bool
     */
    public function delete($articleId)
    {
        if (!is_numeric($articleId))
            return false;

        $this->db->where('id', $articleId);
        $this->db->delete('articles');

        return true;
    }
}
