{def $valid_nodes = $block.valid_nodes}
{def $blocks = sum(count($block.valid_nodes), -1)}
{def $imgsize = 'blocknews_medium'}
{def $size = 'h2'}
{def $alignment = 'left'}
{if $block.view|contains('large_img')}
	{set $imgsize = 'blocknews_large'}
	{set $alignment = 'center'}
{/if}
{if $block.view|contains('medium_img')}
	{set $imgsize = 'blocknews_large2'}
	{set $alignment = 'center'}
{/if}

{if $block.view|contains('right')}
	{set $alignment = 'right'}
{/if}

{if $block.view|contains('h2')}
	{set $size = 'h2'}
{elseif $block.view|contains('h3')}
	{set $size = 'h3'}
{elseif $block.view|contains('h4')}
	{set $size = 'h4'}
{elseif $block.view|contains('h5')}
	{set $size = 'h5'}
{elseif $block.view|contains('h6')}
	{set $size = 'h6'}
{/if}

<h1 class="overskrift">{$block.name}</h1>

{for 0 to $blocks as $counter}

<!-- BLOCK: START -->

<!-- BLOCK CONTENT: START -->

<div class="class-news">
{if $valid_nodes[$counter].data_map.image}
	{if eq($imgsize, 'blocknews_large', 'blocknews_large2')}
    <div class="overskrift">

        <{$size}
        {if $valid_nodes[$counter].data_map.title_size.has_content}
        style="font-size: {$valid_nodes[$counter].data_map.title_size.data_text|wash}%;"{/if}>

        <a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">{$valid_nodes[$counter].data_map.title.data_text}</a>
        </{$size}>

    	{if $valid_nodes[$counter].data_map.short_title.has_content}
    	<{$size} {if $valid_nodes[$counter].data_map.short_title_size.has_content}style="font-size: {$valid_nodes[$counter].data_map.short_title_size.data_text|wash}%;" {/if}>
    	<a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">{$valid_nodes[$counter].data_map.short_title.data_text}</a>
    	</{$size}>
    	{/if}
{if eq($valid_nodes[$counter].data_map.vis_forfatter.value, 1)}
        <h4>
             {attribute_view_gui attribute=$valid_nodes[$counter].data_map.author}
        </h4>
{/if}

    </div>
    {if $valid_nodes[$counter].data_map.image.content}
   	<div class="attribute-image-{$alignment}">
		<a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">
  		{attribute_view_gui attribute=$valid_nodes[$counter].data_map.image image_class=$imgsize}
		</a>
	</div>
	{/if}
	{else}
    <div class="overskrift">
      	<{$size}
        {if $valid_nodes[$counter].data_map.title_size.has_content}
        style="font-size: {$valid_nodes[$counter].data_map.title_size.data_text|wash}%;"{/if}>

        <a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">{$valid_nodes[$counter].data_map.title.data_text}</a>
        </{$size}>

    	{if $valid_nodes[$counter].data_map.short_title.has_content}
    	<{$size} {if $valid_nodes[$counter].data_map.short_title_size.has_content}style="font-size: {$valid_nodes[$counter].data_map.short_title_size.data_text|wash}%;" {/if}>
    	<a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">{$valid_nodes[$counter].data_map.short_title.data_text}</a>
    	</{$size}>
    	{/if}
    	{if eq($valid_nodes[$counter].data_map.vis_forfatter.value, 1)}
        <h4>
             {attribute_view_gui attribute=$valid_nodes[$counter].data_map.author}
        </h4>
{/if}
    </div>
    {if $valid_nodes[$counter].data_map.image.content}
	<div class="attribute-image-{$alignment}">
		<a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">
  		{attribute_view_gui attribute=$valid_nodes[$counter].data_map.image image_class=$imgsize}
		</a>
	</div>
	{/if}
	{/if}
	{else}
    <div class="overskrift">
      	<{$size}
        {if $valid_nodes[$counter].data_map.title_size.has_content}
        style="font-size: {$valid_nodes[$counter].data_map.title_size.data_text|wash}%;"{/if}>
        <a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">{$valid_nodes[$counter].data_map.title.data_text}</a>
        </{$size}>

    	{if $valid_nodes[$counter].data_map.short_title.has_content}
    	<{$size} {if $valid_nodes[$counter].data_map.short_title_size.has_content}style="font-size: {$valid_nodes[$counter].data_map.short_title_size.data_text|wash}%;" {/if}>
    	<a href={$valid_nodes[$counter].url_alias|ezurl()} title="{$valid_nodes[$counter].name}">{$valid_nodes[$counter].data_map.short_title.data_text}</a>
    	</{$size}>
    	{/if}
    	{if eq($valid_nodes[$counter].data_map.vis_forfatter.value, 1)}
        <h4>
             {attribute_view_gui attribute=$valid_nodes[$counter].data_map.author}
        </h4>
{/if}
    </div>
{/if}


{if $valid_nodes[$counter].data_map.intro.has_content}
    <div class="ingress">
        {attribute_view_gui attribute=$valid_nodes[$counter].data_map.intro}
    </div>
{/if}
<div class="clearing"></div>
    {if $valid_nodes[$counter].data_map.body.has_content}
    <div class="read-more">
    	<a href={$valid_nodes[$counter].url_alias|ezurl()}>Les mer om..</a>
	</div>
	{/if}
</div>
<div class="clearing"></div>
{/for}
{*
<div class="class-article">

    <div class="attribute-header">
        <h1 class="overskrift1"><a href={$valid_nodes[1].url_alias|ezurl()}>{$valid_nodes[1].name}</a></h1>
    </div>

    <div class="attribute-image">{attribute_view_gui attribute=$valid_nodes[1].data_map.image image_class=block2items1}</div>

    <div class="ingress">
        {attribute_view_gui attribute=$valid_nodes[1].data_map.intro}
    </div>
    <div class="read-more">
    	<a href={$valid_nodes[1].url_alias|ezurl()}>Les mer om..</a>
	</div>
</div>
*}
<!-- BLOCK CONTENT: END -->

<!-- BLOCK: END -->