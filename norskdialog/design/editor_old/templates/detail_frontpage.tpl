{if $node.object.can_edit}
<div class="admin-block">
{set-block scope=root variable=cache_ttl}0{/set-block}

<ul class="admin-block">
    {* Relations. *}
    {section show=ezpreference( 'admin_navigation_relations' )}
    <li class="enabled {$li_width}">
        <a href={'/user/preferences/set/admin_navigation_relations/0'|ezurl} title="{'Hide object relation overview.'|i18n( 'design/admin/node/view/full' )}">Skjul detaljert</a>
    </li>
    {section-else}
    <li class="disabled {$li_width}">
        <a href={'/user/preferences/set/admin_navigation_relations/1'|ezurl} title="{'Show object relation overview.'|i18n( 'design/admin/node/view/full' )}">Vis detaljert</a>
    </li>
    {/section}
</ul>
<div class="clearing"></div>
{* Relations window. *}
{section show=or( ezpreference( 'admin_navigation_relations' ),
                  and( is_set( $view_parameters.show_relations ), eq( $view_parameters.show_relations, 1 ) ) )}
    {include uri='design:relations.tpl'}
    {include uri='design:locations.tpl'}
    {include uri="design:children.tpl"}
{/section}
</div>
{/if}