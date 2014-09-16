{TinyMCE()}
<section class="big box" id="create-lottery" style="display: none">
    <h2>Create lottery session</h2>
    <span>
        <button class="nice_button" id="toggle-list">Return to list</button>
    </span>
    <form id="create-lottery-form">
        <label for="days"><b>Days active</b> (number of days in which lottery will be running, starting from now)</label>
        <input type="text" id="days" value="7">
        <label for="winners-count">Number of <b>winners</b></label>
        <input type="text" id="winners-count" value="3">

        <label for="vp"><b>Voting points</b> (subscription cost). 0 = free subscription</label>
        <input type="text" id="vp" value="{$vp}">

        <label for="dp"><b>Donation points</b> (subscription cost). 0 = free subscription</label>
        <input type="text" id="dp" value="{$dp}">


        <label for="rewards"><b>Rewards</b></label>
        <textarea name="" id="rewards" cols="30" rows="10" class="tinymce"></textarea>
        <label for="description"><b>Description</b> (will be used in the article posted automatically)</label>
        <textarea id="description" class="tinymce" cols="30" rows="10"></textarea>
        Post automatic article <input type="checkbox" id="post_article" checked="checked">
        <input type="submit" value="Submit lottery session">
    </form>
</section>

<section class="big box" id="lottery-list">
    <h2>Lottery sessions</h2>
    <span>
        <button class="nice_button" id="toggle-create">Create lottery session</button>
    </span>
    <ul id="lotteries-ul">
        <li>
            <table width="100%">
                <tr>
                    <td width="15%">Start</td>
                    <td width="30%">End</td>
                    <td width="5%">Win.</td>
                    <td width="30%">Rewards</td>
                    <td width="15%">Status</td>
                    <td width="15%">Actions</td>
                </tr>
            </table>
        </li>
        {foreach from=$lotteries item=lottery}
            <li id="lottery-id-{$lottery->id}" {if not $lottery->finished}class="running"{/if}>
                <table width="100%">
                    <tr>
                        <td width="15%">{date('d M', strtotime($lottery->created))}</td>
                        <td width="30%">{date('d M, h:i a', strtotime($lottery->end))}</td>
                        <td width="5%">{$lottery->winners_count}</td>
                        <td width="30%"><a data-tip="{strip_tags($lottery->rewards, '<br>')}">hover me</a></td>
                        <td width="15%">{if $lottery->finished}closed{else}<span class="green">running</span>{/if}</td>
                        <td width="15%" style="text-align:right;">
                            <a data-id="{$lottery->id}" data-tip="Delete" rel="delete">
                                <img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" />
                            </a>
                        </td>
                    </tr>
                </table>
            </li>
        {/foreach}
    </ul>
</section>

