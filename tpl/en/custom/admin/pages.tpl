{strip}
{include file='admin/header.tpl' title='Custom pages'}

{include file='list.tpl' 
	title='Custom pages'
	url='*'
	fields=[
		'pID'=>['ID'],
		'pTopic'=>['Title'],
		'pHidden'=>['<small>Disabled</small>'],
		'URL'=>['Link']
	]
	values=$list
	row='*'
	btns=['del'=>'Delete']
}

<a href="{_link module='custom/admin/page'}?add" class="button-green">Add custom page</a><br>

{include file='admin/footer.tpl'}
{/strip}