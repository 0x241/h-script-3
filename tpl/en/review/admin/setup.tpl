{strip}
{include file='admin/header.tpl' title='Settings'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'Mode'=>['C', 'Moderate reviews'],
		'ShowCount'=>['I', 'Rows count on page'],
		'InBlock'=>['I', 'Rows count in block']
	]
}

{include file='admin/footer.tpl'}
{/strip}