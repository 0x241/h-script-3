{strip}
{include file='header.tpl' title='Operation'}

{include file='balance/_statuses.tpl'}

{if $el}

	<h1>{$op_names[$el.oOper]}</h1>
	{if isset($smarty.get.check)}
	
		<p class="info">
			Waiting for payment confirmation...
		</p>
	
	{else}
	
		{if ($el.oState <= 1)}
		
			{$opc = (($el.oOper != 'CASHIN') or $dfields)}
			{if $opc}
				<p class="info">
					Operation NOT confirmed by you!
				</p>
			{/if}
		
		{elseif $el.oState == 2}
		
			<p class="info">
				The operation will be processed by the Administrator shortly
			</p>
		
		{/if}
		
		{$b = []}
		{if $el.oState <= 2}
			{$b['cancel'] = 'Cancel'}
		{/if}
		{if $el.oState >= 5}
			{$b['del'] = 'Delete'}
		{/if}
		{include file='balance/_oper.tpl' bt=valueIf($opc, 'Confirm', ' ') b=$b
			errors=[
				'oper_not_found'=>'wrong state',
				'oper_disabled'=>'operation disabled',
				'low_bal1'=>'insufficient funds',
				'data_date_wrong'=>'wrong operation date',
				'data_sum_wrong'=>'wrong amount',
				'data_batch_wrong'=>'batch-number empty',
				'batch_exists'=>'operation with batch-number already exists'
			]
		}
	
	{/if}
	
{else}
	
	{include file='balance/_bal.tpl'}
	
	{$oper = $smarty.get.add}
	{if $oper == 'CASHIN'}
	
		<h1>Add funds</h1>
		{if $_cfg.Depo_AutoDepo}
			{include file='depo/_depo.interval.tpl'}
		{/if}
		{include file='edit.tpl'
			form='add'
			fields=[
				'Oper'=>$oper,
				'PSys'=>['S', 'From payment system!!', ['psys_empty'=>'select pay.system'], valueIf(count((array)$clist) > 1, [0=>'- select -'], []) + (array)$clist, 'default'=>$user.aDefCurr],
				'Sum'=>['$', 'Amount!!', ['sum_wrong'=>'wrong amount'], 'comment'=>' <i><span id="ccurr"></span></i>'],
				'Comis'=>['X', 'Comission', 'comment'=>' <i><span id="csum"></span></i>'],
				'Sum2'=>['X', 'Your balance will be credited to the amount', 'comment'=>' <i><span id="sum2"></span></i>'],
				'Plan'=>['S', 'Plan', ['plan_wrong'=>'wrong plan'], [0=>'- auto -'] + (array)$plans, 'skip'=>(count($plans) <= 1)],
				'Compnd'=>['%',	'Compaund', ['compnd_wrong'=>"wrong value [$cmin..$cmax]", 'compnd_wrong1'=>"wrong value for plan '$cplan'"], 'skip'=>!$pcmax]
			]
			errors=[
				'oper_disabled'=>'operation disabled'
			]
		}
	
	{elseif $oper == 'CASHOUT'}
	
		<h1>Withdraw</h1>
		{$s = valueIf($_cfg.Const_IntCurr, 'Amount!! <<in internal units>>', 'Amount!!')}
		{include file='edit.tpl'
			form='add'
			fields=[
				'Oper'=>$oper,
				'PSys'=>['S', 'To payment system!!', ['psys_empty'=>'pay.system wrong'], valueIf(count((array)$clist) > 1, [0=>'- select -'], []) + (array)$clist, 'default'=>$user.aDefCurr],
				'Sum'=>['$', $s, ['sum_wrong'=>'wrong amount', 'limit_exceeded'=>'limit exceeded'], 'comment'=>valueIf($_cfg.Const_IntCurr, " <b>{$icurr}</b>", ' <i><span id="ccurr"></span></i>')],
				'Comis'=>['X', 'Comission', 'comment'=>' <i><span id="csum"></span></i>'],
				'Sum2'=>['X', 'Your account will be injected amount', 'comment'=>' <i><span id="sum2"></span></i>'],
				'PIN'=>
					[
						'*',
						'Input PIN-code!!',
						[
							'pin_wrong'=>'wrong code'
						],
						'skip'=>!$_cfg.Bal_NeedPIN,
						'size'=>8
					]
			]
			errors=[
				'low_bal1'=>'insufficient funds',
				'oper_disabled'=>'operation disabled'
			]
		}
	
	{elseif $oper == 'EX'}
	
		<h1>Exchange</h1>
		{include file='edit.tpl'
			form='add'
			fields=[
				'Oper'=>$oper,
				'PSys'=>['S', 'From payment system!!', ['psys_empty'=>'pay.system wrong'], valueIf(count((array)$clist) > 1, [0=>'- select -'], []) + (array)$clist],
				'Sum'=>['$', 'Amount!!', ['sum_wrong'=>'wrong amount'], 'comment'=>' <i><span id="ccurr"></span></i>'],
				'Comis'=>['X', 'Comission', 'comment'=>' <i><span id="csum"></span></i>'],
				'PSys2'=>['S', 'To payment system!!', ['psys2_empty'=>'pay.system wrong', 'psys2_equal_psys'=>'pay.system must be different', 'ex_rate_not_set'=>'exchange rate is not specified'], valueIf(count((array)$clist2) > 1, [0=>'- select -'], []) + (array)$clist2],
				'Sum2'=>['X', 'Amount to receive', 'comment'=>' <i><span id="sum2"></span></i>']
			]
			errors=[
				'low_bal1'=>'insufficient funds',
				'oper_disabled'=>'operation disabled'
			]
		}
	
	{elseif $oper == 'TR'}

		<h1>Transfer</h1>
		{include file='edit.tpl'
			form='add'
			fields=[
				'Oper'=>$oper,
				'PSys'=>valueIf($_cfg.Const_IntCurr, 
					1, 
					['S', 'Payment system!!', ['psys_empty'=>'pay.system wrong'], valueIf(count((array)$clist) > 1, [0=>'- select -'], []) + (array)$clist]
				),
				'Sum'=>['$', 'Amount!!', ['sum_wrong'=>'wrong amount'], 'comment'=>' <i><span id="ccurr"></span></i>'],
				'Comis'=>['X', 'Comission', 'comment'=>' <i><span id="csum"></span></i>'],
				'Sum2'=>['X', 'The recipient will be transfered', 'comment'=>' <i><span id="sum2"></span></i>'],
				'Login2'=>['T', 'Recipient!!', ['user2_empty'=>'user not found', 'user2_equal_user'=>'users must be different']],
				'Memo'=>['W', 'Memo', 'size'=>4]
			]
			errors=[
				'low_bal1'=>'insufficient funds',
				'oper_disabled'=>'operation disabled'
			]
		}
	
	{/if}

	{include file='balance/_oper.js.tpl' oper=$oper use_sum2=true}
	
{/if}

{include file='footer.tpl'}
{/strip}