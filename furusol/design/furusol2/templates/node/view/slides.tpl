<div>
	<img style="float:left;" alt="{$node.name|wash()}" src="{$node.object.data_map.image.content.original.url}" />
	<dl class="infotext">
	<dd><h2><a href={$node.url_alias|ezurl()}>{$node.name|wash()} >></a></h2></dd>
	<dd><p>{attribute_view_gui attribute=$node.object.data_map.intro}</p></dd>
	</dl>
</div>
