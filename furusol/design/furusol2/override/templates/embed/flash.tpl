
{def $flash = $object.data_map.file}
{def $filename = concat("content/download/", $flash.contentobject_id, "/", $flash.id, "/file/", $flash.content.original_filename)|ezurl}
{def $flash_id = $flash.id|rand}
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="{$flash.content.width}" height="{$flash.content.height}" id="flash{$flash_id}">
				<param name="movie" value={$filename} />
				{section show=$flash.content.is_autoplay}<param name="play" value="true" />{/section}
				{section show=$flash.content.is_loop}<param name="loop" value="true" />{/section}
				<!--[if !IE]>-->
				<object type="application/x-shockwave-flash" data={$filename} width="{$flash.content.width}" height="{$flash.content.height}">
					{section show=$flash.content.is_autoplay}<param name="play" value="true" />{/section}
					{section show=$flash.content.is_loop}<param name="loop" value="true" />{/section}
				<!--<![endif]-->
					<a href="http://www.adobe.com/go/getflashplayer">
						<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
					</a>
				<!--[if !IE]>-->
				</object>
				<!--<![endif]-->
</object>
