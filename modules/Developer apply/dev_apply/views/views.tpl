<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
</script>
<script> 
$(document).ready(function(){
  $("#flip").click(function(){
    $("#panel").slideToggle("slow");
  });
});
</script>
<style type="text/css"> 
#flip
{
font-size:15px;
color:cyan;
}
#panel
{
display:none;
}
</style>
<center>
{if $rowser}
	{foreach from=$rowser item=row}
	{form_open("dev_apply/accept")}
	<div id="flip">Show/Hide</div>
	<div id="panel">
		Name: <a href="http://WoWScream.com/profile/{$row['user_id']}" style="color:pink;">{$row['name']}</a> - Age: {$row['age']} - Country: {$row['country']} - Played Time: {$row['info1']}<br />
		<p style="color:purple;">
		{if $questionnr >= 2}
		{$info2}</p>
		{$row['info2']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 3}
		{$info3}</p>
		{$row['info3']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 4}
		{$info4}</p>
		{$row['info4']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 5}
		{$info5}</p>
		{$row['info5']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 6}
		{$info6}</p>
		{$row['info6']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 7}
		{$info7}</p>
		{$row['info7']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 8}
		{$info8}</p>
		{$row['info8']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 9}
		{$info9}</p>
		{$row['info9']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 10}
		{$info10}</p>
		{$row['info10']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 11}
		{$info11}</p>
		{$row['info11']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 12}
		{$info12}</p>
		{$row['info12']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 13}
		{$info13}</p>
		{$row['info13']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 14}
		{$info14}</p>
		{$row['info14']}<br />
		{else}
		{/if}
		<p style="color:purple;">
		{if $questionnr >= 15}
		{$info15}</p>
		{$row['info15']}<br />
		{else}
		{/if}
		<input type="hidden" name="applyid" value="{$row['user_id']}"></input>
		<input type="submit" value="Accept"/></form>
		{form_open("dev_apply/decline")}
		<input type="hidden" name="applyid" value="{$row['user_id']}"></input>
		<input type="submit" value="Decline"/></form>
		</form>
		<br />
		<p style="color:red;">____________________________________________________________________________________________</p>
		</div>
		<br />{/foreach}
{else}
	No applications awaiting approval. <br /><br />
{/if}
</center>
