{strip}
{include file='admin/header.tpl' title='FAQ'}

{include file='list.tpl' 
	title='FAQ'
	url='*'
	fields=[
		'fID'=>['ID'],
		'fCTS'=>['<small>Дата добавления</small>'],
		'fHidden'=>['<small>Невидимый</small>'],
		'fCat'=>['Категория'],
		'fQuestion'=>['Вопрос'],
		'fAnswer'=>['Ответ'],
		'fOrder'=>['<small>Порядок</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Удалить']
}

<a href="{_link module='faq/admin/faq'}?add" class="button-green">Добавить</a><br>

{include file='admin/footer.tpl'}
{/strip}