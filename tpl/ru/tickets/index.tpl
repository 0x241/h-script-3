{strip}
{include file='header.tpl' title='Поддержка'}

{include file='tickets/_states.tpl'}

{include file='list.tpl' 
	title='Тикеты'
	fields=[
		'tLTS'=>['Дата'],
		'tTopic'=>['Тема'],
		'tState'=>['Статус'],
		'cnt'=>['Ответов']
	]
	values=$list
	row='*'
}

<a href="{_link module='tickets/newticket'}" class="button-green">Создать</a><br>

{include file='footer.tpl'}
{/strip}