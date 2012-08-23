{def $valid_nodes = $block.valid_nodes}

{ezscript_require( array('ezjsc::yui3') )}

<script type="text/javascript">
YUI({ldelim}
	modules : {ldelim}
		'slideshow' : {ldelim}
			fullpath : {'javascript/ys.js'|ezdesign()},
			requires: ['anim']
		 {rdelim}
	 {rdelim}
 {rdelim}).use('slideshow', function(Y){ldelim}
	var oSlideshow01 = new Y.Slideshow('slideshow01', {ldelim}
		transition: 0.5,
		duration: 1.0
	 {rdelim});
 {rdelim});
</script>


<div id="slideshow01" class="slideshow">
{foreach $valid_nodes as $banners}
					{if $banners.data_map.url.has_content}
					<a href="{$banners.data_map.url.data_text}" title="open image" class="open">
					{/if}
					<img src="/{$banners.data_map.image.content.banner.full_path}" class="full" />
					{if $banners.data_map.url.has_content}</a>{/if}
{/foreach}
</div>
