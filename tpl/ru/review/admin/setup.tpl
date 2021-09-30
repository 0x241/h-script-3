{strip}
{include file='admin/header.tpl' title='Настройки'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'Mode'=>['C', 'Модерировать отзывы'],
		'ShowCount'=>['I', 'Кол-во отзывов на странице'],
		'InBlock'=>['I', 'Кол-во отзывов в блоке']
	]
}

{include file='admin/footer.tpl'}
{/strip}