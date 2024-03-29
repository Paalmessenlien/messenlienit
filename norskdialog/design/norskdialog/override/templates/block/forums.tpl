{def $valid_nodes = $block.valid_nodes}
{def $blocks = sum(count($block.valid_nodes), -1)}
{for 0 to $blocks as $counter}
{*$valid_nodes[$counter].children|attribute(show)*}
{if $block.name}
<div class="attribute-header">
<h1>
<a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">{$block.name}</a>
</h1></div>
{/if}


{*$valid_nodes[$counter]|attribute(show)*}
{def $forums_list = fetch( 'content', 'list', hash( 'parent_node_id', $valid_nodes[$counter].node_id,
                                                   	'class_filter_type',  'include',
              										'class_filter_array', array( 'forum' ) ) ) }
{if $forums_list|count()|gt(0)}
<ul>
<li><a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">{$valid_nodes[$counter].name}</a></li>
{foreach $forums_list as $forums}
	<li><a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">{$valid_nodes[$counter].name}</a> / <a href={$forums.url_alias|ezurl()} title="{$forums.name}">{$forums.name}</a></li>
{/forums}
</ul>
{/for}
{*
<div class="content-view-line">
    <div class="class-forum">
        <table class="list forum" cellspacing="0">
            <tr>
                <th class="topic"> Forum </th>
                <th class="topic"> {"Number of topics"|i18n("design/ezwebin/line/forum")} </th>
                <th class="replies"> {"Number of posts"|i18n("design/ezwebin/line/forum")} </th>
                <th class="lastreply"> {"Last reply"|i18n( "design/ezwebin/line/forum" )} </th>
            </tr>
            <tr>
                <td><h2><a href={$node.url_alias|ezurl}>{$node.name|wash}</a></h2>
                    <div class="attribute-short"> {attribute_view_gui attribute=$node.data_map.description} </div>
                    <div class="attribute-link">
                        <p><a href={$node.url_alias|ezurl}>{"Enter forum"|i18n("design/ezwebin/line/forum")}</a></p>
                    </div></td>
                <td>{fetch('content','list_count',hash(parent_node_id,$node.node_id))}</td>
                <td>{fetch('content','tree_count',hash(parent_node_id,$node.node_id))}</td>
                <td> {let forum_list=fetch_alias( children, hash( parent_node_id, $node.node_id,
                    limit, 4,
                    sort_by, array( 'modified_subnode', false() ) ) )}
                    <ul>
                        {section loop=$forum_list}
                        <li> {node_view_gui view=line content_node=$:item} </li>
                        {/section}
                    </ul>
                    {/let}</td>
            </tr>
        </table>
    </div>
</div>
*}
