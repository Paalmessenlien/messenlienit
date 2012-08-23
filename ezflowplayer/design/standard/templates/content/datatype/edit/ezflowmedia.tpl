{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default attribute_base=ContentObjectAttribute}

{* Type. *}
<div class="block">
    <label>{'Type'|i18n( 'design/standard/content/datatype' )}:</label>
</div>
<div class="element">
   <label>{'Streaming type'|i18n( 'design/standard/content/datatype' )}:</label>
<select name="{$attribute_base}_data_media_streaming_{$attribute.id}" > 
{switch name=Sw match=$attribute.content.streaming}
{case match=file}
  <option value="file" selected="selected">{'File upload'|i18n( 'design/standard/content/datatype' )}</option>
  {*<option value="http">{'http'|i18n( 'design/standard/content/datatype' )}</option>*}
  <option value="rtmp">{'rtmp'|i18n( 'design/standard/content/datatype' )}</option>
  {*<option value="live">{'live'|i18n( 'design/standard/content/datatype' )}</option>*}
{/case}
{*case match=http}
  <option value="file">{'File upload'|i18n( 'design/standard/content/datatype' )}</option>
  <option selected="selected" value="http">{'http'|i18n( 'design/standard/content/datatype' )}</option>
  <option value="rtmp">{'rtmp'|i18n( 'design/standard/content/datatype' )}</option>
  <option value="live">{'live'|i18n( 'design/standard/content/datatype' )}</option>
{/case*}
{case match=rtmp}
  <option value="file">{'File upload'|i18n( 'design/standard/content/datatype' )}</option>
  {*<option value="http">{'http'|i18n( 'design/standard/content/datatype' )}</option>*}
  <option selected="selected" value="rtmp">{'rtmp'|i18n( 'design/standard/content/datatype' )}</option>
  {*<option value="live">{'live'|i18n( 'design/standard/content/datatype' )}</option>*}
{/case}
{*case match=live}
  <option value="file">{'File upload'|i18n( 'design/standard/content/datatype' )}</option>
  <option value="http">{'http'|i18n( 'design/standard/content/datatype' )}</option>
  <option value="rtmp">{'rtmp'|i18n( 'design/standard/content/datatype' )}</option>
  <option selected="selected" value="live">{'live'|i18n( 'design/standard/content/datatype' )}</option>
{/case*}
{case}
  <option value="file">{'File upload'|i18n( 'design/standard/content/datatype' )}</option>
  {*<option value="http">{'http'|i18n( 'design/standard/content/datatype' )}</option>*}
  <option value="rtmp">{'rtmp'|i18n( 'design/standard/content/datatype' )}</option>
  {*<option value="live">{'live'|i18n( 'design/standard/content/datatype' )}</option>*}
{/case}
{/switch}
</select>
</div>
<div class="break"></div>
{* Current file. *}
<div class="block">
<label>{'Current file'|i18n( 'design/standard/content/datatype' )}:</label>
{section show=$attribute.content.filename}
<table class="list" cellspacing="0">
<tr>
    <th>{'Filename'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'MIME type'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Size'|i18n( 'design/standard/content/datatype' )}</th>
</tr>
<tr>
    <td>{$attribute.content.original_filename}</td>
    <td>{$attribute.content.mime_type}</td>
    <td>{$attribute.content.filesize|si( byte )}</td>
</tr>
</table>
{section-else}
<p>{'There is no file.'|i18n( 'design/standard/content/datatype' )}</p>
{/section}
</div>

{* Remove button. *}
{section show=$attribute.content.filename}
    <input class="button" type="submit" name="CustomActionButton[{$attribute.id}_delete_media]" value="{'Remove'|i18n('design/standard/content/datatype')}" title="{'Remove the file from this draft.'|i18n( 'design/standard/content/datatype' )}" />
{section-else}
    <input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_delete_media]" value="{'Remove'|i18n('design/standard/content/datatype')}" disabled="disabled" />
{/section}

<div class="block">
    <input type="hidden" name="MAX_FILE_SIZE" value="{$attribute.contentclass_attribute.data_int1|mul( 1024, 1024 )}" />
    <label>{'Upload flash movie'|i18n( 'design/standard/content/datatype' )}:</label>
    <input class="box" name="{$attribute_base}_data_mediafilename_{$attribute.id}" type="file" />
</div>

<div class="block">

<div class="element">
    <label>{'Width'|i18n( 'design/standard/content/datatype' )}:</label>
    <input type="text" name="{$attribute_base}_data_media_width_{$attribute.id}" size="5" value="{$attribute.content.width}" />
</div>

<div class="element">
    <label>{'Height'|i18n( 'design/standard/content/datatype' )}:</label>
    <input type="text" name="{$attribute_base}_data_media_height_{$attribute.id}" size="5" value="{$attribute.content.height}" />
    &nbsp;
    &nbsp;
    &nbsp;
</div>

<div class="element">
    <label>{'Autoplay'|i18n( 'design/standard/content/datatype' )}:</label>
    <input type="checkbox" name="{$attribute_base}_data_media_is_autoplay_{$attribute.id}" value="1" {section show=$attribute.content.is_autoplay}checked="checked"{/section} />
</div>
<div class="element">
    <label>{'Controller'|i18n( 'design/standard/content/datatype' )}:</label>
    <input type="checkbox" name="{$attribute_base}_data_media_has_controller_{$attribute.id}" value="1" {section show=$attribute.content.has_controller}checked="checked"{/section} />
</div>
{*<div class="element">
    <label>{'Loop'|i18n( 'design/standard/content/datatype' )}:</label>
    <input type="checkbox" name="{$attribute_base}_data_media_is_loop_{$attribute.id}" value="1" {section show=$attribute.content.is_loop}checked="checked"{/section} />
</div>
<div class="break"></div>*}

<div class="break"></div>
<strong>RTPM Streaming</strong>
{* RTMP. *}
<div class="element">
    <label>{'Straming server URL (Ex. rtmp://10.0.0.1/movies)'|i18n( 'design/standard/content/datatype' )}:</label>
    <input type="text" name="{$attribute_base}_data_media_url_{$attribute.id}" size="50" value="{$attribute.content.url}" />
</div>
<div class="break"></div>
<div class="element">
    <label>{'Movie filename (Ex. movie.flv)'|i18n( 'design/standard/content/datatype' )}:</label>
    <input type="text" name="{$attribute_base}_data_media_movie_{$attribute.id}" size="30" value="{$attribute.content.movie}" />
</div>
<div class="break"></div>
</div>

{/default}