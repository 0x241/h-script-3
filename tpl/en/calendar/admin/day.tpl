{strip}
{include file='admin/header.tpl' title='Day'}

{include file='calendar/admin/_statuses.tpl'}

{include file='edit.tpl'
	title='Day'
	title_new='New day'
	fields=[
		'cID'=>[],
		'cTS'=>
			[
				'D', 
				'Date!!',
				[
					'date_empty'=>'input date',
					'date_exist'=>'date alredy exists'
				], 
				'default'=>$today
			],
		'cType'=>
			[
				'S',
				'Type!!',
				[
					'type_empty'=>'select type'
				],
				[0=>'- select -'] + $d_types
			],
		'cPerc'=>
			[
				'%',
				'Percent',
				['perc_wrong'=>'fill percent']
			]
	]
	values=$el
}

{include file='admin/footer.tpl'}
{/strip}