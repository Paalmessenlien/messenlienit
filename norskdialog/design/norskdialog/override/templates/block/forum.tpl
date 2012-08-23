{def $valid_nodes = $block.valid_nodes}
{def $blocks = sum(count($block.valid_nodes), -1)}
{def $posts = '5'}
{def $view = 'forum'}
{if $block.view|contains('forum_list')}
	{set $view = 'forum_list'}
{/if}
{if $block.view|contains('10')}
	{set $posts = '10'}
{elseif $block.view|contains('20')}
	{$set $posts = '20'}}
{/if}


{for 0 to $blocks as $counter}
{def $topic_list = fetch( 'content', 'list', hash( 'parent_node_id', $valid_nodes[$counter].node_id,
                                                   'limit', $posts,
                                                   'attribute_filter', array( array( 'forum_topic/sticky','=',1 ) ),
                                                  'sort_by', array( array( attribute, false(), 'forum_topic/sticky' ), array( 'modified_subnode', false() ) ) ) )
     $topic_count = fetch( 'content', 'list_count', hash( 'parent_node_id', $valid_nodes[$counter].node_id ) )}
{if $topic_list|count()|gt(0)}
{*$valid_nodes[$counter].children|attribute(show)*}
<div class="attribute-header">
<h1>
<a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">
{if $block.name}
{$block.name}
{else}
{$valid_nodes[$counter].name|wash}
{/if}
</a></h1></div>
    {*if $valid_nodes[$counter].object.can_create}
    <div class="submit">
        <form method="post" action={"content/action/"|ezurl}>
            <input class="button forum-new-topic" type="submit" name="NewButton" value="{'New topic'|i18n( 'design/ezwebin/full/forum' )}" />
            <input type="hidden" name="ContentNodeID" value="{$valid_nodes[$counter].node_id}" />
            <input type="hidden" name="ContentObjectID" value="{$valid_nodes[$counter].contentobject_id}" />
            <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'Locale', 'site.ini')}" />
            <input type="hidden" name="NodeID" value="{$valid_nodes[$counter].node_id}" />
            <input type="hidden" name="ClassIdentifier" value="forum_topic" />
        </form>
     </div>
	{/if*}
{*$valid_nodes[$counter]|attribute(show)*}


{foreach $topic_list as $post max $posts}
	{if eq($post.data_map.sticky.value, 1)}
		{node_view_gui view=$view content_node=$post}
	{/if}
{/forach}
{/if}
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
