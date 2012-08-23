<div class="content-view-block-item">
        <div class="attribute-byline float-break">
            <p class="date">{$node.object.published|l10n(date)}</p>
            <p class="author">{$node.data_map.author.content|wash}</p>
        </div>
        <div class="attribute-short">
            <p>Artikkel: <a href={$node.parent.url_alias|ezurl()}>{$node.parent.name|wash()}</a></p>
        	<strong>{$node.name}</strong><br />
            {attribute_view_gui attribute=$node.data_map.message}
        </div>
<hr />
</div>