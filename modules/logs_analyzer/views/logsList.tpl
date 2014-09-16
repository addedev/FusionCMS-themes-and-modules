{foreach $logs as $row}
    <li class="{$row.rowClass}">
        {foreach $row.visible as $tag}
            <span class="tag {$tag.class}">{$tag.text}</span>
        {/foreach}
    </li>
{/foreach}
