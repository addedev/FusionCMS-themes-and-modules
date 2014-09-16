<meta http-equiv="refresh" content="40">
<div align="center">
{form_open('chatbox')}
<input type="text" name="text" placeholder="Message..." style="width:535px; ">
<input type="submit" name="submit" value="Send"><br />
</form>
<br />

<div style="text-align:left; height:70px;  width:600px;    word-wrap: break-word; border:1px solid #080e14;  overflow:auto;">

{if $get}
{foreach from=$get  item=row}
[{$row['data']}]  <span style="font-weight:bold;">{$row['name']}</span>: {$row['message']}.<br />
{/foreach}
{/if}
</div>
</div>	
