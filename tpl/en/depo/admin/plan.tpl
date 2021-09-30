{strip}
{include file='admin/header.tpl' title='Plan'}

{include file='edit.tpl'
	title='Plan'
	title_new='New plan'
	fields=[
		'pID'=>[],
		'pHidden'=>
			[
				'C', 
				'Hidden'
			],
		'pNoCalc'=>
			[
				'C', 
				'No accruals'
			],
		'pGroup'=>
			[
				'I', 
				'Plan group number'
			],
		'pName'=>
			[
				'L',
				'Title!!', 
				['name_empty'=>'input title']
			],
		'pDescr'=>
			[
				'W', 
				'Description'
			],
		'pMin'=>
			[
				'$', 
				'Min amount!! <<incl.>>', 
				['min_wrong'=>'input min [from 0.010]']
			],
		'pMax'=>
			[
				'$', 
				'Max amount!! <<NOT incl.>>', 
				['max_wrong'=>'specify the maximum amount [to 1000000.000]']
			],
		'pBonus'=>
			[
				'%', 
				'Bonus in perc.'
			],
		'pWDays'=>
			[
				'C', 
				"Only <a href=\"{_link module='calendar/admin/days'}\" target=\"_blank\">work days</a> <<for periods not more than day>>"
			],
         'pPClndr'=>
			[
				'C',
				"Profit perc. from Calendar <<if calndar not set or 0% - percent will set from plan>>"
			],
		'pPerc'=>
			[
				'%', 
				'Profit perc.', 
				['perc_wrong'=>'input perc']
			],
		'pPer'=>
			[
				'I', 
				'Accrual period!! <<in hours>>', 
				['period_wrong'=>'input period']
			],
		'pNPer'=>
			[
				'I', 
				'Periods count <<0 - endless>>'
			],
		'pReturn'=>
			[
				'%', 
				'Perc. payout at the end of deposit',
				['perc2_wrong'=>'input perc.'],
				'default'=>100
			],
		1=>'Reinvest',
		'pCompndMin'=>
			[
				'%', 
				'Min perc',
				['compndmin_wrong' => 'wrong value']
			],
		'pCompndMax'=>
			[
				'%', 
				'Max perc <<0 - disabled>>',
				['compndmax_wrong' => 'wrong value']
			],
		'Deposit increase',
		'pEnAdd'=>
			[
				'C', 
				'Enable'
			],
		'pMinAdd'=>
			[
				'$', 
				'Min amount <<incl.>>'
			],
		'Deposit decrease (Removal)',
		'pClComis'=>
			[
				'%', 
				'Comission perc. <<100 - disabled>>',
				['clcomis_wrong' => 'wrong value'],
				'default'=>100
			],
		'pMPer'=>
			[
				'I', 
				'Number of periods can not be removed'
			],
		'pClPer'=>
			[
				'I', 
				'Number of periods no comission'
			],
		'Restrictions',
		'pGroupReq'=>
			[
				'I', 
				'Available only after the deposit of the plan with group<br><<0 - not use>>'
			],
		'pMaxCount'=>
			[
				'I', 
				'Max number of deposits with the plan <<0 - no limits>>'
			],
		'Special ref.system',
		'pDPerc'=>
			[
				'A', 
				'From deposit'
			],
		'pPPerc'=>
			[
				'A', 
				'From accrual'
			]
	]
	values=$el
}

{include file='admin/footer.tpl'}
{/strip}