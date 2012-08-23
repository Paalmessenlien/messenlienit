{run-once}
<script language="javascript" type="text/javascript" src={'javascript/milkbox.js'|ezdesign}></script>
{/run-once}

<div class="content-view-milkbox">
<div class="class-image">
    <div class="attribute-image">
  <a href={$object.data_map.image.content[milkbox].url|ezroot} class="milkbox_url" rel="milkbox[gall1]" title={$object.name}>
  {attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size}<br />
  Klikk for st&oslash;rre bilde...
  </a>
    </div>
</div>
</div>