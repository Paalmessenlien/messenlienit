{def $timestamp=currentdate()|datetime( 'custom', '%h:%i:%s %d %F %Y ' )}
{def $sender = ezini( 'MailSettings', 'AdminEmail', 'site.ini' )}
{set-block scope=root variable=subject}{$node.name} - {$timestamp}{/set-block}
{foreach $survey_questions as $question}
        {switch match=$question.type}
                {case match='EmailEntry'}
                        {set $sender = $question.answer}
                {/case}
        {/switch}       
{/foreach}
{set-block scope=root variable=from}{$sender}{/set-block}
{"The following information was collected as the result of the survey:"|i18n('survey')}
<br>
{section var=question loop=$survey_questions}
	{survey_question_result_gui view=mail question=$question}
{/section}
