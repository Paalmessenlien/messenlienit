{def $valid_nodes = $block.valid_nodes}
{literal}
		<script type="text/javascript">
			function startElements() {
    var kwicks = $$("#kwick .kwick");
    var fx = new Fx.Elements(kwicks, {wait:false, duration:300, transition:Fx.Transitions.quadOut});
    kwicks.each(function (kwick, i) {kwick.addEvent("mouseenter", function (e) {var obj = {};obj[i] = {width:[kwick.getStyle("width").toInt(), 400]};kwicks.each(function (other, j) {if (other != kwick) {var w = other.getStyle("width").toInt();if (w != 180) {obj[j] = {width:[w, 180]};}}});fx.start(obj);});});
    $("kwick").addEvent("mouseleave", function (e) {var obj = {};kwicks.each(function (other, j) {obj[j] = {width:[other.getStyle("width").toInt(), 253]};});fx.start(obj);});
};
			window.onDomReady(startElements);
		</script>
{/literal}

<div id="kwick">
	<ul class="kwicks">
		<li>
		<a id="kwick_left" class="kwick" style="background: url( /{$valid_nodes[0].data_map.venstre.content.original.full_path}) no-repeat scroll top left;" href="{$valid_nodes[0].data_map.venstre_url.content}"><img src={'1x1.gif'|ezimage} height="100px" width="400px"></a></li>
		<li>
		<a id="kwick_middle" class="kwick" style="background: url( /{$valid_nodes[0].data_map.midt.content.original.full_path}) no-repeat scroll top left" href="{$valid_nodes[0].data_map.midt_url.content}"><img src={'1x1.gif'|ezimage} height="100px" width="400px"></a></li>
		<li>
		<a id="kwick_right" class="kwick" style="background: url( /{$valid_nodes[0].data_map.hoyre.content.original.full_path}) no-repeat scroll top right" href="{$valid_nodes[0].data_map.hoyre_url.content}"><img src={'1x1.gif'|ezimage} height="100px" width="400px"></a></li>
	</ul>
	<span class="clr"><!-- spanner --></span>
</div>
{*$valid_nodes[0].data_map|attribute(show)*}
{*
<div class="attribute-image-left">
<div id="bannerSlide">
{foreach $valid_nodes as $banners}
				<div class="imageElement">
					{if $banners.data_map.url.has_content}
					<a href="{$banners.data_map.url.data_text}" title="<a href="#"><img src={'1x1.gif'|ezimage} height="100px" width="350px"></a>open image" class="open"></a>
					{/if}
					{if $banners.data_map.int_url.has_content}
					<a href={$banners.data_map.int_url.content.main_node.url_alias|ezurl} title="open image" class="open"></a>
					{/if}
					<img src="/{$banners.data_map.image.content.banner.full_path}" class="full" />
					<img src="/{$banners.data_map.image.content.banner.full_path}" class="thumbnail" />
				</div>

{*if $banners.data_map.image.content}
	<div class="attribute-image-left">
	<div id="toppBanner" class="jdGallery" style="display: block;">
	<div id="myGallery">
		<a href={$banners.data_map.int_url.content.main_node.url_alias|ezurl} title="{$banners.data_map.int_url.content.main_node.name}">
		<img src="/{$banners.data_map.image.content.banner.full_path}">
		</a>
	</div>
{/if*}
{/foreach}
</div>
</div>