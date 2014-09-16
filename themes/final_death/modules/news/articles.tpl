{foreach from=$articles item=article}

	<article class="news_tab">
		<div class="news_head">

			<a href="{$url}news/view/{$article.id}" class="top">{langColumn($article.headline)}</a>

			<div class="news_bottom">
				<p>
                    {if $article.comments != -1}
                        <a {$article.link} class="comments_button" {$article.comments_button_id}>
                            {lang("comments", "news")} ({$article.comments})
                        </a>
                    {/if}
				</p>
				<span>				
                	{lang("posted_by", "news")} <a href="{$url}profile/{$article.author_id}" data-tip="{lang("view_profile", "news")}">{$article.author}</a> {lang("on", "news")} {$article.date}
				</span>
			</div>
		</div>

		<section class="body">

			{if $article.avatar}
				<div class="avatar">
					<img src="{$article.avatar}" alt="avatar" height="120" width="120">
				</div>
			{/if}
			
			{langColumn($article.content)}
			
			{if $article.tags}
				{foreach from=$article.tags item=tag}
					<a href="{$url}/news/{$tag.name}">{$tag.name}</a>
				{/foreach}
			{/if}
			
			<div class="clear"></div>
			<div class="comments" {$article.comments_id}></div>
		</section>
	</article>

{/foreach}
