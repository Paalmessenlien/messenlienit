{def $timestamp=currentdate()|datetime( 'custom', '%h:%i:%s %d %F %Y ' )}
{set-block scope=root variable=subject}{$node.name} - {$timestamp}{/set-block}
{"The following information was collected as the result of the survey:"|i18n('survey')}
{section var=question loop=$survey_questions}
	{survey_question_result_gui view=mail question=$question}
{/section}
