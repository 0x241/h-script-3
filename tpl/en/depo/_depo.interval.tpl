{strip}

{if $_cfg.Depo_Interval > 0}

	<p class="info">
		{if $nextdepoleft > 0}
			Estimated time of deposit activation - <b>{$nextdepotime}</b><br>
			(approximately {$nextdepoleft} min.)
		{else}
			Your deposit will be activated <b>immediately</b>
		{/if}
	</p>
	
{/if}

{/strip}