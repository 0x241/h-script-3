{strip}
{include file='admin/header.tpl' title='Settings'}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'ShowCount'=>['I', 'Rows count in page'],
		'InBlock'=>['I', 'Random records rows count'],
		'_Cats'=>['A', 'Category', 'size'=>20]
	]
}

{include file='admin/footer.tpl'}
{/strip}