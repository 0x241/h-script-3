{strip}
{include file='admin/header.tpl' title='Основные'}

{if $cfg.NeedReConfig}

	<p class="info">
		Проверьте все настройки скрипта
	</p>
	
{/if}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'SiteName'=>['T', 'Наименование сайта'],
		'ForceCharset'=>['C', 'Выставлять заголовок "Кодировка utf-8" <<для некоторых хостингов>>'],
		'AdminMail'=>['T', 'e-mail админа'],
		'NotifyMail'=>['T', 'e-mail центра оповещения'],
		'LockSite'=>['C', 'Технические работы <<запрет входа на сайт>>'],
		'OutIP'=>['X', 'Исходящий IP сервера', 'default' => "{$ip} {include file='_country.tpl' ip=$ip}"]
	]
}

{include file='admin/footer.tpl'}
{/strip}