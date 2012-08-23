{def $valid_nodes = $block.valid_nodes}
<!-- BLOCK: START -->
<div class="block-type-latest-content">
{def $block_name = ''}

{if is_set( $block.name )}
    {set $block_name = $block.name}
{else}
    {set $block_name = ezini( $block.type, 'Name', 'block.ini' )}
{/if}
{if $block_name}
<h2>{$block_name}</h2>
{/if}
<!-- BLOCK CONTENT: START -->

{foreach $valid_nodes as $valid_node}

{node_view_gui view='block_item' image_class='block2items1' content_node=$valid_node}

{/foreach}

<!-- BLOCK CONTENT: END -->

</div>
<!-- BLOCK: END -->
{undef $valid_nodes}