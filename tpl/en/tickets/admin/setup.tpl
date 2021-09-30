{strip}
{include file='admin/header.tpl' title='Settings'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'NoMail'=>['C', 'Do not send notification to  e-mail'],
		'Captcha'=>['S', 'Defence "captcha"', 0, [0=>'No', 1=>'Auto', 2=>'Always']],
		'_Cats'=>['A', 'Categories posts <br> <<one line - one category>>', 'size'=>20]
	]
}

{include file='admin/footer.tpl'}
{/strip}