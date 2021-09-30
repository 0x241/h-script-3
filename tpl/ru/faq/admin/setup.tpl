{strip}
{include file='admin/header.tpl' title='Настройки'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'ShowCount'=>['I', 'Кол-во записей на странице'],
		'InBlock'=>['I', 'Кол-во случайных записей в блоке'],
		'_Cats'=>['A', 'Категории<br><<одна строка - одна категория>>', 'size'=>20]
	]
}

{include file='admin/footer.tpl'}
{/strip}