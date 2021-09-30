{strip}
{include file='admin/header.tpl' title='Безопасность'}

{include file='edit.tpl' 
	values=$cfg
	fields=[
		'HTTPSMode'=>['S', "Использовать http<b>s</b> <<меняется только через https://>>", 0, [0=>'только на защищ.страницах', 1=>'всегда'], 'readonly'=>!$via_https],
		'MinPIN'=>['I', 'Мин. длина PIN-кода <<0 - не использовать>>'],
		'MinSQA'=>['I', 'Мин. длина вопроса/ответа <<0 - не использовать>>'],
		'BFC'=>['I', 'Запрашивать код подтверждения после N<br>неудачных попыток входа подряд <<0 - не использовать>>'],
		'IP'=>['S', 'Контроль смены IP-адреса', 0, [0=>'нет', 1=>'x.0.0.0', 2=>'x.x.0.0', 3=>'x.x.x.0', 4=>'x.x.x.x']],
		'ForceReConfig'=>['C', 'Требовать проверки "Личных параметров" после регистрации'],
		'PassTime'=>['I', 'Требовать смену пароля каждые N дней <<0 - не требовать>>'],
		'TimeOut'=>['I', 'Автовыход через N минут <<0 - не использовать>>'],
		'_IPs'=>['A', "IP-адреса, с которых разрешен вход в Панель управления<br><<одна строка - один адрес в формате x.x.x.x>><br>Ваш текущий IP: <b>{$curr_ip}</b> {include file='_country.tpl' ip=$curr_ip}"],
		'Proxy server',
		'ProxyHost'=>['T', 'Host!! <<[scheme://]address[:port]>>'],
		'ProxyAuth'=>['T', 'Authorization <<login:password>>']
	]
}

{include file='admin/footer.tpl'}
{/strip}