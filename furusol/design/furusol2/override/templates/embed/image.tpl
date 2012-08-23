{if eq($classification, overlay)}
{def $img_size = $object_parameters.size}
{def $img_url = $object.data_map.image.value[$img_size].full_path|ezroot}
{def $img_width = $object.data_map.image.value.original.width}
{def $img_height = $object.data_map.image.value.original.height}
{def $img_id =	$object.id}

<!-- trigger elements --> 
<div class="img_{$img_id}" id="triggers">
	<span class="open-large"></span>
	<img class="image_{$img_id}" src={$img_url}  rel="#img_{$img_id}" title="Klikk for større bilde" />	
</div>

<!-- overlays --> 
<div class="simple_overlay" id="img_{$img_id}"> 
	<img src={$object.data_map.image.value.original.full_path|ezroot} width={$img_width} height={$img_height} />
{if $object.data_map.caption.has_content}
	<div class="details"> 
		<h2>{$object.name|wash}</h2> 
 		{attribute_view_gui attribute=$object.data_map.caption}
	</div>
{/if}
</div> 
 
{literal}
<script> 
$(document).ready(function() {  
	$("img[rel]").overlay({fixed: false, height:0 });
	$("#{/literal}img_{$img_id}{literal}").css({ width:"{/literal}{$img_width}px", height:"{$img_height}{literal}px" });
	$(".{/literal}img_{$img_id}{literal} img[title]").tooltip();

});

</script>
{/literal}
{elseif eq($classification, clear)}
    <div class="attribute-image-clear">{if is_set( $link_parameters.href )}{attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size href=$link_parameters.href|ezurl target=$link_parameters.target border_size=first_set( $object_parameters.border_size, '0' ) border_color=first_set( $object_parameters.border_color, '' ) border_style=first_set( $object_parameters.border_style, 'solid' ) margin_size=first_set( $object_parameters.margin_size, '' )}{else}{attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size border_size=first_set( $object_parameters.border_size, '0' ) border_color=first_set( $object_parameters.border_color, '' ) border_style=first_set( $object_parameters.border_style, 'solid' ) margin_size=first_set( $object_parameters.margin_size, '' )}{/if}</div>
{else}
<div class="content-view-embed">
<div class="class-image">
    <div class="attribute-image">{if is_set( $link_parameters.href )}{attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size href=$link_parameters.href|ezurl target=$link_parameters.target border_size=first_set( $object_parameters.border_size, '0' ) border_color=first_set( $object_parameters.border_color, '' ) border_style=first_set( $object_parameters.border_style, 'solid' ) margin_size=first_set( $object_parameters.margin_size, '' )}{else}{attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size border_size=first_set( $object_parameters.border_size, '0' ) border_color=first_set( $object_parameters.border_color, '' ) border_style=first_set( $object_parameters.border_style, 'solid' ) margin_size=first_set( $object_parameters.margin_size, '' )}{/if}</div>

    {if $object.data_map.caption.has_content}
    {if is_set( $object.data_map.image.content[$object_parameters.size].width )}
        {def $image_width = $object.data_map.image.content[$object_parameters.size].width}
        {if is_set($object_parameters.margin_size)}
            {set $image_width = $image_width|sum(  $object_parameters.margin_size|mul( 2 ) )}
        {/if}
        {if is_set($object_parameters.border_size)}
            {set $image_width = $image_width|sum(  $object_parameters.border_size|mul( 2 ) )}
        {/if}
        <div class="attribute-caption" style="width: {$image_width}px">
    {else}
        <div class="attribute-caption">
    {/if}
            {attribute_view_gui attribute=$object.data_map.caption} </div>
        {/if} </div>
</div>
{/if}