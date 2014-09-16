{if $rowser}
	{foreach from=$rowser item=row}
		{form_open("char_trade/submitAccept")}
			<a href="/character/1/{$row['p_char']}">This Character</a> wishes to trade for <a href="/character/1/{$row['s_char']}">Your character</a>
			<br />
			<input type="submit" value="Accept"/>
		</form>
		{form_open("char_trade/submitDecline")}
			{if $rowser}
				<input type="submit" value="Decline"/>
			{else}
			{/if}
		</form>
	{/foreach}
{else}
{/if}

{if $rowsers}
	{foreach from=$rowsers item=row}
		{form_open("char_trade/submitCancel")}
			<a href="/character/1/{$row['p_char']}">This Character</a> wishes to trade for <a href="/character/1/{$row['s_char']}">Your character</a>
			<br />
			<input type="submit" value="Cancel"/>
		</form>
	{/foreach}
{else}
{/if}

<br /><br />You can make your character up for trade for others to propose to you.<br /><br />

{form_open("char_trade/submit")}
	<select name="my_chars">
		{if $rows}
			{foreach from=$rows item=row}
				<option value="{$row['guid']}">{$row['name']}</option>
			{/foreach}
	</select>
		<input type="text" name="class" placeholder="Class" /><br />
		<textarea type="text" name="description" rows="5" cols="101" placeholder="Description about the character" /></textarea><br />
		<br />
		<input type="submit" value="Add"/>
</form>
		{else}
		{/if}
		
		<br />
