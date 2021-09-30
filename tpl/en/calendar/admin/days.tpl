{strip}
{include file='admin/header.tpl' title='Days'}

{include file='calendar/admin/_statuses.tpl'}

{include file='list.tpl' 
	title='Days'
	url='*'
	fields=[
		'cID'=>['ID'],
		'cTS'=>['Date'],
		'cPerc'=>['%'],
		'cType'=>['<small>Type</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Delete']
}

<a href="{_link module='calendar/admin/day'}?add" class="button-green">Add day</a><br>

{include file='admin/footer.tpl'}
{/strip}