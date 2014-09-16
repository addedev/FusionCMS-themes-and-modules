{foreach from=$articles item=article}

	<article>
		<a {$article.link} class="top">{$article.headline}</a>
		<section class="body">
			{if $article.avatar}
				<div class="avatar">
					<img src="{$article.avatar}" alt="avatar" height="120" width="120">
				</div>
			{/if}
			
			{$article.content}
			
			<div class="clear"></div>
			
			<div class="news_bottom">

				{if $article.comments != -1}
					<a {$article.link} class="comments_button" {$article.comments_button_id}>
						Comentarios ({$article.comments})
					</a>
				{/if}
				
			Escrito por <b><a href="{$url}profile/{$article.author_id}" data-tip="Ver perfil">{$article.author}</a></b> el <b>{$article.date}</b>
			</div>

			<div class="comments" {$article.comments_id}></div>
		</section>
	</article>

{/foreach}
{$pagination}