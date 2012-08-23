{run-once}
<script language="javascript" type="text/javascript" src={'javascript/milkbox.js'|ezdesign}></script>
{/run-once}

<div class="content-view-milkbox">
<div class="class-image">
    <div class="attribute-image">
  <a href="{$object.data_map.image.content.medium.full_path}" rel="milkbox[gall1]" title="Lorem ipsum..."><img src="{$object.data_map.image.content.medium.full_path}" alt="" width="100" height="100" /></a>
        {if $object.data_map.caption.has_content}
    {if is_set( $object.data_map.image.content[$object_parameters.size].width )}
    <div class="attribute-caption" style="width: {$object.data_map.image.content[$object_parameters.size].width}px"> {else}
        <div class="attribute-caption"> {/if}
            {attribute_view_gui attribute=$object.data_map.caption} </div>
        {/if} </div>
    </div>
</div>
</div>