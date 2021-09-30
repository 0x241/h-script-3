{strip}
{include file='admin/header.tpl' title='Платежные системы'}

{include file='list.tpl' 
	title='Платежные системы'
	url='*'
	fields=[
		'cID'=>['ID'],
		'cCID'=>['Код'],
		'cName'=>['Наименование'],
		'cCurr'=>['Валюта'],
		'cBal'=>['Баланс'],
		'cAPI'=>['API'],
		'cDisable'=>['<small>Откл.</small>'],
		'cCASHIN'=>['<small>Пополн.</small>'],
		'cCASHOUT'=>['<small>Вывод</small>'],
		'cEX'=>['<small>Обмен</small>'],
		'cTR'=>['<small>Перевод</small>'],
		'cBUY'=>['<small>Покупка</small>'],
		'cSELL'=>['<small>Продажа</small>'],
		'cBUY2'=>['<small>Услуга</small>'],
		'cSELL2'=>['<small>Оказ.услуги</small>'],
		'cGIVE'=>['<small>Вклад</small>'],
		'cTAKE'=>['<small>Снятие</small>'],
		'cHidden'=>['<small>Скрыта</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Удалить']
}

<a href="{_link module='balance/admin/curr'}?add" class="button-green">Добавить</a><br>

{include file='admin/footer.tpl'}
{/strip}