{literal}
<script language="JavaScript">
$(function() {
$(".slidetabs").tabs(".images > div", {
	effect: "fade",
	fadeInSpeed: 1500,
	fadeOutSpeed: 1500,
	rotate: true
}).slideshow({autoplay: true, interval: 6000});
});

</script>
{/literal}
{def $valid_nodes = $block.valid_nodes}
<div class="block-view-{$block.view}">
<div class="slidetabs">
{foreach $valid_nodes as $index => $valid_node}
    <a href="#">{$index|inc}</a>
{/foreach}
</div>
<div class="images">
<!-- BLOCK CONTENT: START -->
{foreach $valid_nodes as $valid_node}
	{node_view_gui view='slides' image_class='slideshow' align='center' content_node=$valid_node}
{/foreach}
</div>
</div>


