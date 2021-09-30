{strip}
{include file='header.tpl' title='Депозит'}

{if $el}

	<h1>Депозит</h1>
	{include file='depo/_depo.tpl'}
	
{else}

	<h1>Новый депозит</h1>
	{include file='depo/_depo.interval.tpl'}
	{include file='depo/_depo.new.tpl'}
		
{/if}

{include file='footer.tpl'}
{/strip}