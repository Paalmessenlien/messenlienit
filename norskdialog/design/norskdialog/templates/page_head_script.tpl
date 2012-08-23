{* Load JavaScript dependencys + JavaScriptList *}
{foreach ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ) as $script}
    <script language="javascript" type="text/javascript" src={concat( 'javascript/', $script )|ezdesign}></script>
{/foreach}
{ezscript_load( ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ) )}

{include uri='design:page_head_styleeditor.tpl'}