{strip}
{include file='admin/header.tpl' title='Настройки'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'ShowCount'=>['I', 'Кол-во новостей на странице'],
		'InBlock'=>['I', 'Кол-во новостей в блоке']
	]
}

{include file='admin/footer.tpl'}
{/strip}