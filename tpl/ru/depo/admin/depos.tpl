{strip}
{include file='admin/header.tpl' title='Депозиты'}

{include file='depo/_statuses.tpl'}

{include file='edit.begin.tpl' form='deps_filter' url='*'}
<table class="formatTable">
<tr>
	{include file='edit.row.tpl' f='uLogin' v=['T', 'Пользователь', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].uLogin l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='dcID' v=['S', 'Плат.система', 0, ['- все -'] + $currs] 
		vv=$smarty.session[$edit_form_name].dcID l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='dpID' v=['S', 'План', 0, ['- все -'] + $plans] 
		vv=$smarty.session[$edit_form_name].dpID l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='dState' v=['S', 'Статус', 0, [9=>'- все -'] + $ststrs]
		vv=valueIf(isset($smarty.session[$edit_form_name]), $smarty.session[$edit_form_name].dState, 9) l_width='0%' r_width='0%'}
</tr>
</table>
{include file='edit.end.tpl' btn_text='Отфильтровать' btns=valueIf(isset($smarty.session[$edit_form_name]), ['clear'=>'Показать все'])}

{include file='list.tpl' 
	title="Депозиты{valueIf(isset($smarty.session[$edit_form_name]), ' (отфильтровано)')}"
	url='*'
	fields=[
		'dID'=>['ID'],
		'dCTS'=>['Дата начала'],
		'uLogin'=>['Пользователь'],
		'cName'=>['Плат.система'],
		'dZD'=>['Сумма'],
		'pName'=>['План'],
		'dLTS'=>['Посл.начисление'],
		'dN'=>['Начислений'],
		'dZP'=>['<small>Начислено</small>'],
		'dNTS'=>['След.начисление'],
		'dState'=>['Статус']
	]
	values=$list
	row='*'
}

<a href="{_link module='depo/admin/depo'}?add" class="button-green">Создать</a><br>

{include file='admin/footer.tpl'}
{/strip}