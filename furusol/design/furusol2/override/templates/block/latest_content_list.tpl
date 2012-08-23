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
<div class="attribute-header-block">
    <h2>{$block.name|wash()}</h2>
</div>
{/if}
    <ul>
    {foreach $block.valid_nodes as $valid_node}
       <li><a href={$valid_node.url_alias|ezurl()}>{$valid_node.name}</a></li>
    {/foreach}
    </ul>
</div>
<!-- BLOCK: END -->
{undef $valid_nodes}