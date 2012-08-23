<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">
<head>
{def $basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}

{include uri='design:page_head_displaystyles.tpl'}

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
{* To simplify IE css targeting. IE9 conforms, so threat as rest *}
<!--[if lt IE 7 ]><body class="ie6"><![endif]-->
<!--[if IE 7 ]>   <body class="ie7"><![endif]-->
<!--[if IE 8 ]>   <body class="ie8"><![endif]-->
<!--[if (gt IE 8)|!(IE)]><!--><body><!--<![endif]-->
<!-- Complete page area: START -->
<div id="wrapper">
  <!-- Header area: START -->
  {include uri='design:page_header.tpl'}
  <!-- Header area: END -->
  {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}
  <!-- Top menu area: START -->
    {include uri='design:page_topmenu.tpl'}
  <!-- Top menu area: END -->
<div id="middle">
		<div id="container">
  <!-- Path area: START -->
 {if eq($pagedata.class_identifier, 'frontpage')|not}
    {include uri='design:parts/path.tpl'}
  {/if}
  <!-- Path area: END -->

  <!-- Toolbar area: START -->
  {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
    {include uri='design:page_toolbar.tpl'}
  {/if}
  <!-- Toolbar area: END -->
    <!-- Side menu area: START -->
     {if eq($pagedata.class_identifier, 'frontpage')|not}

    <div id="sideleft">
        {include uri='design:menu/flat_left.tpl'}
    </div>
<div id="main-position">
  <div id="main" class="float-break">
       <div class="overflow-fix">

     {/if}
    <!-- Side menu area: END -->
  {/cache-block}
{/cache-block}
    <!-- Main area: START -->
    {include uri='design:page_mainarea.tpl'}
    <!-- Main area: END -->
     {if eq($pagedata.class_identifier, 'frontpage')|not}

    </div>
    </div>
  </div>

     {/if}
{cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}
    {if is_unset($pagedesign)}
        {def $pagedata   = ezpagedata()
             $pagedesign = $pagedata.template_look}
    	{/if}
		</div><!-- #container-->
	</div><!-- #middle-->
</div><!-- #wrapper -->
  <!-- Footer area: START -->
  {include uri='design:page_footer.tpl'}
  <!-- Footer area: END -->
<!-- Complete page area: END -->

<!-- Foter script area: START -->
{include uri='design:page_footer_script.tpl'}
<!-- Footer script area: END -->
{/cache-block}
{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
</body>
</html>