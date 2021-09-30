{strip}

{if $_cfg.Depo_Interval > 0}

	<p class="info">
		{if $nextdepoleft > 0}
			Расчетное время активации вклада - <b>{$nextdepotime}</b><br>
			(примерно через {$nextdepoleft} мин.)
		{else}
			Ваш вклад будет <b>сразу же</b> активирован
		{/if}
	</p>
	
{/if}

{/strip}