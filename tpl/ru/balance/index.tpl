{strip}
{include file='header.tpl' title='Баланс'}

<h1>Баланс</h1>

{if isset($smarty.get.fail)}

	<h2>Операция НЕ завершена!</h2>
	<p class="info">
		Процедура пополнения была прервана или произошла ошибка.<br>
		Попробуйте <a href="{$_selfLink}">повторить операцию</a> позже
	</p>

{else}

	{include file='balance/_bal.tpl'}
	<br><br>

	<a href="{_link module='balance/oper'}?add=CASHIN" class="button-green">Пополнить</a>

	&nbsp;<a href="{_link module='balance/oper'}?add=CASHOUT" class="button-green">Вывести</a>

	{if !$_cfg.Const_IntCurr}
		&nbsp;<a href="{_link module='balance/oper'}?add=EX" class="button-green">Обменять</a>
	{/if}

	&nbsp;<a href="{_link module='balance/oper'}?add=TR" class="button-green">Перевести</a>
	<br>

	{if $list}

		<br>
		<hr width="400px">

		{include file='balance/_statuses.tpl'}

		{include file='list.tpl' 
			title='Операции'
			url='*'
			fields=[
				'oTS'=>['Дата'],
				'oOper'=>['Операция'],
				'oCID'=>['Плат.система'],
				'oSum1'=>['Приход'],
				'oSum2'=>['Расход'],
				'oBatch'=>['Batch-номер'],
				'oState'=>['Статус'],
				'oMemo'=>['Примечание']
			]
			values=$list
			row='*'
		}
		
	{/if}

{/if}

{include file='footer.tpl'}
{/strip}