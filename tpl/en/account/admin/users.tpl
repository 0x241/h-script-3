{strip}
{include file='admin/header.tpl' title='Users'}

{include file='account/admin/_statuses.tpl'}

{$cid = [
'USD' => exValue(1, reset($vcurrs.USD)),
'EUR' => exValue(1, reset($vcurrs.EUR)),
'RUB' => exValue(1, reset($vcurrs.RUB)),
'BTC' => exValue(1, reset($vcurrs.BTC)),
'ETH' => exValue(1, reset($vcurrs.ETH)),
'XRP' => exValue(1, reset($vcurrs.XRP))
]}

{include file='edit.begin.tpl' form='users_filter' url='*'}
<table class="formatTable">
<tr>
	{include file='edit.row.tpl' f='uGroup' v=['T', 'Group', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].uGroup l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='uLogin' v=['T', '<i>Login</i>', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].uLogin l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='aName' v=['T', '<i>Name</i>', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].aName l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='uMail' v=['T', '<i>e-mail</i>', 'size'=>15] 
		vv=$smarty.session[$edit_form_name].uMail l_width='0%' r_width='0%'}
<tr>
</tr>
	<td colspan="3"></td>
	{include file='edit.row.tpl' f='uState' v=['S', 'State', 0, [9=>'- all -'] + $usr_statuses]
		vv=valueIf(isset($smarty.session[$edit_form_name]), $smarty.session[$edit_form_name].uState, 9) l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='RefLogin' v=['T', 'Ref', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].RefLogin l_width='0%' r_width='0%'}
</tr>
</table>
{include file='edit.end.tpl' btn_text='Filter' btns=valueIf(isset($smarty.session[$edit_form_name]), ['clear'=>'Show all'])}

{include file='list.tpl' 
	title="Users{valueIf(isset($smarty.session[$edit_form_name]), ' (filtered)')}"
	url='*'
	fields=[
		'uID'=>['ID'],
		'uGroup'=>['Group'],
		'uLogin'=>['Login'],
		'aName'=>['Name'],
		'uMail'=>['e-mail'],
		'uState'=>['State'],
		'uLevel'=>['<small>Level</small>'],
		'RefLogin'=>['Ref'],
		'BalUSD'=>['USD balance'],
		'BalEUR'=>['EUR balance'],
		'BalRUB'=>['RUB balance'],
		'BalBTC'=>['BTC balance'],
		'BalETH'=>['ETH balance'],
		'BalXRP'=>['XRP balance']
	]
	values=$list
	row='*'
	include_code='<input name="Group" type="text">'
	btns=['setgroup'=>'Set group', 'del'=>'Delete']
}

<a href="{_link module='account/admin/user'}?add" class="button-green">Add user</a><br>

{include file='admin/footer.tpl'}
{/strip}