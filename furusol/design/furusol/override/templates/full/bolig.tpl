{* Article - Full view *}
{run-once}
<script language="javascript" type="text/javascript" src={'javascript/milkbox.js'|ezdesign}></script>
{/run-once}
    <div class="content-view-full">
        <div class="class-article">

        <div class="attribute-header">
            <h1>{$node.data_map.navn.content|wash()}</h1>
        </div>
        <p class="date">
             {$node.object.published|l10n(shortdatetime)}
        </p>
<div class="extra-info">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc">
    {if $node.data_map.bilde.has_content}
                <div class="object-center">
                     <a href={$node.data_map.bilde.content[milkbox].url|ezroot} rel="milkbox[gall1]" title={$node.name}>
                     {attribute_view_gui attribute=$node.data_map.bilde image_class=medium}
                     Klikk for st&oslash;rre bilde..</a>

                    {if $node.data_map.caption.has_content}
                    <div class="caption">
                        {attribute_view_gui attribute=$node.data_map.caption}
                    </div>
                    {/if}
                </div>
            {/if}
        <dl>
        {if $node.data_map.adresse.has_content}
        <dd>Adresse: {attribute_view_gui attribute=$node.data_map.adresse}</dd>
        {/if}
        {if $node.data_map.areal.has_content}
        <dd>Areal (kvm):{attribute_view_gui attribute=$node.data_map.areal}</dd>
        {/if}
        {if eq($node.data_map.inkl_strom.content, 1)}
        <dd>Inklusiv str&oslash;m</dd>
        {/if}
        {if eq($node.data_map.vaskeri.content, 1)}
        <dd>Vaskeri</dd>
        {/if}
        {if eq($node.data_map.parkering.content, 1)}
        <dd>Parkeringsplass</dd>
        {/if}
         {if $node.data_map.kart.has_content}
        <dd><a href="{$node.data_map.kart.content}" target="_new" title="{$node.data_map.kart.data_text}">Vis kart</a></dd>
        {/if}

		</dl>
{include uri='design:parts/extra_info2.tpl'}
</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>

            {if $node.data_map.intro.beskrivelse.is_empty|not}
                <div class="attribute-long">
                    {attribute_view_gui attribute=$node.data_map.beskrivelse}
                </div>
            {/if}
    	{if $node.data_map.bilde.has_content}
                <div class="object-left">
                    {attribute_view_gui attribute=$node.data_map.tegning image_class=large}
                </div>
        {/if}
        {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                                                      'function', 'tipafriend' ) )}
        {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
        <div class="attribute-tipafriend">
            <p><a href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}">{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}</a></p>
        </div>
        {/if}

        </div>
    </div>