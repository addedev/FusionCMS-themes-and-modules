<table class="nice_table" cellspacing="0" cellpadding="0">
	<tr>
		<td> </td>
	</tr>
</table>
<table class="nice_table" cellspacing="0" cellpadding="0">
	<tr>
		<td width="20%" style="text-align:center;padding: 10px;background: rgba(153,153,153,0.1);border-top-left-radius: 5px;border-top-right-radius: 5px;box-shadow: 0 2px 1px rgba(0,0,0,.3), inset 0 -1px 0 rgba(255,255,255,.01);color: #c3b6a1;">Top 10 donations of this week</td>
	</tr>
</table>
{if $rowschap}
		<table class="nice_table" cellspacing="0" cellpadding="0">
			<tr>
				<td width="20%" align="left" style="background: rgba(153,153,153,0.1);border-top-left-radius: 5px;border-top-right-radius: 5px;box-shadow: 0 2px 1px rgba(0,0,0,.3), inset 0 -1px 0 rgba(255,255,255,.01);color: #c3b6a1;"><img src="/application/images/icons/user.png"/> Nickname</td>
				<td width="20%" align="center" style="background: rgba(153,153,153,0.1);border-top-left-radius: 5px;border-top-right-radius: 5px;box-shadow: 0 2px 1px rgba(0,0,0,.3), inset 0 -1px 0 rgba(255,255,255,.01);color: #c3b6a1;"><img src="/application/images/icons/coins.png"/> Purchases</td>
				<td width="20%" align="right" style="background: rgba(153,153,153,0.1);border-top-left-radius: 5px;border-top-right-radius: 5px;box-shadow: 0 2px 1px rgba(0,0,0,.3), inset 0 -1px 0 rgba(255,255,255,.01);color: #c3b6a1;">Country</td>
			</tr>
		{foreach from=$rowschap key=key item=rowchap}
		<tr>
			<td width="20%"align="left"><b>{$key + 1}.</b> <a data-tip="View character profile" href="{$url}profile/{$rowchap.user_id}">{$rowchap.nickname}</td>
			<td width="20%"align="center">{$rowchap.count}</td>
			<td width="20%" align="right">{$rowchap.location}</td>
		</tr>
		{/foreach}
	</table>
{else}
<br>
	<center><font color="red">No donations for this week</font></center>
{/if}

<table class="nice_table" cellspacing="0" cellpadding="0">
	<tr>
		<td> </td>
	</tr>
</table>
<table class="nice_table" cellspacing="0" cellpadding="0">
	<tr>
		<td width="20%" style="text-align:center;padding: 10px;background: rgba(153,153,153,0.1);border-top-left-radius: 5px;border-top-right-radius: 5px;box-shadow: 0 2px 1px rgba(0,0,0,.3), inset 0 -1px 0 rgba(255,255,255,.01);color: #c3b6a1;">Top 10 voters of this week</td>
	</tr>
</table>
{if $rowschad}
		<table class="nice_table" cellspacing="0" cellpadding="0">
			<tr>
				<td width="20%" align="left" style="background: rgba(153,153,153,0.1);border-top-left-radius: 5px;border-top-right-radius: 5px;box-shadow: 0 2px 1px rgba(0,0,0,.3), inset 0 -1px 0 rgba(255,255,255,.01);color: #c3b6a1;"><img src="/application/images/icons/user.png"/> Nickname</td>
				<td width="20%" align="center" style="background: rgba(153,153,153,0.1);border-top-left-radius: 5px;border-top-right-radius: 5px;box-shadow: 0 2px 1px rgba(0,0,0,.3), inset 0 -1px 0 rgba(255,255,255,.01);color: #c3b6a1;"><img src="/application/images/icons/lightning.png"/> Eearned points</td>
				<td width="20%" align="right" style="background: rgba(153,153,153,0.1);border-top-left-radius: 5px;border-top-right-radius: 5px;box-shadow: 0 2px 1px rgba(0,0,0,.3), inset 0 -1px 0 rgba(255,255,255,.01);color: #c3b6a1;">Country</td>
			</tr>
		{foreach from=$rowschad key=key item=rowchad}
		<tr>
			<td width="20%"align="left"><b>{$key + 1}.</b> <a data-tip="View character profile" href="{$url}profile/{$rowchad.user_id}">{$rowchad.nickname}</td>
			<td width="20%" align="center">{$rowchad.count}</td>
			<td width="20%" align="right">{$rowchad.location}</td>
		</tr>
		{/foreach}
	</table>
{else}
	<br>
	<center><font color="red">No votes for this week</font></center>
{/if}