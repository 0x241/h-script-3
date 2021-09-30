{strip}
{include file='admin/header.tpl' title='Подтверждение'}

{include file='edit.tpl' 
	values=$cfg
	fields=[
		'Captcha'=>['S', 'Защита "captcha"', 0, [0=>'нет', 1=>'авто', 2=>'всегда']]
	]
}
	
{include file='admin/footer.tpl'}
{/strip}