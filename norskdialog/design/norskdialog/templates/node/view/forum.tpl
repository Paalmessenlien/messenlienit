<h2><a class="overskrift" title={$node.name|wash} href={$node.url_alias|ezurl}>{$node.name|wash}</a></h2>
<div class="attribute-byline">
            <p class="date">{$node.object.published|l10n(datetime)}</p>
             {let owner=$node.object.owner owner_map=$owner.data_map}
             <p class="author">{$owner.name|wash}
                   {section show=is_set( $owner_map.title )}
                       <br/>{$owner_map.title.content|wash}
                   {/section}</p>
             {/let}
</div>
<div class="attribute-short">{$node.data_map.message.content|shorten(250)}<a href={$node.url_alias|ezurl} title="{$node.name|wash}">Les mer..</a></div>
<div class="attribute-link">
<p><a href={$node.url_alias|ezurl}>{fetch('content','list_count',hash(parent_node_id,$node.node_id))} Kommentarer</a></p>
</div>
               {* <td>{fetch('content','tree_count',hash(parent_node_id,$node.node_id))}</td>*}
				{*let forum_list=fetch_alias( children, hash( parent_node_id, $node.node_id,
                    limit, 4,
                    sort_by, array( 'modified_subnode', false() ) ) )}
                    <ul>
                        {section loop=$forum_list}
                        <li> {node_view_gui view=line content_node=$:item} </li>
                        {/section}
                    </ul>
                    {/let*}
