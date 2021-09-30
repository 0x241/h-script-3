{strip}
{include file='admin/header.tpl' title='Почта'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'Host'=>['T', 'Адрес сервера'],
		'Port'=>['I', 'Порт'],
		'Secure'=>['C', 'Защищенное соединение'],
		'Username'=>['T', 'Логин'],
		'Password'=>['*', 'Пароль <<пусто - отправлять обычным способом>>']
	]
}

{include file='admin/footer.tpl'}
{/strip}