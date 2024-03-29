<!-- BLOCK: START -->

<div class="block-type-itemlist">

<div class="attribute-header">
    <h2>{$block.name}</h2>
</div>
<div class="block-content">

<div class="columns-two">
<div class="col-1">
<div class="col-content">

    <ul>
    {foreach $block.valid_nodes as $valid_node max 6}
       <li><a href={$valid_node.url_alias|ezurl()}>{$valid_node.name}</a></li>
    {/foreach}
    </ul>

</div>
</div>
<div class="col-2">
<div class="col-content">

    <ul>
    {foreach $block.valid_nodes as $valid_node offset 6}
       <li><a href={$valid_node.url_alias|ezurl()}>{$valid_node.name}</a></li>
    {/foreach}
    </ul>

</div>
</div>
</div>

</div>

</div>

<!-- BLOCK: END -->