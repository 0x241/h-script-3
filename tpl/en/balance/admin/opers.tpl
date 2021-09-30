{strip}
{include file='admin/header.tpl' title='Operations'}

{include file='balance/_statuses.tpl'}

{include file='edit.begin.tpl' form='opers_filter' url='*'}
<table class="formatTable">
<tr>
	{include file='edit.row.tpl' f='uLogin' v=['T', 'User', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].uLogin l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='oOper' v=['S', 'Operation', 0, ['- все -'] + $op_names] 
		vv=$smarty.session[$edit_form_name].oOper l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='ocID' v=['S', 'Pay.system', 0, ['- все -'] + $currs] 
		vv=$smarty.session[$edit_form_name].ocID l_width='0%' r_width='0%'}
<tr>
</tr>
	{include file='edit.row.tpl' f='oBatch' v=['T', 'Batch-number', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].oBatch l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='oState' v=['S', 'State', 0, [9=>'- все -'] + $op_statuses]
		vv=valueIf(isset($smarty.session[$edit_form_name]), $smarty.session[$edit_form_name].oState, 9) l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='oMemo' v=['T', '<i>Description</i>', 'size'=>20] 
		vv=$smarty.session[$edit_form_name].oMemo l_width='0%' r_width='0%'}
</tr>
</table>
{include file='edit.end.tpl' btn_text='Filter' btns=valueIf(isset($smarty.session[$edit_form_name]), ['clear'=>'Show all'])}

{include file='list.tpl' 
	title="Operations{valueIf(isset($smarty.session[$edit_form_name]), ' (filtered)')}"
	url='*'
	fields=[
		'oID'=>['ID'],
		'uLogin'=>['User'],
		'oTS'=>['Created<br>Completed'],
		'oOper'=>['Operation'],
		'oCID'=>['Pay.system<br><small>Account</small>'],
		'oSum'=>['Amount<br><small>Comission</small>'],
		'oBatch'=>['Batch-number'],
		'oState'=>['State'],
		'oMemo'=>['Description']
	]
	values=$list
	row='*'
	btns=['complete'=>'Perform', 'confirm'=>'Simulate perform', 'cancel'=>'Decline', 'del'=>'Delete']
	linkparams=$linkparams
}

<a href="{_link module='balance/admin/oper'}?add" class="button-green">Create operation</a><br>

{include file='admin/footer.tpl'}
{/strip}