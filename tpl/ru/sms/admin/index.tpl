{strip}
{include file='admin/header.tpl' title='Очередь'}

{include file='sms/_statuses.tpl'}

{include file='list.tpl' 
	title='Очередь'
	url='*'
	fields=[
		'qID'=>['ID'],
		'uLogin'=>['Отправлено'],
		'qFromTo'=>['Кому'],
		'qText'=>['Текст'],
		'qState'=>['Статус'],
		'qPartsPrice'=>['<small>Кол-во<br>частей</small>'],
		'qError'=>['Описание'],
		'qErrCnt'=>['<small>Попыток</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Удалить']
}

{include file='admin/footer.tpl'}
{/strip}