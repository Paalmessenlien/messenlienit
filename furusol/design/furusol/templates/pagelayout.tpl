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

</head>
<body>
<!-- Complete page area: START -->

<!-- Change between "sidemenu"/"nosidemenu" and "extrainfo"/"noextrainfo" to switch display of side columns on or off  -->
<div id="page" class="{$pagestyle}">


  <!-- Header area: START -->
  {include uri='design:page_header.tpl'}
  <!-- Header area: END -->
  
  {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}

  <!-- Top menu area: START -->
  {if $pagedata.top_menu}
    {include uri='design:page_topmenu.tpl'}
  {/if}
  <!-- Top menu area: END -->

  <!-- Path area: START -->
  {if $pagedata.show_path}
    {include uri='design:page_toppath.tpl'}
  {/if}
  <!-- Path area: END -->
  
  <!-- Toolbar area: START -->
  {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
    {include uri='design:page_toolbar.tpl'}
  {/if}
  <!-- Toolbar area: END -->

  <!-- Columns area: START -->
  <div id="columns-position">
  <div id="columns" class="float-break">

    <!-- Side menu area: START -->
    {if $pagedata.left_menu}
        {include uri='design:page_leftmenu.tpl'}
    {/if}
    <!-- Side menu area: END -->

  {/cache-block}
{/cache-block}
    <!-- Main area: START -->
    {include uri='design:page_mainarea.tpl'}
    <!-- Main area: END -->
{cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}

    {if is_unset($pagedesign)}
        {def $pagedata   = ezpagedata()
             $pagedesign = $pagedata.template_look}
    {/if}

  </div>
  </div>
  <!-- Columns area: END -->

  <!-- Footer area: START -->
  {include uri='design:page_footer.tpl'}
  <!-- Footer area: END -->
{if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
{include uri="design:detail_frontpage.tpl"}
{/if}
</div>
{/cache-block}
{if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
{* The popup menu include must be outside all divs. It is hidden by default. *}
{include uri='design:popupmenu/popup_menu.tpl'}
{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
{/if}
</body>
</html>