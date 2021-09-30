{strip}

{include file='edit.tpl'
	form='sqa'
	fields=
	[
		'uID' => $uid,
		'SQuestion'=>
			[
				'X', 
				'',
				0,
				$squest
			],
		'SAnswer'=>
			[
				'T', 
				'Secret answer!!',
				[
					'answer_wrong'=>'wrong answer'
				],
				'size'=>40
			]
	]
	btn_text='Next'
}

{/strip}