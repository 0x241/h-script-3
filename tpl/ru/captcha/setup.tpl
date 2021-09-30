{strip}
{include file='admin/header.tpl' title='Captcha'}

{include file='edit.tpl' 
	values=$cfg
	fields=[
		'View'=>['S', 'Вид', 0, [1=>'Искажение', 2=>'Мозаика', 3=>'Тени']]
	]
}
	
{include file='admin/footer.tpl'}
{/strip}