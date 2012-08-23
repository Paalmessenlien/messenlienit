<div class="content-view-full-jardar">
    <div class="class-frontpage zone-layout-{$zone_layout|downcase()}">
            <div class="left-column4">
{if eq($zones[0].blocks|count(), 0)}
<br />
{/if}
<!-- ZONE CONTENT: START -->

<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc">
<div class="border-content">
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
</div>
</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>

<!-- ZONE CONTENT: END -->
            <!-- Content: END -->
        </div>

            <div class="center-column4">
            <!-- ZONE CONTENT: START -->

<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc">
<div class="border-content">
                <!-- Content: START -->
{if and( is_set( $zones[1].blocks ), $zones[1].blocks|count() )}
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
</div>
</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>

<!-- ZONE CONTENT: END -->
                <!-- Content: END -->
        </div>

            <div class="right-column4">
            {if eq($zones[2].blocks|count(), 0)}
<br />
{/if}
            <!-- Content: START -->
{if and( is_set( $zones[2].blocks ), $zones[2].blocks|count() )}
{foreach $zones[2].blocks as $block}
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

