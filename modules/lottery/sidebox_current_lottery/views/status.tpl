{if $isFinalized}
    <!-- is finalized, display winners -->
    Edition <b>{$edition}</b> is finished.  <br/>
    <table width="100%">
        {foreach from=$winners item=winner}
        <tr>
            <td>Rank {$winner.rank}</td>
            <td>
                {$winner.anchor}
            </td>
        </tr>
        {/foreach}
    </table>
{else}
    <!-- not finalized, display statistics -->
    <table width="100%">
        <tr>
            <td>Current edition</td>
            <td><a href="{$url}lottery/edition/{$lottery->id}">{$edition}</a></td>
        </tr>
        <tr>
            <td>Time left</td>
            <td>{$expiresIn}</td>
        </tr>
        {if $lottery->vp || $lottery->dp}
        <tr>
            <td>Subscription fee</td>
            <td>{$cost}</td>
        </tr>
        {/if}
        <tr>
            <td>Subscribers (so far)</td>
            <td>{$participantsCount}</td>
        </tr>
        <tr>
            <td>Your status</td>
            <td>
                {if $isSubscribed}
                    <span style="color: green">subscribed</span>
                {else}
                    not subscribed
                {/if}
            </td>
        </tr>
        {if not $isSubscribed}
            <tr>
                <td style="text-align: center;" colspan="2">
                    <a data-direct="1" href="{$url}lottery/edition/{$lottery->id}">Click here to subscribe</a>
                </td>
            </tr>
        {/if}
    </table>
{/if}
