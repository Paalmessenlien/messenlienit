{* Article - Full view *}

{literal}
	<script language="javascript" type="text/javascript">
		<!--
		$(document).ready(function(){
			$("#tabs").tabs();
		});
		//-->
	</script>
{/literal}
<div class="content-view-full">
    <div class="class-article">

        <h1>{$node.data_map.activity_name.content|wash()}</h1>
   <div class="yui3-g">
        <div class="yui3-u-1-2">
        {if $node.data_map.activity_description.content.is_empty|not}
		<h2>Aktivitetsbeskrivelse</h2>
            <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.activity_description}
            </div>
        {/if}
       {if $node.data_map.target.content.is_empty|not}
		<h2>Målsetning</h2>
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.target}
            </div>

        {/if}
        {if $node.data_map.sub_activities.content.is_empty|not}
         <h2>Underaktiviteter</h2>
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.sub_activities}
            </div>
        {/if}
         <h2>Kontaktinformasjon</h2>
         {if $node.data_map.cantactinfo_1.has_content}
            <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.cantactinfo_1}
            </div>
          {/if}
        {if $node.data_map.cantactinfo_2.has_content}
            <div class="attribute-short">
               {attribute_view_gui attribute=$node.data_map.cantactinfo_2}
            </div>
          {/if}
         {if $node.data_map.cantactinfo_3.has_content}
            <div class="attribute-short">
               {attribute_view_gui attribute=$node.data_map.cantactinfo_3}
            </div>
          {/if}
        </div>
        <div class="yui3-u-1-2">
        {if $node.data_map.age.content.is_empty|not}
            <div class="attribute-short">
                <strong>Aldersmålgruppe: </strong>{attribute_view_gui attribute=$node.data_map.age}
            </div>
          {/if}

         {if $node.data_map.activity_responsible.content.is_empty|not}
            <div class="attribute-short">
                <strong>Aktivitetsansvarlig: </strong>{attribute_view_gui attribute=$node.data_map.activity_responsible}
            </div>
          {/if}
          {if $node.data_map.participants.content.is_empty|not}
            <div class="attribute-short">
                 <strong>Deltakere: </strong>{attribute_view_gui attribute=$node.data_map.participants}
            </div>
          {/if}
		  {if $node.data_map.country.content.is_empty|not}
            <div class="attribute-short">
                <strong>Land: </strong>{attribute_view_gui attribute=$node.data_map.country}
            </div>
          {/if}
        {def $folders=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
        		'sort_by', $node.sort_array,
              'class_filter_type',  'include',
              'class_filter_array', array( 'folder' ) ) )}

 		<div id="tabs">
        	<ul>
        {foreach $folders as $folder}
            	<li><a href="#tabs-{$folder.node_id}">{$folder.name|wash}</a></li>
        {/foreach}
        	</ul>

        {foreach $folders as $tabs}
		<div id="tabs-{$tabs.node_id}">
			{attribute_view_gui attribute=$tabs.data_map.description}

            {def $display_classes = ezini( 'ActivitySettings', 'FolderDisplayItems', 'smile.ini' )}

			{def $children_tabs=fetch( 'content', 'list', hash( 'parent_node_id', $tabs.node_id,
																	  'sort_by', $node.sort_array,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array', $display_classes ) )}
            <div class="content-view-children">
                    {foreach $children_tabs as $child max 20 }
                        {node_view_gui view='line' content_node=$child}
                    {/foreach}
            </div>
        <p><a href={$tabs.url_alias|ezurl}>Se mer...</a></p>
        </div>
        {/foreach}
        </div>
        </div>
    </div>
        <div class="attribute-tipafriend">
          <p>
             <a href={concat('/content/tipafriend/',$node.node_id)|ezurl}>{"Tip a friend"|i18n("design/base")}</a>
          </p>
        </div>

        <div class="attribute-pdf">
          <p>
             <a href={concat('/content/pdf/',$node.node_id)|ezurl}>{'application/pdf'|mimetype_icon( small, "Download PDF"|i18n( "design/base" ) )} {"Download PDF version of this page"|i18n( "design/base" )}</a>
          </p>
        </div>

        {* Should we allow comments? *}
        {section show=is_unset( $versionview_mode )}
        {section show=$node.data_map.enable_comments.content}
            <h2>{"Comments"|i18n("design/base")}</h2>
                <div class="content-view-children">
                    {section name=Child loop=fetch_alias( comments, hash( parent_node_id, $node.node_id ) )}
                        {node_view_gui view='line' content_node=$:item}
                    {/section}
                </div>

                {* Are we allowed to create new object under this node? *}
                {if fetch( content, access,
                                     hash( access, 'create',
                                           contentobject, $node,
                                           contentclass_id, 'comment' ) )}
                    <form method="post" action={"content/action"|ezurl}>
                    <input type="hidden" name="ClassIdentifier" value="comment" />
                    <input type="hidden" name="NodeID" value="{$node.node_id}" />
                    <input class="button new_comment" type="submit" name="NewButton" value="{'New Comment'|i18n( 'design/base' )}" />
                    </form>
                {else}
                    <h3>{"You are not allowed to create comments."|i18n("design/base")}</h3>
                {/if}
        {/section}
        {/section}

    </div>
</div>


