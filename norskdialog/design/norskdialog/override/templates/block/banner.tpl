{def $valid_nodes = $block.valid_nodes}
{*$valid_nodes.0.data_map|attribute(show)*}
{attribute_view_gui attribute=$valid_nodes.0.data_map.banner_text}

{*if is_set( $valid_nodes.0.data_map.image.content[$size].alternative_text )}
{set $alternative_text=$valid_nodes.0.data_map.image.content[$size].alternative_text}
{/if*}
    {if $valid_nodes.0.data_map.image.content}
	<div class="attribute-image-left">
		<a href={$valid_nodes.0.url_alias|ezurl()} title="{$valid_nodes.0.name}">
  		{attribute_view_gui attribute=$valid_nodes.0.data_map.image image_class=banner}
		</a>
	</div>
	{/if}