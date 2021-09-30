{strip}
{include file='admin/header.tpl' title='Страницы'}

{include file='list.tpl' 
	title='Пользовательские страницы'
	url='*'
	fields=[
		'pID'=>['ID'],
		'pTopic'=>['Название'],
		'pHidden'=>['<small>Скрыта</small>'],
		'URL'=>['Ссылка']
	]
	values=$list
	row='*'
	btns=['del'=>'Удалить']
}

<a href="{_link module='custom/admin/page'}?add" class="button-green">Добавить</a><br>

{include file='admin/footer.tpl'}
{/strip}