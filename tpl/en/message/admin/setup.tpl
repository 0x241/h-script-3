{strip}
{include file='admin/header.tpl' title='Settings'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'Mode'=>['S', 'Mode', '', [0=>'only support', 1=>'support and private message', 2=>'all']],
		'NoMail'=>['C', 'Do not send alerts to e-mail'],
		'ShowCount'=>['I', 'Rows count on page'],
		1=>'Support',
		'Captcha'=>['S', 'Protect by "captcha"', 0, [0=>'no', 1=>'auto', 2=>'always']],
		'_Cats'=>['A', 'Category', 'size'=>20]
	]
}

{include file='admin/footer.tpl'}
{/strip}