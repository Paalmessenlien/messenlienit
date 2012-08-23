{def $valid_nodes = $block.valid_nodes}
{def $size = 'h1'}
{if $block.view|contains('h2')}
	{set $size = 'h2'}
{elseif $block.view|contains('h3')}
	{set $size = 'h3'}
{/if}
<div class="attribute-header">
<{$size}><a href={$valid_nodes[0].url_alias|ezurl()}>
{if $block.name}
{$block.name}
{else}
{$valid_nodes[0].name}
{/if}
</a></{$size}>
</div>