{strip}
{include file='admin/header.tpl' title='Operation'}

{include file='balance/_statuses.tpl'}

{if $el}

	<h2>{$op_names[$el['oOper']]}</h2>
	{$b = []}
	{if $el.oState <= 2}
		{$b['cancel'] = 'Decline'}
	{/if}
	{if $el.oState >= 4}
		{$b['del'] = 'Delete'}
	{/if}
	{include file='balance/_oper.tpl' bt=valueIf($el.oState <= 2, 'Perform', ' ') b=$b
		errors=[
			'oper_not_found'=>'wrong operation state',
			'oper_disabled'=>'operation disabled',
			'low_bal1'=>'insufficient funds',
			'data_date_wrong'=>'wrong date',
			'data_sum_wrong'=>'wrong amount',
			'data_batch_wrong'=>'batch-number not set',
			'batch_exists'=>'operation with this batch-number already exists',
			'send_error'=>'sending funds error'
		]
		from_admin=true
	}
	
{else}

	{if $smarty.get.add}
	
		{$oper = $smarty.get.add}
		{$use_sum2 = in_array($oper, array('CASHIN', 'CASHOUT', 'EX', 'TR', 'SELL'))}
		{include file='edit.tpl'
			form='add'
			title=$op_names[$oper]
			fields=[
				'Oper'=>$oper,
				'Login'=>$smarty.get.user,
				'User'=>
					[
						'X',
						'User',
						0,
						$smarty.get.user
					],
				'Bal'=>
					[
						'U',
						'balance/bal.tpl'
					],
				'PSys'=>
					[
						'S', 
						valueIf($oper == 'CALCIN', 'Pay system!! or Deposit!!', 'Pay System!!'),
						[
							'depo_wrong'=>'wrong deposit',
							'psys_empty'=>'input pay.system'
						],
						valueIf(count((array)$clist) > 1, [0=>'- select -'], []) + (array)$clist
					],
				'Sum'=>
					[
						'$',
						valueIf($_cfg.Const_IntCurr and in_array($oper, array('CASHOUT')), 'Amount!! <<in internal units>>', 'Amount!!'),
						[
							'sum_wrong'=>'wrong amount'
						],
						'comment'=>' <i><span id="ccurr"></span></i>'
					],
				'Comis'=>
					[
						'X',
						'Comission',
						'comment'=>' <i><span id="csum"></span></i>',
						'skip'=>!$use_sum2
					],
				'PSys2'=>
					[
						'S', 
						valueIf($oper == 'EX', 'To pay.system!!', 'From pay.system!!'),
						[
							'psys2_empty'=>'pay.system not set',
							'psys2_equal_psys'=>'pay.system must be different'
						],
						valueIf(count((array)$clist) > 1, [0=>'- select -'], []) + (array)$clist,
						'skip'=>($oper != 'EX')
					],
				'Sum2'=>
					[
						'X',
						valueIf($oper == 'CASHIN', 'Result amount', 'Result amount'),
						'comment'=>' <i><span id="sum2"></span></i>',
						'skip'=>!$use_sum2
					],
				'Login2'=>
					[
						'T',
						valueIf($oper == 'TR', 'Receiver!!', 'Sender!!'),
						[
							'user2_empty'=>'user not found',
							'user2_equal_user'=>'users must be different'
						],
						'skip'=>!in_array($oper, array('TR', 'TRIN'))
					],
				'Memo'=>
					[
						'W',
						'Decription',
						'size'=>4
					]
			]
			errors=[
				'oper_disabled'=>'operation disabled'
			]
		}

		{include file='balance/_oper.js.tpl' oper=$oper use_sum2=$use_sum2}
	
	{else}
	
		{include file='edit.tpl'
			form='add'
			title='New operation'
			fields=[
				'Oper'=>
					[
						'S',
						'Operation!!',
						[
							'oper_empty'=>'operation is not specified',
							'oper_wrong'=>'unknown operation'
						],
						[0=>'- select -'] + (array)$op_names
					],
				'Login'=>
					[
						'T',
						'User!!',
						[
							'user_empty'=>'user not found'
						],
						'default'=>$smarty.get.user
					]
			]
			btn_text='Next'
		}
		
	{/if}
	
{/if}

{include file='admin/footer.tpl'}
{/strip}