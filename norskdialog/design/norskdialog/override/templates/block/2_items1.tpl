{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->

<!-- BLOCK CONTENT: START -->

<div class="class-article">

    <div class="attribute-header">
        <h2><a href={$valid_nodes[0].url_alias|ezurl()}>{$valid_nodes[0].name}</a></h2>
    </div>
{if $valid_nodes[0].data_map.image}
    <div class="attribute-image">{attribute_view_gui attribute=$valid_nodes[0].data_map.image image_class=block2items1}</div>
{/if}
    <div class="attribute-short">
        {attribute_view_gui attribute=$valid_nodes[0].data_map.intro}
    </div>

</div>

<div class="separator"></div>

<div class="class-article">

    <div class="attribute-header">
        <h2><a href={$valid_nodes[1].url_alias|ezurl()}>{$valid_nodes[1].name}</a></h2>
    </div>

    <div class="attribute-image">{attribute_view_gui attribute=$valid_nodes[1].data_map.image image_class=block2items1}</div>

    <div class="attribute-short">
        {attribute_view_gui attribute=$valid_nodes[1].data_map.intro}
    </div>

</div>

<!-- BLOCK CONTENT: END -->

<!-- BLOCK: END -->