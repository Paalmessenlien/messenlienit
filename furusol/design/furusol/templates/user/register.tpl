<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="user-register">

<form enctype="multipart/form-data"  action={"/user/register/"|ezurl} method="post" name="Register">

<div class="attribute-header">
    <h1 class="long">{"Register user"|i18n("design/ezwebin/user/register")}</h1>
</div>

{if and( and( is_set( $checkErrNodeId ), $checkErrNodeId ), eq( $checkErrNodeId, true() ) )}
    <div class="message-error">
        <h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {$errMsg}</h2>
    </div>
{/if}

{if $validation.processed}

    {if $validation.attributes|count|gt(0)}
        <div class="warning">
        <h2>{"Input did not validate"|i18n("design/ezwebin/user/register")}</h2>
        <ul>
        {foreach $validation.attributes as $attribute}
            <li>{$attribute.name}: {$attribute.description}</li>
        {/foreach}
        </ul>
        </div>
    {else}
        <div class="feedback">
        <h2>{"Input was stored successfully"|i18n("design/ezwebin/user/register")}</h2>
        </div>
    {/if}

{/if}

{if count($content_attributes)|gt(0)}
{def $exclude_array_user=ezini('UserRegister','ExcludeAttribute','furusol.ini')}
    {foreach $content_attributes as $attribute}
	{if and($exclude_array_user|contains($attribute.contentclass_attribute.identifier)|not) }
	<input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
	<label>{$attribute.contentclass_attribute.name}</label><div class="labelbreak"></div>
	    {attribute_edit_gui attribute=$attribute}
	{/if}
	{*$attribute|attribute(show)*}
{*
    <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
    <div class="block">
        <label>{$attribute.contentclass_attribute.name}</label><div class="labelbreak"></div>
        {attribute_edit_gui attribute=$attribute}
    </div>*}
    {/foreach}
    <div class="buttonblock">
         <input class="button" type="hidden" name="UserID" value="{$content_attributes[0].contentobject_id}" />
    {if and( is_set( $checkErrNodeId ), $checkErrNodeId )|not()}
        <input class="button" type="submit" name="PublishButton" value="{'Register'|i18n('design/ezwebin/user/register')}" />
    {else}
           <input class="button" type="submit" name="PublishButton" disabled="disabled" value="{'Register'|i18n('design/ezwebin/user/register')}" />
    {/if}
    <input class="button" type="submit" name="CancelButton" value="{'Discard'|i18n('design/ezwebin/user/register')}" />
    </div>
{else}
    <div class="warning">
         <h2>{"Unable to register new user"|i18n("design/ezwebin/user/register")}</h2>
    </div>
    <input class="button" type="submit" name="CancelButton" value="{'Back'|i18n('design/ezwebin/user/register')}" />
{/if}
</form>

</div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>