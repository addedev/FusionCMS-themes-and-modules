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
		<a href='/'><div id='logo'></div></a>
			<ul id="top_menu">
				{foreach from=$menu_top item=menu_1}
					<li><a {$menu_1.link}>{$menu_1.name}</a></li>
				{/foreach}
			</ul>
		<section id="wrapper">
			{$modals}
			<!--<header id="hand"></header>-->
			<div id="main">
				<aside id="left">
					<article>
						<script>
							$(document).ready(function(){
							  $("#mtop").click(function(){
							    $("#left_menu").slideToggle(300);
							    $(".downz").fadeToggle(300);
							    $(".upz").fadeToggle(300);
							  });
							});
						</script>
						<h1 class="top" id='mtop'>Main menu ( <om class='downz' style='display:none;'>&darr;</om><om class='upz'>&uarr;</om> )</h1>
						<ul id="left_menu">
							{foreach from=$menu_side item=menu_2}
								<li><a {$menu_2.link}><aao>&rarr;</aao><aoa>{$menu_2.name}</aoa></a></li>
							{/foreach}
						</ul>
					</article>
					{$sid_b = 1}
					{foreach from=$sideboxes item=sidebox}
						<script>
							$(document).ready(function(){
							  $("#sideb{$sid_b}").click(function(){
							    $("#sidebox{$sid_b}").slideToggle(300);
							    $(".downz{$sid_b}").fadeToggle(300);
							    $(".upz{$sid_b}").fadeToggle(300);
							  });
							});
						</script>
						<article>
							<h1 class="top" id='sideb{$sid_b}'>{$sidebox.name} ( <om class='downz{$sid_b}' style='display: none;'>&darr;</om><om class='upz{$sid_b}'>&uarr;</om> )</h1>
							<section class="body" id='sidebox{$sid_b}'>
								{$sidebox.data}
							</section>
							<omg style='display:none;'>{$sid_b++}</omg>
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
					</section>

					{$page}
				</aside>

				<div class="clear"></div>
			</div>
			<footer>
				<a href="http://raxezdev.com/fusioncms" id="logo" target="_blank"></a>
				<a href="http://raxezdev.com/fusioncms" id="logo1" target="_blank"></a>
				<p>&copy; Copyright 2012 {$serverName}</p>
			</footer>
		</section>
	</body>
</html>