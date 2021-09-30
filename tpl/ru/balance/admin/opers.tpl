{strip}
{include file='admin/header.tpl' title='Операции'}

{include file='balance/_statuses.tpl'}

{include file='edit.begin.tpl' form='opers_filter' url='*'}
<table class="formatTable">
<tr>
	{include file='edit.row.tpl' f='uLogin' v=['T', 'Пользователь', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].uLogin l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='oOper' v=['S', 'Операция', 0, ['- все -'] + $op_names] 
		vv=$smarty.session[$edit_form_name].oOper l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='ocID' v=['S', 'Плат.система', 0, ['- все -'] + $currs] 
		vv=$smarty.session[$edit_form_name].ocID l_width='0%' r_width='0%'}
<tr>
</tr>
	{include file='edit.row.tpl' f='oBatch' v=['T', 'Batch-номер', 'size'=>10] 
		vv=$smarty.session[$edit_form_name].oBatch l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='oState' v=['S', 'Статус', 0, [9=>'- все -'] + $op_statuses]
		vv=valueIf(isset($smarty.session[$edit_form_name]), $smarty.session[$edit_form_name].oState, 9) l_width='0%' r_width='0%'}
	<td>&nbsp;</td>
	{include file='edit.row.tpl' f='oMemo' v=['T', '<i>Примечание</i>', 'size'=>20] 
		vv=$smarty.session[$edit_form_name].oMemo l_width='0%' r_width='0%'}
</tr>
</table>
{include file='edit.end.tpl' btn_text='Отфильтровать' btns=valueIf(isset($smarty.session[$edit_form_name]), ['clear'=>'Показать все'])}

{include file='list.tpl' 
	title="Операции{valueIf(isset($smarty.session[$edit_form_name]), ' (отфильтровано)')}"
	url='*'
	fields=[
		'oID'=>['ID'],
		'uLogin'=>['Пользователь'],
		'oTS'=>['Создано<br>Обработно'],
		'oOper'=>['Операция'],
		'oCID'=>['Плат.система<br><small>Счет</small>'],
		'oSum'=>['Сумма<br><small>Комиссия</small>'],
		'oBatch'=>['Batch-номер'],
		'oState'=>['Статус'],
		'oMemo'=>['Примечание']
	]
	values=$list
	row='*'
	btns=['complete'=>'Выполнить', 'confirm'=>'Подтв. выполнение', 'cancel'=>'Отклонить', 'del'=>'Удалить']
	linkparams=$linkparams
}

<a href="{_link module='balance/admin/oper'}?add" class="button-green">Создать</a><br>

{include file='admin/footer.tpl'}
{/strip}