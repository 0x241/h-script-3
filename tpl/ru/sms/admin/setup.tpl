{strip}
{include file='admin/header.tpl' title='Настройка'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'Prov'=>['S', 'Провайдер', 0, ['- отключено -', 'epochta.ru']],
		'From'=>['T', 'Отправитель <<14 цифровых символов<br>или 11 цифробуквенных (английские буквы и цифры)>>'],
		'SendCount'=>['I', 'Отправлять сообщения, не более N в минуту'],
		'UpdateCount'=>['I', 'Обновлять статусы сообщений, не более N в минуту'],
		1=>'Подтверждения на операции',
		'REG'=>['C', 'Регистрация'],
		'CASHOUT'=>['C', 'Вывод'],
		'epochta.ru',
		'EP_Login'=>['T', 'Логин <<e-mail>>'],
		'EP_Pass'=>['*', 'Пароль']
	]
	btn_text='Сохранить'
}
{*		'smspilot.ru',
		'SP_Pass'=>['*', 'API-ключ']*}

{include file='admin/footer.tpl'}
{/strip}