<div align="center">

{if $rows}
{foreach from=$rows item=row}
{form_open("banappeal/decision")}
--------------------------------------------------<br />
<input type="hidden" name="test" value="{$row['message']}">From: {$row['remetent']} in {$row['data']}<br />
<input type="hidden" name="test1" value="{$row['remetent']}">
Appeal: {$row['message']}.<br />
--------------------------------------------------<br />
<input type="submit"  name="accept" value="Accept">
<input type="submit" name="denie" value="Denie"><br />
</form>
{/foreach}
{/if}



</div>