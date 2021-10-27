{strip}
{include file='header.tpl' title='Депозиты'}

<h1>Депозиты</h1>

{include file='static/js/depolist.js'}
{include file='static/js/timer.js'}

{include file='depo/_statuses.tpl'}

{if $list}

	{include file='list.tpl' 
		url='*'
		fields=[
			'dID'=>['ID'],
			'dCTS'=>['Дата начала'],
			'cName'=>['Плат.система'],
			'dZD'=>['Сумма'],
			'pName'=>['План'],
			'dLTS'=>['Посл.начисление'],
			'dN'=>['Начислений'],
			'dZP'=>['<small>Начислено</small>'],
			'dNTS'=>['След.начисление'],
			'dState'=>['Статус']
		]
		values=$list
		row='*'
	}

{else}

	У Вас <b>нет вкладов</b>
	<br>
	<br>
	
{/if}
	
<a href="{_link module='depo/depo'}?add" class="button-green">Сделать вклад</a>

{include file='footer.tpl'}
{/strip}