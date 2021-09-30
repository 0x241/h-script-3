{strip}
{if $from_admin or ($_cfg.Bal_AFMMode == 0)}

<h2>
	Manual payment details via {$el.cName}<br>
	{if !$from_admin and ($el.oOper == 'CASHIN')} and payeer details{/if}
</h2>

{$ro = !$from_admin and ($el.oState > 1)}
{include file='edit.tpl'
	form='data'
	fields=[
		'oID'=>$el.oID,
		'date'=>
			[
				'D',
				'Date!!',
				[
					'data_date_wrong'=>'wrong date'
				],
				'default'=>$today,
				'readonly'=>$ro
			],
		'sum'=>
			[
				'X',
				'Amount',
				0,
				_z($el.oSum - $oComis, $el.ocID, 1)
			],
		'batch'=>
			[
				'T',
				$s1,
				[
					'data_batch_wrong'=>$s2,
					'batch_exists'=>$s3
				],
				'default'=>$defaultbatch,
				'readonly'=>$ro
			],
		'memo'=>
			[
				'A',
				'Memo',
				'readonly'=>$ro
			]
	] + (array)$dfields
	values=$el.oParams2
	btn_text=valueIf($ro, ' ', valueIf($el.oParams2.batch, 'Change', 'Save'))
	hide_cancel=true
}

{/if}		
{/strip}