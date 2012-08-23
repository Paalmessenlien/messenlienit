  <!-- Footer area: START -->
<div id="footer-main">
	<div id="footer-wrapper">
{def $footer=fetch( 'content', 'node', hash( 'node_id', 2 ) )}
{foreach $footer.children as $childs}
	{if eq($childs.name, 'footer')}
			<div id="footer-left">
			{attribute_view_gui attribute=$childs.data_map.intro}
			</div>
			<div id="footer-right">
			{attribute_view_gui attribute=$childs.data_map.body}
			</div>
	{/if}
{/foreach}
	</div>
</div><!-- #footer -->
  <!-- Footer area: END -->
