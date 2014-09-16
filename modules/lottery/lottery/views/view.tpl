{if $hasExpired or $isFinalized }
    <div class="missing-content">
        <p>Subscriptions for this edition are closed.</p>
    </div>
    <table class="nice_table lottery-winners">
        <tr>
            <td colspan="2">Winners</td>
        </tr>
        {foreach from=$winners item=winner}
            <tr>
                <td width="10%">{$winner.rank}</td>
                <td width="90%">{$winner.anchor}</td>
            </tr>
        {/foreach}
    </table>
{else}
        {if not $participant}
            <!-- subscribe form -->
            <div class="subscribe-form">
                <form id="subscribe-form">
                    <label for="character-guid">Select a character</label>
                    <select id="character-guid">
                        <option value="0">-- choose --</option>
                        {foreach from=$characters item=character}
                            <option data-realm="{$character.realm_id}" value="{$character.guid}">{$character.name} ({$character.realm_name})</option>
                        {/foreach}
                    </select>
                    <input type="hidden" id="account-id" value="{$user_id}">
                    <input type="submit" value="Subscribe">
                    <br/>
                    <div class="helptext">* You can only subscribe one character, across all realms.</div>
                    <div class="helptext">* Once subscribed, the character cannot be changed.</div>
                    <div class="helptext">* DO NOT subscribe with multiple accounts. You might get banned.</div>
                </form>
            </div>
        {/if}
        <div id="subscribed-character" style="{if not $participant}display: none{/if}">
            <h2>You are currently subscribed with:
                <a><span id="current-subscribed-character" class="">
                    {foreach from=$characters item=character}
                        {if $character.guid == $participant->character_guid }
                            {$character.name} ({$character.realm_name})
                        {/if}
                    {/foreach}
                </span></a>
            </h2>
            The winners will be randomly selected in <a>{$expiresIn}</a> from now.
        </div>

{/if}

<input type="hidden" id="lottery-id" value="{$lottery->id}">
<!-- general lottery edition data -->
<table class="nice_table lottery-summary">
    <tbody>
        <tr>
            <td colspan="2">Details</td>
        </tr>
        {if $lottery->vp || $lottery->dp}
        <tr class="subscription-fee">
            <td width="30%">Subscription fee</td>
            <td width="70%">{$cost}</td>
        </tr>
        {/if}
        <tr>
            <td width="30%">Start date</td>
            <td width="70%">{date('d M Y, h:i a', strtotime($lottery->created))}</td>
        </tr>
        <tr>
            <td width="30%">End date</td>
            <td width="70%">{date('d M Y, h:i a', strtotime($lottery->end))}</td>
        </tr>
        <tr>
            <td width="30%">Rewards</td>
            <td width="70%">{$lottery->rewards}</td>
        </tr>
        <tr>
            <td width="30%">Number of winners</td>
            <td width="70%">{$lottery->winners_count}</td>
        </tr>

        <tr>
            <td width="30%">Subscribed characters</td>
            <td width="70%">
                <span id="subscribed-characters"></span>
            </td>
        </tr>



    </tbody>
</table>
