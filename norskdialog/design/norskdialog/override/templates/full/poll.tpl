{* Poll - Full view *}

<div class="content-view-full">
    <div class="class-poll">

        <div class="attribute-header">
            <h1>{$node.name|wash()}</h1>
        </div>
        <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.description}
        </div>
        <form method="post" action={"content/action"|ezurl}>
        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
        <input type="hidden" name="ViewMode" value="full" />

        {let attribute=$node.data_map.question
             option_id=cond( is_set( $#collection_attributes[$attribute.id]), $#collection_attributes[$attribute.id].data_int,false() )}

        <h3>{$attribute.content.name|wash}</h3>

        {section name=OptionList loop=$attribute.content.option_list sequence=array(bglight,bgdark)}
            <label for="poll_option_{$attribute.id}_{$OptionList:item.id}"><input type="radio" name="ContentObjectAttribute_data_option_value_{$attribute.id}" value="{$OptionList:item.id}"
           {section show=$OptionList:item.id|eq($option_id)}checked="checked"{/section}
            id="poll_option_{$attribute.id}_{$OptionList:item.id}"
            />&nbsp;{$OptionList:item.value|wash}</label>
        {/section}

        {/let}
       {if is_unset( $versionview_mode )}
        <input class="button" type="submit" name="ActionCollectInformation" value="{"Vote"|i18n("design/ezwebin/full/poll")}" />
        {/if}

        </form>
{*
        <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.description}
        </div>

        <form method="post" action={"content/action"|ezurl}>
        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
        <input type="hidden" name="ViewMode" value="full" />

        <div class="content-question">
        {attribute_view_gui attribute=$node.data_map.question}
        </div>

        {if is_unset( $versionview_mode )}
        <input class="button" type="submit" name="ActionCollectInformation" value="{"Vote"|i18n("design/ezwebin/full/poll")}" />
        {/if}

        </form>
*}
        <div class="content-results">
            <div class="attribute-link">
                <p><a href={concat( "/content/collectedinfo/", $node.node_id, "/" )|ezurl}>{"Result"|i18n("design/ezwebin/full/poll")}</a></p>
            </div>
        </div>

    </div>
</div>