<!-- Header area: START -->
  <div id="header" class="float-break">
  <div id="page-width1">
  <div id="usermenu">
     <div id="links">
     <ul>
     <li id="search">
        <form action={"/content/search"|ezurl}>
        <label for="searchtext" class="hide">Search text:</label>
        {if eq( $ui_context, 'edit' )}
        <input id="searchtext" name="SearchText" type="text" value="" size="12" disabled="disabled" />
        <input id="searchbutton" class="button-disabled" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}" alt="Submit" disabled="disabled" />
        {else}
        <input id="searchtext" name="SearchText" type="text" value="" size="12" />
        <input id="searchbutton" class="button" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}" alt="Submit" />
            {if eq( $ui_context, 'browse' )}
             <input name="Mode" type="hidden" value="browse" />
            {/if}
        {/if}
      </form>
      </li>

        {if $current_user.is_logged_in}
            {if $pagedesign.data_map.my_profile_label.has_content}
            <li id="myprofile"><a href={concat( "/user/edit/", $current_user.contentobject_id )|ezurl} title="{$pagedesign.data_map.my_profile_label.data_text|wash}">{$pagedesign.data_map.my_profile_label.data_text|wash}</a></li>
            {/if}
            {if $pagedesign.data_map.logout_label.has_content}
            <li id="logout"><a href={"/user/logout"|ezurl} title="{$pagedesign.data_map.logout_label.data_text|wash}">{$pagedesign.data_map.logout_label.data_text|wash} ( {$current_user.contentobject.name|wash} )</a></li>
            {/if}
        {else}
            {if $pagedesign.data_map.register_user_label.has_content}
            <li id="registeruser"><a href={"/user/register"|ezurl} title="{$pagedesign.data_map.register_user_label.data_text|wash}">{$pagedesign.data_map.register_user_label.data_text|wash}</a></li>
            {/if}
            {if $pagedesign.data_map.login_label.has_content}
            <li id="login"><a href={"/user/login"|ezurl} title="{$pagedesign.data_map.login_label.data_text|wash}">{$pagedesign.data_map.login_label.data_text|wash}</a></li>
            {/if}
        {/if}
 			{if $pagedesign.data_map.tag_cloud_url.data_text|ne('')}
                {if $pagedesign.data_map.tag_cloud_url.content|eq('')}
                <li id="tagcloud"><a href={concat("/content/view/tagcloud/", $indexpage)|ezurl} title="{$pagedesign.data_map.tag_cloud_url.data_text|wash}">{$pagedesign.data_map.tag_cloud_url.data_text|wash}</a></li>
                {else}
                <li id="tagcloud"><a href={$pagedesign.data_map.tag_cloud_url.content|ezurl} title="{$pagedesign.data_map.tag_cloud_url.data_text|wash}">{$pagedesign.data_map.tag_cloud_url.data_text|wash}</a></li>
                {/if}
            {/if}
             {if $pagedesign.data_map.site_map_url.data_text|ne('')}
                {if $pagedesign.data_map.site_map_url.content|eq('')}
                <li id="sitemap"><a href={concat("/content/view/sitemap/", $indexpage)|ezurl} title="{$pagedesign.data_map.site_map_url.data_text|wash}">{$pagedesign.data_map.site_map_url.data_text|wash}</a></li>
                {else}
                <li id="sitemap"><a href={$pagedesign.data_map.site_map_url.content|ezurl} title="{$pagedesign.data_map.site_map_url.data_text|wash}">{$pagedesign.data_map.site_map_url.data_text|wash}</a></li>
                {/if}
            {/if}
        </ul>
     </div>
 </div>
    {cache-block keys=array( $uri_string, $user_hash, $timeline_cache_key )}
    <div id="logo">
    {if $pagedesign.data_map.image.content.is_valid|not()}
        <h1><a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}">{ezini('SiteSettings','SiteName')}</a></h1>
    {else}
        <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}"><img src={$pagedesign.data_map.image.content[original].full_path|ezroot} alt="{$pagedesign.data_map.image.content[original].text}" width="{$pagedesign.data_map.image.content[original].width}" height="{$pagedesign.data_map.image.content[original].height}" /></a>
    {/if}
    </div>
	<div class="topp_blokk">
	{def $topp_blokk=fetch( 'content', 'list',
        hash( 'parent_node_id',     $current_node_id,
        	  'max', 1,
              'class_filter_type',  'include',
              'class_filter_array', array( 'topp_blokk' ),
              'limit', 1 ) )}
	{if $topp_blokk}
	{attribute_view_gui attribute=$topp_blokk.0.object.data_map.page}
	{else}
	{set $topp_blokk=fetch( 'content', 'list',
        hash( 'parent_node_id',    $module_result.path[0].node_id,
        	  'max', 1,
              'class_filter_type',  'include',
              'class_filter_array', array( 'topp_blokk' ),
              'limit', 1 ) )}
        {if $topp_blokk}
		{attribute_view_gui attribute=$topp_blokk.0.object.data_map.page}
		{/if}
	{/if}
	</div>

    <p class="hide"><a href="#main">Skip to main content</a></p>
    </div>

  </div>
  <!-- Header area: END -->