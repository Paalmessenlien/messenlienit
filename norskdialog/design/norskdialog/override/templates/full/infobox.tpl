{* Infobox - Full view *}

<div class="content-view-full">
    <div class="class-infobox">

            <h1>{attribute_view_gui attribute=$node.object.data_map.header}</h1>

        {if $node.object.data_map.image.content}
        <div class="attribute-image-center">
            {attribute_view_gui attribute=$node.object.data_map.image image_class='infoboximage'}
        </div>
		{/if}
        <div class="attribute-content">
            {attribute_view_gui attribute=$node.object.data_map.content}
        </div>
		<div class="clearing"></div>
        <div class="attribute-link">
            {attribute_view_gui attribute=$node.object.data_map.url}
        </div>

    </div>
</div>
