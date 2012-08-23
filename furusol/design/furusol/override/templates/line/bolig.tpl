{* bolig - line view *}
<div class="content-view-line">
    <div class="class-article float-break">
            <h2><a href={$node.url_alias|ezurl}>{$node.data_map.navn.content|wash()}</a></h2>
        </div>

    {if $node.data_map.bilde.has_content}
                <div class="object-right">
                    {attribute_view_gui image_class=medium href=$node.url_alias|ezurl attribute=$node.data_map.bilde}

                </div>
            {/if}


            {if $node.data_map.intro.beskrivelse.is_empty|not}
                <div class="attribute-long">
                    {attribute_view_gui attribute=$node.data_map.beskrivelse}
                </div>
    </div>
</div>