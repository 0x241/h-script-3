{strip}

{include file='edit.tpl'
	form='calc'
	fields=[
		'sum'=>[
			'$',
			'Сумма вклада',
			'default'=>10
		],
		'plan'=>[
			'S',
			'План',
			0,
			$calc_pselect,
			'skip'=>false
		],
		'cmpd'=>[
			'S',
			'Реинвестирование',
			0,
			$calc_compnd,
			'skip'=>!$calc_compnd
		]
	]
	on_submit='recalc(); return false;'
	btn_text='Расчет'
}

{/strip}