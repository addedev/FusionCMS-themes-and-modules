<table style="margin-top: 20px" class="nice_table">
    <tr>
        <td>Edition</td>
        <td>Start</td>
        <td>End</td>
        <td>Winners count</td>
        <td>Status</td>
    </tr>
    {foreach from=$lotteries item=lottery}
        <tr>
            <td><a href="{$url}lottery/edition/{$lottery->id}">edition #{$lottery->id}</a></td>
            <td>{date('d M', strtotime($lottery->created))}</td>
            <td>{date('d M, h:i a', strtotime($lottery->end))}</td>
            <td>{$lottery->winners_count}</td>
            <td>{if $lottery->finished}closed{else}<span class="green"><b>running</b></span>{/if}</td>
        </tr>
    {/foreach}
</table>
