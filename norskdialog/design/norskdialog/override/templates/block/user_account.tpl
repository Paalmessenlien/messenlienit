
{def $valid_nodes = $block.valid_nodes}
{if $block.name}
<h3>{$block.name}</h3>
{/if}


{def $current_user=fetch( 'user', 'current_user' )}
{if $current_user.is_logged_in}

<h3 class="bruker">Min konto:</h3>
{*<strong>{$current_user.contentobject.name|wash}</strong>*}
<ul class="bruker">
	{*<li><a href={concat( "/user/edit/", $current_user.contentobject_id )|ezurl} title="Min profil">Min profil</a></li>
	<li><a href={concat( '/user/password/', $current_user.contentobject_id, '/')|ezurl}>{'Change password'|i18n( 'design/admin/parts/my/menu' )}</a></li>*}
	<li><a href={'/user/logout'|ezurl} title="{'Logout from the system.'|i18n( 'design/admin/pagelayout' )}">{'Logout'|i18n( 'design/admin/pagelayout' )}</a></li>
</ul>

{else}
{*<h3 class="knapp">
	<a href={"/user/register"|ezurl}>Påmelding</a>
</h3>*}
<form class="bruker_login" method="post" action={"/user/login/"|ezurl}>
<fieldset>
  <legend>Logg inn:</legend>
<label for="id1">{"Username"|i18n("design/standard/user",'User name')}</label>
<input type="text" size="15" name="Login" id="id1" value="{$User:login|wash}" tabindex="1" />
<label for="id2">{"Password"|i18n("design/standard/user")}</label>
<input type="password" size="15" name="Password" id="id2" value="" tabindex="1" />
<input class="button" type="submit" name="LoginButton" value="{'Login'|i18n('design/standard/user','Button')}" tabindex="1" />
<input type="hidden" name="RedirectURI" value="{$User:redirect_uri|wash}" />
{section show=and( is_set( $User:post_data ), is_array( $User:post_data ) )}
  {section name=postData loop=$User:post_data }
     <input name="Last_{$postData:key}" value="{$postData:item}" type="hidden" /><br/>
  {/section}
{/section}
<dl>
<dd><a href={'/user/forgotpassword'|ezurl}>Glemt passord?</a></dd>
</dl>
</fieldset>
</form>

{/if}