{set-block scope=global variable=cache_ttl}0{/set-block}
<div class="content-view-line">
    <div class="class-poll">
        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>
                <div class="attribute-byline">

           	<p class="date">{$node.object.published|l10n(date)}</p>
            {*
            <p class="count">{$node.object.contentobject_attributes.1.content.survey.result_count} stemmer</p>
            *}
            <div class="break"></div>
        </div>
    {def $name_pattern = $node.object.content_class.contentobject_name|explode('>')|implode(',')
         $name_pattern_array = array('enable_comments', 'enable_tipafriend', 'show_children', 'show_children_exclude', 'show_children_pr_page')}
    {set $name_pattern  = $name_pattern|explode('|')|implode(',')}
    {set $name_pattern  = $name_pattern|explode('<')|implode(',')}
    {set $name_pattern  = $name_pattern|explode(',')}
    {foreach $name_pattern  as $name_pattern_string}
        {set $name_pattern_array = $name_pattern_array|append( $name_pattern_string|trim() )}
    {/foreach}
{*$node.object.contentobject_attributes.1.content.survey|attribute(show)*}
{foreach $node.object.contentobject_attributes.1.content.survey.questions as $question}
{switch match=$question.type}
	{case match='Paragraph'}
	   <div class="attribute-short">
                {$question.text|wash|shorten(250)}
    	</div>
    {/case}
{/switch}
{*if $question.type|contains('Paragraph')}

   <div class="attribute-short">
                {$question.text[0]|wash|shorten(300)}
    </div>

{/if*}

{/foreach}
       <div class="attribute-link">
            <p><a href={$node.url_alias|ezurl}>{"Vote"|i18n("design/ezwebin/line/poll")}</a></p>
        </div>
    {*foreach $node.object.contentobject_attributes as $attribute}
        {if $name_pattern_array|contains($attribute.contentclass_attribute_identifier)|not()}
            <div class="attribute-{$attribute.contentclass_attribute_identifier}">
                {attribute_view_gui attribute=$attribute}
            </div>
        {/if}
    {/foreach*}

	</div>
</div>