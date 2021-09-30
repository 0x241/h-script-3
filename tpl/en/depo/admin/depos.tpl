{strip}
{include file='admin/header.tpl' title='Deposits'}

{include file='depo/_statuses.tpl'}

{include file='edit.begin.tpl' form='deps_filter' url='*'}
<table class="formatTable">
<tr>
	{include file='edit.row.tpl' f='uLogin' v=['T', 'User', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].uLogin l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='dcID' v=['S', 'Pay.system', 0, ['- all -'] + $currs] 
		vv=$smarty.session[$edit_form_name].dcID l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='dpID' v=['S', 'Plan', 0, ['- all -'] + $plans] 
		vv=$smarty.session[$edit_form_name].dpID l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='dState' v=['S', 'State', 0, [9=>'- all -'] + $ststrs]
		vv=valueIf(isset($smarty.session[$edit_form_name]), $smarty.session[$edit_form_name].dState, 9) l_width='0%' r_width='0%'}
</tr>
</table>
{include file='edit.end.tpl' btn_text='Filter' btns=valueIf(isset($smarty.session[$edit_form_name]), ['clear'=>'Reset'])}

{include file='list.tpl' 
	title="Deposits{valueIf(isset($smarty.session[$edit_form_name]), ' (filtered)')}"
	url='*'
	fields=[
		'dID'=>['ID'],
		'dCTS'=>['Creation date'],
		'uLogin'=>['User'],
		'cName'=>['Pay.system'],
		'dZD'=>['Amount'],
		'pName'=>['Plan'],
		'dLTS'=>['Last accrual'],
		'dN'=>['Accruals count'],
		'dZP'=>['<small>Profit</small>'],
		'dNTS'=>['Next accrual'],
		'dState'=>['State']
	]
	values=$list
	row='*'
}

<a href="{_link module='depo/admin/depo'}?add" class="button-green">Create deposit</a><br>

{include file='admin/footer.tpl'}
{/strip}