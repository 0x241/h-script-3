{strip}
{include file='admin/header.tpl' title='Настройки'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'NoMail'=>['C', 'Не высылать оповещения на e-mail'],
		'Captcha'=>['S', 'Защита "captcha"', 0, [0=>'нет', 1=>'авто', 2=>'всегда']],
		'_Cats'=>['A', 'Категории сообщений<br><<одна строка - одна категория>>', 'size'=>20]
	]
}

{include file='admin/footer.tpl'}
{/strip}