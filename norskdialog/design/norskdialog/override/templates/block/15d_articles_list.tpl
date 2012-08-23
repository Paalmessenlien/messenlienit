
{def $block_name = ''}

{if is_set( $block.name )}
    {set $block_name = $block.name}
{else}
    {set $block_name = ezini( $block.type, 'Name', 'block.ini' )}
{/if}
{if $block_name}
<div class="attribute-header">
<h1>
			{$block_name}
    	</h1>
</div>{/if}
<div class="box-content">
    <ul>
    {foreach $block.valid_nodes as $item}
       <li><div><a href={$item.url_alias|ezurl} title="{$item.name|wash()}">{$item.name|wash()}</a></div></li>
    {/foreach}
    </ul>
</div>

{*$block.valid_nodes.0.parent.path_identification_string|attribute(show)*}