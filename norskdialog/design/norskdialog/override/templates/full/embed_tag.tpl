<div class="content-view-full">
<div id="content-article">
<div class="left-column3">
<br/>
	{delimiter}
        <div class="block-separator"></div>
    {/delimiter}
    </div>
        <div class="attribute-header">
            <h2>{$node.data_map.title.content|wash()}</h2>
        </div>

        <div class="attribute-byline">
        {if $node.data_map.author.content.is_empty|not()}
        <p class="author">
             {attribute_view_gui attribute=$node.data_map.author}
        </p>
        {/if}
        <p class="date">
             {$node.object.published|l10n(shortdatetime)}
        </p>
        </div>
            {if $node.data_map.embed.content.is_empty|not}
                <div class="attribute-short">

                    {$node.data_map.embed.content}

                </div>
            {/if}
</div>
</div>