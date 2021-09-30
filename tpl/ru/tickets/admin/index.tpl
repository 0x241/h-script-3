{strip}
{include file='admin/header.tpl' title='Поддержка'}

{include file='tickets/_states.tpl'}

{include file='list.tpl' 
	title='Тикеты'
	url='*'
	fields=[
		'tID'=>['ID'],
		'tLTS'=>['Дата'],
		'uLogin'=>['Отправитель'],
		'tTopic'=>['Тема'],
		'tText'=>['Текст'],
		'tState'=>['Статус'],
		'cnt'=>['Ответов']
	]
	values=$list
	row='*'
	btns=['del'=>'Удалить']
}

<a href="{_link module='tickets/admin/ticket'}?add" class="button-green">Создать</a><br>

{include file='admin/footer.tpl'}
{/strip}