
{def $valid_nodes = $block.valid_nodes}

{def $viewstyle = 'full'}
{if $block.view|contains('line')}
	{set $viewstyle = 'line'}
{elseif $block.view|contains('list')}
	{set $viewstyle = 'list'}
{/if}
<h1 class="overskrift">{$block.name}</h1>

<!-- BLOCK: START -->

<!-- BLOCK CONTENT: START -->
{foreach $block.valid_nodes as $valid_node}
     {node_view_gui view=$viewstyle content_node=$valid_node}
{/foreach}

<!-- BLOCK CONTENT: END -->

<!-- BLOCK: END -->