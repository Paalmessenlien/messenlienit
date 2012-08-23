<div class="survey">

<div class="context-block">

{def $survey_object=fetch('content', 'object', hash('object_id', $contentobject_id))}

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">


<div class="survey-questions">
{section show=$count|gt(0)}
<div class="attribute-header">
<h1>{$survey_object.name|wash(xhtml)}</h1>
</div>
{*
<div class="block">
<p>{"Survey"i18n('survey')} <a href={$survey_object.main_node.url_alias|ezurl()}>{$survey_object.name|wash(xhtml)}</a> {"has %count answers."|i18n('survey',,hash('%count', $count))}</p>
</div>
*}
{section var=question loop=$survey_questions}
<div class="block">
{survey_question_result_gui view=overview
                            question=$question
                            metadata=$survey_metadata
                            contentobject_id=$contentobject_id
                            contentclassattribute_id=$contentclassattribute_id
                            language_code=$language_code}
</div>
{/section}
{section-else}
<div class="block">
<p>
{"No results yet."|i18n('survey')}
</p>
</div>
{/section}
</div>

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">
<div class="block float-break">

{def $current_user=fetch( 'user', 'current_user' )}

{if $current_user.has_manage_locations}

<form class="float" action={concat('/survey/export/', $contentobject_id, '/', $contentclassattribute_id, '/', $language_code)|ezurl}>
<input class="button" type="submit" value="Export CSV" />
</form>
{/if}
</div>
{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>

</div>

</div>
