{def $valid_nodes = $block.valid_nodes}
{def $blocks = sum(count($block.valid_nodes), -1)}
{$block|attribute(show)}
{for 0 to $blocks as $counter}

<!-- BLOCK: START -->

<!-- BLOCK CONTENT: START -->

<div class="class-article">

    <div class="attribute-header">
        <h1 class="overskrift1"><a href={$valid_nodes[$counter].url_alias|ezurl()}>{$valid_nodes[$counter].name}</a></h1>
    </div>
{if $valid_nodes[$counter].data_map.image}
    <div class="attribute-image">{attribute_view_gui attribute=$valid_nodes[$counter].data_map.image image_class=large}</div>
{/if}
    <div class="ingress">
        {attribute_view_gui attribute=$valid_nodes[$counter].data_map.intro}
    </div>
    <div class="read-more">
    <a href={$valid_nodes[$counter].url_alias|ezurl()}>Les mer om..</a>
	</div>
</div>
{/for}