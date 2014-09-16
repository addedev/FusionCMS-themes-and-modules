<i>When Successfully trading both characters will be flagged for rename.</i><br />Use this character when proposing<br />
{form_open("char_trade/submitPropose")}
	<select name="my_chars">
		{if $rowes}
			{foreach from=$rowes item=rowe}
				<option value="{$rowe['guid']}">{$rowe['name']}</option>
			{/foreach}
	</select>
		{else}
		{/if}

<br /><br />
<font size='2' color='gray'>Name &nbsp-&nbsp Level &nbsp-&nbsp Armory &nbsp-&nbsp Class &nbsp-&nbsp Description
<br /><br />
		{if $rows}
			{foreach from=$rows item=row}
				<input type="radio" name="charid" value="{$row['id']}">&nbsp{$row['name']} - {$row['level']} - <a href="/character/1/{$row['armory']}">Armory</a> - {$row['class']} - {$row['description']}</input><br /><br />
			{/foreach}
		<br />
		<input type="submit" value="Propose"/>
</form>
		{else}
		{/if}