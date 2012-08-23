{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default attribute_base=ContentObjectAttribute}

{* User ID. *}
{*
<div class="block">
    <label>{'User ID'|i18n( 'design/standard/content/datatype' )}:</label>
    <p>{$attribute.content.contentobject_id}</p>
</div>
*}
<div class="block">

{* Username. *}
<div class="element">
    <label>{'Username'|i18n( 'design/standard/content/datatype' )}:</label>
    {section show=$attribute.content.has_stored_login}
        <input type="text" name="{$attribute_base}_data_user_login_{$attribute.id}_stored_login" size="16" value="{$attribute.content.login}" disabled="disabled" />
        <input type="hidden" name="{$attribute_base}_data_user_login_{$attribute.id}" value="{$attribute.content.login}" />
    {section-else}
        <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_login" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_user_login_{$attribute.id}" size="16" value="{$attribute.content.login}" />
    {/section}
</div>

{* Password #1. *}
<div class="element">
    <label>{'Password'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_password" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="password" name="{$attribute_base}_data_user_password_{$attribute.id}" size="16" value="{section show=$attribute.content.original_password}{$attribute.content.original_password}{section-else}{section show=$attribute.content.has_stored_login}_ezpassword{/section}{/section}" />
</div>

{* Password #2. *}
<div class="element">
    <label>{'Confirm password'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_password_confirm" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="password" name="{$attribute_base}_data_user_password_confirm_{$attribute.id}" size="16" value="{section show=$attribute.content.original_password_confirm}{$attribute.content.original_password_confirm}{section-else}{section show=$attribute.content.has_stored_login}_ezpassword{/section}{/section}" />
</div>

{* Email. *}
<div class="element">
    <label>{'Email'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_email" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_user_email_{$attribute.id}" size="28" value="{$attribute.content.email|wash( xhtml )}" />
</div>

<div class="break"></div><div class="break"></div>
</div>

{* Status *}
{*
<div class="block">
<div class="element">
    <label>{'Current account status:'|i18n( 'design/standard/content/datatype' )}
    {section show=$attribute.content.is_enabled}
	<span class="userstatus-enabled">{'enabled'|i18n( 'design/standard/content/datatype' )}</span>
    {section-else}
	<span class="userstatus-disabled"> {'disabled'|i18n( 'design/standard/content/datatype' )}</span>
    {/section}
    </label>
</div>
*}
<div class="break"></div>
</div>

{/default}
