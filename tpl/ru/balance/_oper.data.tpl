{strip}
{if $from_admin or ($_cfg.Bal_AFMMode == 0)}

<h2>
	Данные платежа через {$el.cName},<br>
	произведенного вручную
	{if !$from_admin and ($el.oOper == 'CASHIN')} и<br> реквизиты плательщика{/if}
</h2>

{$ro = !$from_admin and ($el.oState > 1)}
{include file='edit.tpl'
	form='data'
	fields=[
		'oID'=>$el.oID,
		'date'=>
			[
				'D',
				'Дата!!',
				[
					'data_date_wrong'=>'неверная дата'
				],
				'default'=>$today,
				'readonly'=>$ro
			],
		'sum'=>
			[
				'X',
				'Сумма',
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
				'Примечание',
				'readonly'=>$ro
			]
	] + (array)$dfields
	values=$el.oParams2
	btn_text=valueIf($ro, ' ', valueIf($el.oParams2.batch, 'Изменить', 'Создать'))
	hide_cancel=true
}
	
{/if}	
{/strip}