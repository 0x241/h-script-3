{strip}
{include file='admin/header.tpl' title='Payment system'}

{if $el}

	<h2>{if $el.cCID == '*'}Internal payment system{else}Payment system [{$el.cCID}]{/if}</h2>

	{if isset($smarty.get.testapi)}

		<h2>Тест API</h2>
		<p class="info">
			{if $res.result == 'OK'}
				Wallet balance: <b>{_z($res.sum, $el.cID, -1)}</b> {$el.cCurr}.<br>
				Test completed!
			{else}
				Error: <b>{$res.result}</b>
			{/if}
		</p>
		
	{/if}

	{if $sfields}
		{$sfields = [1=>'SCI <small>(add funds/merchant)</small>'] + $sfields}
	{/if}
	{if $afields}
		{$afields = [2=>'API <small>(withdraw)</small>'] + $afields}
	{/if}
	{$params=[
		77=>'Live balance',
		'cBal' => ['X', 'Last value'],
		'cBalMin' => ['$', 'Notify if balance is below Х'],
		5=>'Add funds',
		'cCASHINMode'=>['S', 'Mode', 0, [0=>'off', 1=>'manual', 2=>'thru merchant', 3=>'manual or thru merchant']],
		'cCASHINMin'=>
			[
				'$',
				'Min amount'
			],
		'cCASHINMax'=>
			[
				'$',
				'Max amount <<0 - default>>'
			],
		'cCASHINInt'=>
			[
				'C',
				'Only integer amounts',
				'default'=>0
			],
		'cCASHINComis'=>
			[
				'%',
				'Comission perc.'
			],
		'cCASHINComisMin'=>
			[
				'$',
				'Min comission'
			],
		'cCASHINComisMax'=>
			[
				'$',
				'Max comission <<0 - no>>'
			],
		6=>'Withdraw',
		'cCASHOUTMode'=>['S', 'Mode', 0, [0=>'off', 1=>'manual', 2=>'instant']],
		'cCASHOUTMin'=>
			[
				'$',
				'Min amount'
			],
		'cCASHOUTMax'=>
			[
				'$',
				'Min amount <<0 - default>>'
			],
		'cCASHOUTInt'=>
			[
				'C',
				'Only integer amounts',
				'default'=>0
			],
		'cCASHOUTComis'=>
			[
				'%',
				'Comission perc.'
			],
		'cCASHOUTComisMin'=>
			[
				'$',
				'Min comission'
			],
		'cCASHOUTComisMax'=>
			[
				'$',
				'Max comission <<0 - no>>'
			],
		'cCASHOUTLimitPer'=>
			[
				'I',
				'Limit period <<in hours, 0 - no>>'
			],
		'cCASHOUTLimit'=>
			[
				'$',
				'Limit amount'
			],
		7=>'Exchange',
		'cEXMode'=>['S', 'Mode', 0, [0=>'off', 1=>'manual', 2=>'instant']],
		'cEXOut'=>
			[
				'%',
				'Correction <<in perc. at rate>> direction: to Internal'
			],
		'cEXIn'=>
			[
				'%',
				'Correction <<in perc. at rate>> direction: from Internal'
			],
		'cEXMin'=>
			[
				'$',
				'Min amount'
			],
		'cEXMax'=>
			[
				'$',
				'Max amount <<0 - default>>'
			],
		'cEXInt'=>
			[
				'C',
				'Only integer amounts',
				'default'=>0
			],
		'cEXComis'=>
			[
				'%',
				'Comission, perc.'
			],
		'cEXComisMin'=>
			[
				'$',
				'Min comission'
			],
		'cEXComisMax'=>
			[
				'$',
				'Max comission <<0 - no>>'
			],
		8=>'Transfer',
		'cTRMode'=>['S', 'Mode', 0, [0=>'off', 1=>'manual', 2=>'instant']],
		'cTRMin'=>
			[
				'$',
				'Min amount'
			],
		'cTRMax'=>
			[
				'$',
				'Max amount <<0 - default>>'
			],
		'cTRInt'=>
			[
				'C',
				'Only integer amounts',
				'default'=>0
			],
		'cTRComis'=>
			[
				'%',
				'Comission, perc.'
			],
		'cTRComisMin'=>
			[
				'$',
				'Min comission'
			],
		'cTRComisMax'=>
			[
				'$',
				'Max comission <<0 - no>>'
			],
		'Buy',
		'cBUYMode'=>['S', 'Mode', 0, [0=>'off', 1=>'manual', 2=>'instant']],
		'Sell',
		'cSELLMode'=>['S', 'Mode', 0, [0=>'off', 1=>'manual', 2=>'instant']],
		'Service',
		'cBUY2Mode'=>['S', 'Mode', 0, [0=>'off', 1=>'manual', 2=>'instant']],
		'Sell service',
		'cSELL2Mode'=>['S', 'Mode', 0, [0=>'off', 1=>'manual', 2=>'instant']],
		'Deposit',
		'cGIVEMode'=>['S', 'Mode', 0, [0=>'off', 1=>'manual', 2=>'instant']],
		'Removal',
		'cTAKEMode'=>['S', 'Mode', 0, [0=>'off', 1=>'manual', 2=>'instant']]
	]}
	{include file='edit.tpl'
		fields=[
			'cID'=>[],
			'cCID'=>[],
			'cDisabled'=>
				[
					'C',
					'Disabled',
					'default'=>1
				],
			'cHidden'=>
				[
					'C',
					'Hidden',
					'default'=>1
				],
			'cMTS'=>
				[
					'X',
					'Modified',
					'skip'=>!$el.cMTS
				],
			99=>'Вид',
			'cName'=>
				[
					'T',
					'Title',
					'size'=>30,
					'comment'=>$cName
				],
			'cCurr'=>
				[
					'T',
					'Currency',
					'comment'=>$el.cCurrID
				],
			'cNumDec'=>
				[
					'I', 
					'Number of decimal places (0-6) <<0 - default>>'
				]
		] + 
		(array)$pfields + 
		(array)$sfields +
		(array)$afields +
		$params
		values=$el
	}
	
{else}

	{include file='edit.tpl'
		form='add'
		title='Add pay.system'
		fields=[
			'PSys'=>
				[
					'S', 
					'', 
					[
						'psys_not_selected'=>'select pay.system'
					],
					[0=>'- select -'] + (array)$cids
				]
		]
		btn_text='Add'
	}
	
{/if}

{include file='admin/footer.tpl'}
{/strip}