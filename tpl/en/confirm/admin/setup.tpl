{strip}
{include file='admin/header.tpl' title='Confirmation'}

{include file='edit.tpl' 
	values=$cfg
	fields=[
		'Captcha'=>['S', 'Protect by "captcha"', 0, [0=>'no', 1=>'auto', 2=>'always']]
	]
}
	
{include file='admin/footer.tpl'}
{/strip}