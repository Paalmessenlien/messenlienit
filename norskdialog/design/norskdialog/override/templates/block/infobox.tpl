{def $valid_nodes = $block.valid_nodes}
{def $blocks = sum(count($block.valid_nodes), -1)}
{for 0 to $blocks as $counter}
<h1 class="overskrift">{$block.name}</h1>
    <div class="class-infobox {$block.view}">
    	{if $valid_nodes[$counter].data_map.image}
        <div class="attribute-image">
        {if $valid_nodes[$counter].data_map.url.content}
			<a href={$valid_nodes[$counter].data_map.url.content} target="_new">
			{/if}
            	{attribute_view_gui attribute=$valid_nodes[$counter].data_map.image image_class='infoblock'}
        	{if $valid_nodes[$counter].data_map.url.content}
        	</a>
        	{/if}
        </div>
		{/if}
		{if $valid_nodes[$counter].data_map.content.has_content}

        <div class="attribute-content">
            {attribute_view_gui attribute=$valid_nodes[$counter].data_map.content}
        </div>
		{/if}
    </div>
{/for}