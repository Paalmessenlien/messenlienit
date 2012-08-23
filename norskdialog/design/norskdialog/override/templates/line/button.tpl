
{if $node.data_map.logo.has_content}
<div align="center">
{if $node.data_map.inter_url.has_content}
<a class="logo_knapp"" href={$node.data_map.inter_url.content.main_node.url_alias|ezurl}>
{else}
<a class="logo_knapp" href="{$node.data_map.ekstern_url.content}">
{/if}
{attribute_view_gui attribute=$node.data_map.logo image_class=liten_logo}
</a>
</div>
{else}
<h3 class="knapp">
{if $node.data_map.inter_url.has_content}
<a href={$node.data_map.inter_url.content.main_node.url_alias|ezurl}>
{else}
<a href="{$node.data_map.ekstern_url.content}">
{/if}
{$node.name}
</a>
</h3>
{/if}

{*$node.data_map|attribute(show)*}