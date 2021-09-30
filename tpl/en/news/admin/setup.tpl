{strip}
{include file='admin/header.tpl' title='Settings'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'ShowCount'=>['I', 'Row count in page'],
		'InBlock'=>['I', 'Row count in block']
	]
}

{include file='admin/footer.tpl'}
{/strip}