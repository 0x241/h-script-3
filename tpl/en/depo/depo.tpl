{strip}
{include file='header.tpl' title='Deposit'}

{if $el}

	<h1>Deposit</h1>
	{include file='depo/_depo.tpl'}
	
{else}

	<h1>New deposit</h1>
	{include file='depo/_depo.interval.tpl'}
	{include file='depo/_depo.new.tpl'}
		
{/if}

{include file='footer.tpl'}
{/strip}