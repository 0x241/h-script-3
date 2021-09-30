{strip}
{include file='admin/header.tpl' title='День'}

{include file='calendar/admin/_statuses.tpl'}

{include file='edit.tpl'
	title='День'
	title_new='Новый день'
	fields=[
		'cID'=>[],
		'cTS'=>
			[
				'D', 
				'Дата!!',
				[
					'date_empty'=>'укажите дату',
					'date_exist'=>'дата уже существует'
				], 
				'default'=>$today
			],
		'cType'=>
			[
				'S',
				'Тип!!',
				[
					'type_empty'=>'укажите тип'
				],
				[0=>'- выберите тип -'] + $d_types
			],
		'cPerc'=>
			[
				'%',
				'Процент',
				['perc_wrong'=>'укажите процент']
			]
	]
	values=$el
}

{include file='admin/footer.tpl'}
{/strip}