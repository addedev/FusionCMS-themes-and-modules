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
			<ul id="top_menu">
				{foreach from=$menu_top item=menu_1}
					<li><a {$menu_1.link}>{$menu_1.name}</a></li>
				{/foreach}
			</ul>
			<ul>
				<a id="logo_anch" href="#" title="">Death II<!-- or any title--></a>
			</ul>
			<div id="main">			
                <aside id="left">
					<article>
						<ul id="left_menu">
							{foreach from=$menu_side item=menu_2}
								<li><a {$menu_2.link}><img src="{$image_path}bullet.png">{$menu_2.name}</a></li>
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
						<div id="slider">
							{foreach from=$slider item=image}
								<a href="{$image.link}"><img src="{$image.image}" title="{$image.text}"/></a>
							{/foreach}
						</div>
                        <div id="slider_sep"></div>
					</section>
					{$page}
				</aside>
				<div class="clear"></div>
			</div>
			<footer>
				<a href="http://ta6363237.deviantart.com/" id="logo" target="_blank" title="Coded by Dawnbrightsu"><p></p><span></span></a>
             	<a href="http://zafirehd.deviantart.com/" id="zafire" target="_blank" title="Design by ZafireHD"><p></p><span></span></a>
             	<a href="http://www.fusion-hub.com/" id="dawn" target="_blank" title="Fusion Hub"><p></p><span></span></a>
				<h3>&copy; Copyright {date("Y")} {$serverName}</h3>
			</footer>
		</section>
	</body>
</html>