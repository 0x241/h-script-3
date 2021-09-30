{strip}
{include file='admin/header.tpl' title='Пользователи'}

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
	{include file='edit.row.tpl' f='uGroup' v=['T', 'Группа', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].uGroup l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='uLogin' v=['T', '<i>Логин</i>', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].uLogin l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='aName' v=['T', '<i>Имя</i>', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].aName l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='uMail' v=['T', '<i>e-mail</i>', 'size'=>15] 
		vv=$smarty.session[$edit_form_name].uMail l_width='0%' r_width='0%'}
<tr>
</tr>
	<td colspan="3"></td>
	{include file='edit.row.tpl' f='uState' v=['S', 'Статус', 0, [9=>'- все -'] + $usr_statuses]
		vv=valueIf(isset($smarty.session[$edit_form_name]), $smarty.session[$edit_form_name].uState, 9) l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='RefLogin' v=['T', 'Реферал', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].RefLogin l_width='0%' r_width='0%'}
</tr>
</table>
{include file='edit.end.tpl' btn_text='Отфильтровать' btns=valueIf(isset($smarty.session[$edit_form_name]), ['clear'=>'Показать все'])}

{include file='list.tpl' 
	title="Пользователи{valueIf(isset($smarty.session[$edit_form_name]), ' (отфильтровано)')}"
	url='*'
	fields=[
		'uID'=>['ID'],
		'uGroup'=>['Группа'],
		'uLogin'=>['Логин'],
		'aName'=>['Имя'],
		'uMail'=>['e-mail'],
		'uState'=>['Статус'],
		'uLevel'=>['<small>Доступ</small>'],
		'RefLogin'=>['Реферал'],
		'BalUSD'=>['Баланс USD'],
		'BalEUR'=>['Баланс EUR'],
		'BalRUB'=>['Баланс RUB'],
		'BalBTC'=>['Баланс BTC'],
		'BalETH'=>['Баланс ETH'],
		'BalXRP'=>['Баланс XRP']
	]
	values=$list
	row='*'
	include_code='<input name="Group" type="text">'
	btns=['setgroup'=>'Назначить группу', 'del'=>'Удалить']
}

<a href="{_link module='account/admin/user'}?add" class="button-green">Добавить</a><br>

{include file='admin/footer.tpl'}
{/strip}