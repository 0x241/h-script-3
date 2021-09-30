{strip}
{include file='admin/header.tpl' title='News'}

{include file='list.tpl' 
	title='News'
	url='*'
	fields=[
		'nID'=>['ID'],
		'nTS'=>['Date'],
		'nAnnounce'=>['Announce'],
		'nDBegin'=>['Show from'],
		'nDEnd'=>['To'],
		'nAttn'=>['<small>Important</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Delete']
}

<a href="{_link module='news/admin/news'}?add" class="button-green">Add news</a><br>

{include file='admin/footer.tpl'}
{/strip}