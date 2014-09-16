{if $rows}
	{foreach from=$rows item=row}
<br />
<div align="center">
----------------------------------------------------------------------
<br />
{if {$row['status']} != 0}
Status : <span style="color:green;">Fixed</span>
{else}
Status : <span style="color:red;">Not fixed</span>
{/if}
<br />
{if {$row['priority']} == 1}
Priority :  <span style="color:green;">Low</span>
{elseif {$row['priority']} == 2}
Priority :  <span style="color:Yellow;">Medium</span>
{elseif {$row['priority']} == 3}
Priority :  <span style="color:red;">Heigh</span>
{/if}
<br />
{form_open('bugreport/fixed')}
<input type="hidden" value="{$row['bug']}" name="bugname" /><span style="color:#A07332;">{$row['bug']}</span> 
<br /> Posted by : <a href="">{$row['remetent']}</a> in {$row['data']}.<br />
{foreach from=$check item=value}
{if $value}
{if {$row['status']} == 0}
<input type="submit" name="submit"  id="submit" value="Fixed"> <br />
</form>
{/if}
{/if}
{/foreach}
----------------------------------------------------------------------
	</div>
	{/foreach}
{/if}
