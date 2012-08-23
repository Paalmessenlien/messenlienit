
<div class="content-view-line">
        {$node.object.data_map.file.content.mime_type|mimetype_icon( 'small', '$node.name' )}&nbsp;<a href=/content/download/{$node.object.data_map.file.contentobject_id}/{$node.object.data_map.file.id}/file/{$node.object.data_map.file.content.original_filename } title={$node.name}>{$node.name}</a>&nbsp;{$node.object.data_map.file.content.filesize|si( byte )}</p>
</div>
{include uri="design:parts/edit_single.tpl"}
