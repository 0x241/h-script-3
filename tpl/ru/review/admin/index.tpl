{strip}
{include file='admin/header.tpl' title='Отзывы'}

{include file='list.tpl' 
	title='Отзывы'
	url='*'
	fields=[
		'oID'=>['ID'],
		'oTS'=>['Дата'],
		'uLogin'=>['Автор'],
		'oText'=>['Текст'],
		'oState'=>['<small>Одобрен</small>'],
		'oOrder'=>['<small>Вес</small>']
	]
	values=$list
	row='*'
	btns=['accept'=>'Одобрить', 'del'=>'Удалить']
}

{include file='admin/footer.tpl'}
{/strip}