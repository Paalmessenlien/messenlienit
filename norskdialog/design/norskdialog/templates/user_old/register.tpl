<div class="left-column4">
<ul class="bruker_registrer">
<li>Som deltaker får du tilgang til diskusjonsforumet vårt, til å legge ut egne målforslag, og til å stemme på aktuelle mål i stemmelokalet.</li>
<li>Du slutter deg ikke til noen bestemte politiske oppfatninger, men får anledning til selv å være med å bestemme målene som Norge skal styres etter de neste hundre år</li>
<li>Det koster ingenting å være deltaker</li>
<li>Du vil få tilsendt noen få eposter med aktuelt stoff underveis</li>
<li>Vi vil selvsagt IKKE selge din epostadresse til andre</li>
<li>Dette er IKKE et medlemskap i noen form for organisasjon</li>
</ul>
</div>
<div class="center-column4">
<div class="bruker_registrer">

<form lass="bruker_registrer" enctype="multipart/form-data"  action={"/user/register/"|ezurl} method="post" name="Register">

<div class="attribute-header">
    <h1 class="registrerer">{"Register user"|i18n("design/ezwebin/user/register")}</h1>
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
{def $exclude_array_user=ezini('UserRegister','ExcludeAttribute','100aar.ini')}
    {foreach $content_attributes as $attribute}
	{if and($exclude_array_user|contains($attribute.contentclass_attribute.identifier)|not) }
	<input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
	<label>{$attribute.contentclass_attribute.name}</label><div class="labelbreak"></div>
	    {attribute_edit_gui attribute=$attribute}
	{/if}
    {/foreach}
    <p>Skal du legge inn målforslag som resultat av et gruppearbeid, skal gruppens navn fylles inn her</p>
    {def $include_array_user=ezini('UserRegister','IncludeAttribute','100aar.ini')}
    {foreach $content_attributes as $attribute}
	{if and($include_array_user|contains($attribute.contentclass_attribute.identifier)) }
	<input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
	<label>{$attribute.contentclass_attribute.name}</label><div class="labelbreak"></div>
	    {attribute_edit_gui attribute=$attribute}
	{/if}
    {/foreach}
    <br />
    <br />
    <div class="buttonblock">
         <input class="bruker_login_knapp" type="hidden" name="UserID" value="{$content_attributes[0].contentobject_id}" />
    {if and( is_set( $checkErrNodeId ), $checkErrNodeId )|not()}
        <input class="bruker_login_knapp" type="submit" name="PublishButton" value="{'Register'|i18n('design/ezwebin/user/register')}" />
    {else}
           <input class="bruker_login_knapp" type="submit" name="PublishButton" disabled="disabled" value="{'Register'|i18n('design/ezwebin/user/register')}" />
    {/if}
    <input class="bruker_login_knapp" type="submit" name="CancelButton" value="{'Discard'|i18n('design/ezwebin/user/register')}" />
    </div>
{else}
    <div class="warning">
         <h2>{"Unable to register new user"|i18n("design/ezwebin/user/register")}</h2>
    </div>
    <input class="bruker_login_knapp" type="submit" name="CancelButton" value="{'Back'|i18n('design/ezwebin/user/register')}" />
{/if}
</form>
</div>
</div>

 <div class="right-column4">

</div>