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
			<header id="hand"></header>
			<ul id="top_menu">
				{foreach from=$menu_top item=menu_1}
					<li><a {$menu_1.link}>{$menu_1.name}</a></div></li>
				{/foreach}
			</ul>
			<div id="main">
				<aside id="left">
					<article>
						<h1 class="top">Men&uacute; principal</h1>
						<ul id="left_menu">
							{foreach from=$menu_side item=menu_2}
								<li><a {$menu_2.link}><img src="{$image_path}bullet.png">{$menu_2.name}</a></li>
							{/foreach}
						</ul>
					</article>
					<article>						
							<a href="#"><div class="boton_stats"></div></a>                       	
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
								<a href="{$image.link}"><img src="{$image.image}"/></a>
							{/foreach}
						</div>
					</section>					
					  <div style="margin:0px; width:1000px; {if $logged_in}style="display:none;"{/if}">
						<div class="boton_icono">
							<a href="https://twitter.com//"><img src="http://dream-wow.com/application/themes/default/images/boton_twit.png"/></a>
                        </div>
						<div class="boton_icono">
							<a href="http://www.youtube.com/user//"><img src="http://dream-wow.com/application/themes/default/images/boton_youtube.png"/></a>
                        </div>
						<div class="boton_icono">
							<a href="http://www.facebook.com//"><img src="http://dream-wow.com/application/themes/default/images/boton_face.png"/></a>
                        </div>
					  {if $logged_in == false}						
							<a href="page/"><div class="boton_migraciones"></div></a>
                      {/if}		
					  {if $logged_in == true}
					  <a href="page/"><div class="boton_ts3"></div></a>
					  {/if}					  
					</div>
                     <br><br><br><br><br>				  
					{$page}
				</aside>

				<div class="clear"></div>
			</div>
			<footer>
				<a href="#" id="logo" target="_blank"></a>
				<p>&copy; Copyright 2012 {$serverName} | Coded by KennethHD & FusionCMS | Designed by KennethHD |</p>
			</footer>
		</section>
	</body>
</html>