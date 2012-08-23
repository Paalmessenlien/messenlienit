{def $valid_nodes = $block.valid_nodes}

<div class="block-type-5items block-view-{$block.view}">
<!-- BLOCK CONTENT: START -->
{if $block.name}
<div class="attribute-header-block">
    <h2>{$block.name|wash()}</h2>
</div>
{/if}
{foreach $valid_nodes as $valid_node }

{node_view_gui view='block_item' image_class='medium' content_node=$valid_node}

{/foreach}
<!-- BLOCK CONTENT: END -->

</div>

{undef $valid_nodes}