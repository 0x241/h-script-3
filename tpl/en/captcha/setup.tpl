{strip}
{include file='admin/header.tpl' title='Captcha'}

{include file='edit.tpl' 
	values=$cfg
	fields=[
		'View'=>['S', 'Type', 0, [1=>'Distortion', 2=>'Mosaic', 3=>'Shadows']]
	]
}
	
{include file='admin/footer.tpl'}
{/strip}