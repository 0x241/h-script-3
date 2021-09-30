{strip}
{include file='admin/header.tpl' title='Публикации'}

{include file='list.tpl' 
	title='Новости'
	url='*'
	fields=[
		'nID'=>['ID'],
		'nTS'=>['Дата публикации'],
		'nAnnounce'=>['Анонс'],
		'nDBegin'=>['Публиковать с'],
		'nDEnd'=>['По'],
		'nAttn'=>['<small>Важная</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Удалить']
}

<a href="{_link module='news/admin/news'}?add" class="button-green">Добавить</a><br>

{include file='admin/footer.tpl'}
{/strip}