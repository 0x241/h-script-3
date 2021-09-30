{strip}
<a href="{_link module=$module}{if $params}?{$params}{/if}"{if ($module == $tpl_module) or ($module == $tpl_vmodule) or $current} class="current"{/if}>
	{$text}
	{if $text2}
		<span>{$text2}</span>
	{/if}
	{if $count > 0}
		<b><sup>{$count}</sup></b>
	{/if}
</a>
{/strip}