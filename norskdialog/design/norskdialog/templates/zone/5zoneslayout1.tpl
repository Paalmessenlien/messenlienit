<div class="content-view-full">
    <div class="class-frontpage zone-layout-{$zone_layout|downcase()}">
<div class="main-left-column">
<div class="top-column">
{if eq($zones[0].blocks|count(), 0)}
<br />
{/if}
            <!-- Content: START -->
{if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
{foreach $zones[0].blocks as $block}
{if or( $block.valid_nodes|count(),
    and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
    and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
    <div id="address-{$block.zone_id}-{$block.id}">
    {block_view_gui block=$block}
    </div>
{else}
    {skip}
{/if}
    {delimiter}
        <div class="clearing"></div>
    {/delimiter}
{/foreach}
{/if}
            <!-- Content: END -->
</div>

<div class="left-column">
           <!-- Content: START -->
{if and( is_set( $zones[1].blocks ), $zones[1].blocks|count() )}
    <h2 class="column-header">Begivenheter:</h2>
{foreach $zones[1].blocks as $block}
{if or( $block.valid_nodes|count(),
    and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
    and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}

    <div id="address-{$block.zone_id}-{$block.id}">
    {block_view_gui block=$block}
    </div>
{else}
    {skip}
{/if}
    {delimiter}
       <div class="clearing"></div>
    {/delimiter}
{/foreach}
{/if}
            <!-- Content: END -->
</div>
<div class="center-column">
<!-- Content: START -->
{if and( is_set( $zones[2].blocks ), $zones[2].blocks|count() )}
    <div class="saken">
    <h2 class="column-header">B&oslash;ker og artikler:</h2>
{foreach $zones[2].blocks as $block}
{if or( $block.valid_nodes|count(),
    and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
    and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
	<div class="saken_innhold">
    <div id="address-{$block.zone_id}-{$block.id}">
    {block_view_gui block=$block}
    </div>
    </div>
{else}
    {skip}
{/if}
    {delimiter}
       <div class="clearing"></div>
    {/delimiter}
{/foreach}
</div>
{/if}
<!-- Content: END -->
<!-- Content: START -->
{if and( is_set( $zones[3].blocks ), $zones[3].blocks|count() )}
{foreach $zones[3].blocks as $block}
{if or( $block.valid_nodes|count(),
    and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
    and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
    <div id="address-{$block.zone_id}-{$block.id}">
    {block_view_gui block=$block}
    </div>
{else}
    {skip}
{/if}
    {delimiter}
       <div class="clearing"></div>
    {/delimiter}
{/foreach}
{/if}
<!-- Content: END -->

</div>
</div><!-- main-left-column END -->
<div class="right-column">

            <!-- Content: START -->
{if and( is_set( $zones[4].blocks ), $zones[4].blocks|count() )}
{foreach $zones[4].blocks as $block}
{if or( $block.valid_nodes|count(),
    and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
    and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
    <div id="address-{$block.zone_id}-{$block.id}">
    {block_view_gui block=$block}
    </div>
{else}
    {skip}
{/if}
    {delimiter}
       <div class="clearing"></div>
    {/delimiter}
{/foreach}
{/if}
            <!-- Content: END -->

    </div>

    </div>
</div>
<div class="clearing"></div>

