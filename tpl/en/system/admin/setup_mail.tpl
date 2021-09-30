{strip}
{include file='admin/header.tpl' title='e-Mail'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'Host'=>['T', 'Server address'],
		'Port'=>['I', 'Port'],
		'Secure'=>['C', 'Secure connection'],
		'Username'=>['T', 'Login'],
		'Password'=>['*', 'Password <<empty - send via php mail()>>']
	]
}

{include file='admin/footer.tpl'}
{/strip}