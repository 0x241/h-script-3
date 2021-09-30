{strip}
{include file='admin/header.tpl' title='Plans'}

{include file='list.tpl' 
	title='Plans'
	url='*'
	fields=[
		'pID'=>['ID'],
		'pHidden'=>['<small>Hidden</small>'],
		'pNoCalc'=>['<small>No accruals</small>'],
		'pGroup'=>['Group'],
		'pName'=>['Title'],
		'pMin'=>['Min'],
		'pMax'=>['Max'],
		'pDays'=>['Duration'],
		'pPerc'=>['<small>Profit</small>'],
		'z'=>['<small>All deposits</small>'],
		'za'=>['<small>Active deposits</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Delete']
}

<a href="{_link module='depo/admin/plan'}?add" class="button-green">Add plan</a><br>

{include file='admin/footer.tpl'}
{/strip}