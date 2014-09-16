<center>
{if $rows}
	{foreach from=$rows item=row}
		Application status<br />
		{if $row['status'] == "Pending"}
		<b style="color:orange;">{$row['status']}</b>
		{/if}
		{if $row['status'] == "Declined"}
		<b style="color:red;">{$row['status']}</b>
		{/if}
		{if $row['status'] == "Accepted"}
		<b style="color:green;">{$row['status']}</b>
		{/if}<br />
		{/foreach}
{else}
	No pending applications. <br /><br />
{/if}
</center>
