<div class="page-title">News</div>&nbsp;
{foreach from=$articles item=article}
    <div class="news-container">
        <div class="newsimg-border">
            <img src="{$url}application/themes/sunwell/images/index/newsimg.jpg" style="width: 100%; height: auto;">
        </div>
        <span class="news-title">{$article.headline}</span><br>

        <span class="news-author">{lang("posted_by", "news")} {$article.author}, {$article.date}</span><br><br>
        {$article.content}

        <div class="clear"></div>

        {if $single}
            <script type="text/javascript">
                $(document).ready(function () {
                    function checkIfLoaded() {
                        if (typeof Ajax != "undefined") {
                            Ajax.showComments({$article.id});
                        }
                        else {
                            setTimeout(checkIfLoaded, 50);
                        }
                    }

                    checkIfLoaded();
                });
            </script>
        {/if}
        <br style="clear: both">&nbsp;
    </div>
{/foreach}
{$pagination}