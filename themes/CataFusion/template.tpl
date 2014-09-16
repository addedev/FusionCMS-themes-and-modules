{$head}
	<body>
		<!--[if lte IE 8]>
			<style type="text/css">
				body {
					background-image:url(images/bg.jpg);
					background-position:top center;
				}
			</style>
		<![endif]-->
		<section id="wrapper">
			{$modals}
			<a href="" ><div id="logoH"></div></a>
			<header id="hand"></header>
			<ul id="top_menu">
				{foreach from=$menu_top item=menu_1}
					<li><a {$menu_1.link}>{$menu_1.name}</a></li>
				{/foreach}
			</ul>
			<div class="MenuRight">	
				{if $isOnline}
						<a href="./ucp" class="JoinUs">			 
						 <div class="Acc"></div>
						 <div class="Acc2"></div>
						</a>						
						{else}
						<a href="./register" class="JoinUs">			 
						 <div class="SignIn"></div>
						 <div class="SignIn2"></div>
						</a>
					{/if}
			</div>
			<div id="main">
				<aside id="left">
					<article>
						<h1 class="top">Main menu</h1>
						<ul id="left_menu">
							{foreach from=$menu_side item=menu_2}
								<li><a {$menu_2.link}><img src="{$image_path}pin-red.png">{$menu_2.name}</a></li>
							{/foreach}
						</ul>
					</article>

					{foreach from=$sideboxes item=sidebox}
						<article>
							<h1 class="top">{$sidebox.name}</h1>
							<section class="body">
								{$sidebox.data}
							</section>
						</article>
					{/foreach}
				</aside>

				<aside id="right">
					<section id="slider_bg" {if !$show_slider}style="display:none;"{/if}>
						<div id="slider_frame"></div>
						<div id="slider">
							{foreach from=$slider item=image}
								<a href="{$image.link}"><img src="{$image.image}" title="{$image.text}"/></a>
							{/foreach}
						</div>
					</section>

					{$page}
				</aside>

				<div class="clear"></div>
			</div>
			<footer>
				<a href="http://raxezdev.com/fusioncms" id="logo" target="_blank"></a>
				<a href="http://www.djokx.com/" id="DjokxF" target="_blank"></a>
				<p>&copy; Copyright 2013 {$serverName}</p>
			</footer>
		</section>
	</body>
</html>