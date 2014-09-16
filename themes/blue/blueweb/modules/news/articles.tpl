{foreach from=$articles item=article}

	<article class="right_box">
		<a {$article.link} class="right_box_top">{$article.headline}</a>
		
			{if $article.avatar}
				<div class="avatar">
					<img src="{$article.avatar}" alt="avatar" height="120" width="120">
				</div>
			{/if}
			
			<div style="padding:5px;">{$article.content}</div>
			
			<div class="clear"></div>
		
		<div class="right_box_bottom">

			{if $article.comments != -1}
				<a {$article.link} class="news_comments" {$article.comments_button_id}>
					Comments ({$article.comments})
				</a>
			{/if}
			
			Posted by <b><a href="{$url}profile/{$article.author_id}" data-tip="View profile">{$article.author}</a></b> on <b>{$article.date}</b>
		</div>

		<div class="comments" {$article.comments_id}></div>
	</article>

{/foreach}
{$pagination}