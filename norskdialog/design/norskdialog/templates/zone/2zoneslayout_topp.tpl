<div class="zone-layout-{$zone_layout|downcase()} norightcol">

<!-- ZONE CONTENT: START -->

{foreach $zones[0].blocks as $block}
    {*$block|attribute(show)*}
    <div class="topp_blokk_venstre">
    {block_view_gui block=$block}
    </div>
{/foreach}
<!-- ZONE CONTENT: END -->

<!-- ZONE CONTENT: START -->
{foreach $zones[1].blocks as $block}
	<div class="topp_blokk_hoyre">
    {block_view_gui block=$block}
    </div>
{/foreach}
<!-- ZONE CONTENT: END -->
</div>