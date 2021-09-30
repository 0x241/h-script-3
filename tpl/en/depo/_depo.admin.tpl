{strip}

{include file='depo/_statuses.tpl'}

{$chg=(($el.dState == 1) and ($el.pCompndMax > 0) and ($el.pCompndMin < $el.pCompndMax))}
{$modbuttons=[] scope='global'}
{if $chg}
	{$modbuttons['chg']='Change compaund' scope='global'}
{/if}

{$add=$el.pEnAdd}
{$sub=(($el.pClComis < 100) and ($el.dNPer >= $el.pMPer))}
{$modform=[] scope='global'}
{if ($el.dState == 1) and ($add or $sub)}
	{$modform=[
		1=>'',
		'Sum'=>
			[
				'$',
				'Amount of change!!',
				[
					'sum_empty'=>'input amount',
					'sum_wrong'=>'wrong amount',
					'low_balance'=>'insufficient amount',
					'cant_add'=>'can\'t add',
					'cant_sub'=>'can\'t sub',
					'plan_not_found'=>'no suitable plan'
				],
				'comment'=>" <i><small>{$el.cCurr}</small></i>",
				'default'=>0
			]
	] scope='global'}
	{if $add}
		{$modbuttons['add']='Add' scope='global'} 
	{/if}
	{if $sub}
		{$modbuttons['sub']='Sub' scope='global'}
	{/if}
{/if}
{if $el.dState == 1}
	{$modbuttons['chp']='Change plan' scope='global'}
	{$modbuttons['cls']='Close' scope='global'}
{/if}

{include file='edit.tpl'
	title=valueIf($from_admin, 'Deposit')
	fields=[
		'dID'=>[],
		'duID'=>[],
		'dcID'=>[],
		'dState'=>
			[
				'X', 
				'State',
				0,
				"<b>{$ststrs[$el.dState]}</b>"
			],
		'dCTS'=>
			[
				'X',
				'Created'
			],
		'uLogin'=>
			[
				'X',
				'User',
				'skip'=>!$from_admin
			],
		'Bal'=>
			[
				'U',
				'balance/bal.tpl',
				'skip'=>!$from_admin
			],
		'cName'=>
			[
				'X', 
				'Pay.system'
			],
		'dZD'=>
			[
				'X',
				'Amount',
				0,
				_z($el.dZD, $el.dcID, 1)
			],
		'dpID'=>
			[
				'S', 
				'Plan',
				0,
				$plans
			],
		'dN'=>
			[
				'X', 
				'Accruals',
				0,
				"{$el.dNPer} of {$el.pNPer}"
			],
		'dLTS'=>
			[
				'X', 
				'Last accural'
			],
		'dNTS'=>
			[
				'X', 
				'Next accural'
			],
		'dCompnd'=>
			[
				'X',
				'Compaund',
				'skip'=>$chg
			],
		'Compnd'=>
			[
				'%',
				'Compaund',
				[
					'compnd_wrong'=>"wrong value [$cmin..$cmax]"
				],
				'default'=>$el.dCompnd,
				'skip'=>!$chg
			],
		'dM'=>
			[
				'X', 
				'Premature withdrawal',
				0,
				valueIf($el.pClComis >= 100, 'Disabled',
					valueIf($el.dNPer >= $el.pMPer, "Enabled", 
						"Remaining accruals: {$el.pMPer - $el.dNPer}")
				),
				'skip'=>($el.dState > 1)
			]
	]+$modform
	values=$el
	errors=[
		'oper_disabled'=>'operation disabled'
	]
	btn_text=' '
	btns=$modbuttons
}

{/strip}