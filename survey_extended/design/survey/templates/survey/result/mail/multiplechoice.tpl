<b>{$question.question_number}. {$question.text}</b>
{def $first=true()}
{def $result = '0'}
   <ul>
   {switch match=$question.num}
   {case match=1} {* Radio buttons in a row *}
   {foreach $question.options as $option}
   {if $option.toggled|eq(1)}
   <li> {$option.label}</li>
   {/if}
   {/foreach}
   {/case}
   {case match=2} {* Radio buttons in a column *}
   {foreach $question.options as $option}
   {if $option.toggled|eq(1)}
   <li> {$option.label}</li>
   {/if}
   {/foreach}
   {/case}
   {case match=3} {* check box in a row *}
   {foreach $question.options as $option}
   {if $option.toggled|eq(1)}
   <li>(<b>X</b>) {$option.label}</li>
   {else}
   <li>(0) {$option.label}</li>
   {/if}
   {/foreach}
   {/case}
   {case match=4} {* check box in a column *}
   {foreach $question.options as $option}
   {if $option.toggled|eq(1)}
   <li>(<b>X</b>) {$option.label}</li>
   {else}
   <li>(0) {$option.label}</li>
   {/if}
   {/foreach}
   {/case}
   {case match=5} {* select box *}
   {foreach $question.options as $option}
   {if $option.toggled|eq(1)}
   <li> {$option.label}</li>
   {/if}
   {/foreach}
   {/case}
   {/switch}
   {if $question.extra_info.value_checked|eq(1)}
   <li>{if $question.extra_info.label|count_chars} ({$question.extra_info.label})
{$question.extra_info.extra_answer}</li>
{/if}{/if}</ul>

