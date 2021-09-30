{strip}
{include file='admin/header.tpl' title='Дни'}

{include file='calendar/admin/_statuses.tpl'}

{include file='list.tpl' 
	title='Дни'
	url='*'
	fields=[
		'cID'=>['ID'],
		'cTS'=>['Дата'],
        'cPerc'=>['%'],
		'cType'=>['<small>Тип</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Удалить']
}

<a href="{_link module='calendar/admin/day'}?add" class="button-green">Добавить</a><br>

{include file='admin/footer.tpl'}
{/strip}