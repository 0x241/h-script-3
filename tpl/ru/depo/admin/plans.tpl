{strip}
{include file='admin/header.tpl' title='Планы'}

{include file='list.tpl' 
	title='Планы'
	url='*'
	fields=[
		'pID'=>['ID'],
		'pHidden'=>['<small>Невид.</small>'],
		'pNoCalc'=>['<small>Не начислять</small>'],
		'pGroup'=>['Группа'],
		'pName'=>['Наменование'],
		'pMin'=>['Мин.'],
		'pMax'=>['Макс.'],
		'pDays'=>['Длит.'],
		'pPerc'=>['<small>Процент</small>'],
		'z'=>['<small>Всего вкладов</small>'],
		'za'=>['<small>Акт. вкладов</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Удалить']
}

<a href="{_link module='depo/admin/plan'}?add" class="button-green">Добавить</a><br>

{include file='admin/footer.tpl'}
{/strip}