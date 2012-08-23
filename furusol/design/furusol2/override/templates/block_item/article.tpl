<div class="class-article float-break">

    <div class="attribute-header">
        <h2><a href={$node.url_alias|ezurl()}>{$node.name|wash()}</a></h2>
    </div>
        <p class="date">
            Publisert av: {attribute_view_gui attribute=$node.data_map.author} den {$node.object.published|l10n(shortdate)}
        </p>
    <div class="attribute-image">{attribute_view_gui attribute=$node.data_map.image image_class=$image_class}</div>

    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.intro}
    </div>
<a class="button" href={$node.url_alias|ezurl()}><span>Les mer...</span></a>
{include uri="design:parts/edit_single.tpl"}
</div>