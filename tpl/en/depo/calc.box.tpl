{strip}

{include file='edit.tpl'
	form='calc'
	fields=[
		'sum'=>[
			'$',
			'Amount',
			'default'=>10
		],
		'plan'=>[
			'S',
			'Plan',
			0,
			$calc_pselect,
			'skip'=>false
		],
		'cmpd'=>[
			'S',
			'Compaund',
			0,
			$calc_compnd,
			'skip'=>!$calc_compnd
		]
	]
	on_submit='recalc(); return false;'
	btn_text='Calculate'
}

{/strip}