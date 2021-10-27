{strip}
{include file='header.tpl' title='Deposits'}

<h1>Deposits</h1>

{include file='static/js/depolist.js'}
{include file='static/js/timer.js'}

{include file='depo/_statuses.tpl'}

{if $list}

	{include file='list.tpl' 
		url='*'
		fields=[
			'dID'=>['ID'],
			'dCTS'=>['Created'],
			'cName'=>['Payment system'],
			'dZD'=>['Amount'],
			'pName'=>['Plan'],
			'dLTS'=>['Last accrual'],
			'dN'=>['Accruals count'],
			'dZP'=>['<small>Profit</small>'],
			'dNTS'=>['Next accrual'],
			'dState'=>['State']
		]
		values=$list
		row='*'
	}

{else}

	You <b>do not have deposits</b>
	<br>
	<br>
	
{/if}
	
<a href="{_link module='depo/depo'}?add" class="button-green">Make deposit</a>

{include file='footer.tpl'}
{/strip}