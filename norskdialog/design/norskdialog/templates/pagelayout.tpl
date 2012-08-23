<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">
<head>
{def $basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}

{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
{def $pagedata         = ezpagedata()
     $pagestyle        = $pagedata.css_classes
     $locales          = fetch( 'content', 'translation_list' )
     $pagedesign       = $pagedata.template_look
     $current_node_id  = $pagedata.node_id}

{include uri='design:page_head.tpl'}
{include uri='design:page_head_style.tpl'}
{include uri='design:page_head_script.tpl'}
{if is_set( $display_styleeditor_visualtoolbar )}
    {include uri="design:styleeditor/visual.tpl"}
{/if}
</head>
<body {if is_set( $display_timeline_sider )}class="yui-skin-sam"{/if}>

<!-- Complete page area: START -->
  {if and( is_set( $pagedata.persistent_variable.extra_template_list ), 
             $pagedata.persistent_variable.extra_template_list|count() )}
    {foreach $pagedata.persistent_variable.extra_template_list as $extra_template}
      {include uri=concat('design:extra/', $extra_template)}
    {/foreach}
  {/if}

<!-- Change between "sidemenu"/"nosidemenu" and "extrainfo"/"noextrainfo" to switch display of side columns on or off  -->
<div id="page" class="{$pagestyle} {$path_normalized|trim()} current_node_id_{$current_node_id}">

{if is_set( $display_timeline_sider )}
    {include uri="design:timeline/timeline.tpl"}
{/if}


    <!-- Header area: START -->
  {include uri='design:page_header.tpl'}
  <!-- Header area: END -->

  {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}
  
  <div id="wrapper1">
  <div id="wrapper2">
  <!-- Top menu area: START -->
  <div id="toppmenu" class="float-break">
    {include uri='design:menu/double_top.tpl'}
  </div>
  <!-- Top menu area: END -->
  
  <!-- Toolbar area: START -->
  {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
    <div id="page-width5">
    {include uri='design:page_toolbar.tpl'}
    </div>
  {/if}
  <!-- Toolbar area: END -->
   <div id="path">
    <div id="page-width4">
 {if $pagedata.show_path}
  <!-- Path area: START -->
    {include uri='design:parts/path.tpl'}
  <!-- Path area: END -->
  {/if}
    </div>
  </div>
  <!-- Columns area: START -->
<div id="page-width6" class="{$module_result.content_info.class_identifier}">
  <div id="columns" class="float-break">
    <!-- Side menu area: START -->
    <div id="sidemenu-position">
      <div id="sidemenu">
          <!-- Used only for height resize script -->
          {if $pagedata.left_menu}
          {include uri='design:menu/flat_left.tpl'}
          {/if}
       </div>
    </div>
    <!-- Side menu area: END -->
  {/cache-block}
  {/cache-block}
    <!-- Main area: START -->
    <div id="main-position">
      <div id="main" class="float-break">
        <div class="overflow-fix">
          <!-- Main area content: START -->
          {$module_result.content}
          <!-- Main area content: END -->
        </div>
      </div>
    </div>
    <!-- Main area: END -->
{cache-block keys=array($uri_string, $user_hash, $access_type.name, $timeline_cache_key)}

  </div>
</div>
  <!-- Columns area: END -->

 {if is_unset($pagedesign)}
      {if is_unset($pagedesign_class)}
          {def $pagedesign_class = fetch( 'content', 'class', hash( 'class_id', 'template_look' ) )}
      {/if}
      {if $pagedesign_class.object_count|gt( 0 )}
          {def $pagedesign = $pagedesign_class.object_list[0]}
      {/if}
  {/if}

{include uri='design:page_footer.tpl'}
{if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
	{include uri="design:detail_frontpage.tpl"}
{/if}
  </div>
  </div>
</div>

<!-- Complete page area: END -->

{if $pagedesign.data_map.footer_script.has_content}
<script language="javascript" type="text/javascript">
<!--

    {$pagedesign.data_map.footer_script.content}

-->
</script>
{/if}
{/cache-block}
{literal}
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-12779456-1");
pageTracker._setDomainName(".norskdialog.no");
pageTracker._trackPageview();
} catch(err) {}</script>
{/literal}
{if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
{* The popup menu include must be outside all divs. It is hidden by default. *}
{include uri='design:popupmenu/popup_menu.tpl'}
{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
{/if}
</body>
</html>
