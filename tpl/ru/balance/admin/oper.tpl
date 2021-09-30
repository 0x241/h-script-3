{strip}
{include file='admin/header.tpl' title='Операция'}

{include file='balance/_statuses.tpl'}

{if $el}

	<h2>{$op_names[$el['oOper']]}</h2>
	{$b = []}
	{if $el.oState <= 2}
		{$b['cancel'] = 'Отклонить'}
	{/if}
	{if $el.oState >= 4}
		{$b['del'] = 'Удалить'}
	{/if}
	{include file='balance/_oper.tpl' bt=valueIf($el.oState <= 2, 'Выполнить', ' ') b=$b
		errors=[
			'oper_not_found'=>'неверный статус операции',
			'oper_disabled'=>'операция отключена',
			'low_bal1'=>'недостаточно средств',
			'data_date_wrong'=>'неверная дата операции',
			'data_sum_wrong'=>'неверная сумма',
			'data_batch_wrong'=>'не задан batch-номер операции',
			'batch_exists'=>'операция с таким batch-номером уже существует',
			'send_error'=>'ошибка при отправке средств'
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
						'Пользователь',
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
						valueIf($oper == 'CALCIN', 'Плат. система!! или Депозит!!', 'Плат. система!!'),
						[
							'depo_wrong'=>'неверный депозит',
							'psys_empty'=>'плат. система не указана'
						],
						valueIf(count((array)$clist) > 1, [0=>'- выберите -'], []) + (array)$clist
					],
				'Sum'=>
					[
						'$',
						valueIf($_cfg.Const_IntCurr and in_array($oper, array('CASHOUT')), 'Сумма!! <<в ед. внутр. валюты>>', 'Сумма!!'),
						[
							'sum_wrong'=>'неверная сумма'
						],
						'comment'=>' <i><span id="ccurr"></span></i>'
					],
				'Comis'=>
					[
						'X',
						'Комиссия',
						'comment'=>' <i><span id="csum"></span></i>',
						'skip'=>!$use_sum2
					],
				'PSys2'=>
					[
						'S', 
						valueIf($oper == 'EX', 'На плат. систему!!', 'С плат. системы!!'),
						[
							'psys2_empty'=>'плат.система не указана',
							'psys2_equal_psys'=>'плат.системы должны различаться'
						],
						valueIf(count((array)$clist) > 1, [0=>'- выберите -'], []) + (array)$clist,
						'skip'=>($oper != 'EX')
					],
				'Sum2'=>
					[
						'X',
						valueIf($oper == 'CASHIN', 'Сумма к пополнению', 'Сумма к получению'),
						'comment'=>' <i><span id="sum2"></span></i>',
						'skip'=>!$use_sum2
					],
				'Login2'=>
					[
						'T',
						valueIf($oper == 'TR', 'Получатель!!', 'Отправитель!!'),
						[
							'user2_empty'=>'пользователь не найден',
							'user2_equal_user'=>'пользователи должны различаться'
						],
						'skip'=>!in_array($oper, array('TR', 'TRIN'))
					],
				'Memo'=>
					[
						'W',
						'Описание',
						'size'=>4
					]
			]
			errors=[
				'oper_disabled'=>'операция отключена'
			]
		}

		{include file='balance/_oper.js.tpl' oper=$oper use_sum2=$use_sum2}
	
	{else}
	
		{include file='edit.tpl'
			form='add'
			title='Новая операция'
			fields=[
				'Oper'=>
					[
						'S',
						'Операция!!',
						[
							'oper_empty'=>'операция не указана',
							'oper_wrong'=>'неизвестная операция'
						],
						[0=>'- выберите -'] + (array)$op_names
					],
				'Login'=>
					[
						'T',
						'Пользователь!!',
						[
							'user_empty'=>'пользователь не найден'
						],
						'default'=>$smarty.get.user
					]
			]
			btn_text='Далее'
		}
		
	{/if}
	
{/if}

{include file='admin/footer.tpl'}
{/strip}