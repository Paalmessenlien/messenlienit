<div class="content-view-line">
	{delimiter}
        <div class="block-separator"></div>
    {/delimiter}
    </div>

    <div class="center-column3">
        <div class="class-article">

        <div class="attribute-header">
            <h1>{$node.data_map.title.content|wash()}</h1>
        </div>

        <div class="attribute-byline">
        {if $node.data_map.author.content.is_empty|not()}
        <p class="author">
             {attribute_view_gui attribute=$node.data_map.author}
        </p>
        {/if}
        <p class="date">
             {$node.object.published|l10n(shortdatetime)}
        </p>
        </div>

            {if $node.data_map.embed.content.is_empty|not}
                <div class="attribute-short">

                    {$node.data_map.embed.content}

                </div>
            {/if}

{literal}
<script>function fbs_click() {u=location.href;t=document.title;window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(u)+'&t='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');return false;}</script>

<style> html .fb_share_link { padding:2px 0 0 20px; height:16px; background:url(http://static.ak.facebook.com/images/share/facebook_share_icon.gif?6:26981) no-repeat top left; }</style>
<a rel="nofollow" href="http://www.facebook.com/share.php?u=http://hundrearsmalene.no/content/view/full/
{/literal}{$node.node_id}{/literal}" onclick="return fbs_click()" target="_blank" class="fb_share_link">Del på facebook</a>
{/literal}</p>

        {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                                                      'function', 'tipafriend' ) )}
        {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
        <div class="attribute-tipafriend">
            <p><a href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}">{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}</a></p>
        </div>
        {/if}
        </div>
    {delimiter}
        <div class="block-separator"></div>
    {/delimiter}
    </div>

<div class="right-column3">
	<div class="right-column3-content">
{if eq( ezini( 'article', 'ImageInFullView', 'content.ini' ), 'enabled' )}
            {if $node.data_map.image.has_content}
            {*
            <div class="border-box">
				<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
				<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">
				*}
                <div class="attribute-image-center">
                    {attribute_view_gui attribute=$node.data_map.image image_class=article_image_large}

                    {if $node.data_map.caption.has_content}
                    <div class="caption">
                        {attribute_view_gui attribute=$node.data_map.caption}
                    </div>
                    {/if}
                </div>
                {*}
               </div></div></div>
					<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
					</div>*}
            {/if}
        {/if}
{include uri='design:parts/extra_info_article.tpl'}
	</div>
</div>
<div class="clearing"></div>
{include uri="design:detail_frontpage.tpl"}
</div>
</div>
{*
</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>*}