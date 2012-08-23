{* Folder - Full view *}

<div class="content-view-full">
{if $node.object.data_map.show_children.data_int}
  {ezpagedata_set( 'left_menu', false() )}
<div class="left-column3">
<br/>
	{delimiter}
        <div class="block-separator"></div>
    {/delimiter}
    </div>
{/if}
    <div class="center-column3">
        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>

        {if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
        {/if}

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}

        {if $node.object.data_map.show_children.data_int}
      
            {def $page_limit = 10
                 $classes = array( 'infobox' )
                 $children = array()
                 $children_count = ''}

            {if le( $node.depth, '3')}
                {set $classes=array( 'infobox', 'folder', 'banner', 'topp_blokk' )}
            {/if}

            {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'exclude',
                                                          'class_filter_array', $classes,
                                                          'limit', $page_limit ) )
                 $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'exclude',
                                                                      'class_filter_array', $classes ) )}

            <div class="content-view-children">
                {foreach $children as $child }
                    {node_view_gui view='line' content_node=$child}
                {/foreach}
            </div>

            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

        {/if}
    </div>

    <div class="right-column3">
	<div class="right-column3-content">
{include uri='design:parts/extra_info_article.tpl'}
	</div>
</div>
<div class="clearing"></div>
</div>
