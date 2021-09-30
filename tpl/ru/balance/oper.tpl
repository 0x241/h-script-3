{strip}
{include file='header.tpl' title='Операция'}

{include file='balance/_statuses.tpl'}

{if $el}

	<h1>{$op_names[$el.oOper]}</h1>
	{if isset($smarty.get.check)}
	
		<p class="info">
			Ожидание подтверждения оплаты...
		</p>
	
	{else}
	
		{if ($el.oState <= 1)}
		
			{$opc = (($el.oOper != 'CASHIN') or $dfields)}
			{if $opc}
				<p class="info">
					Операция НЕ подтверждена Вами!
				</p>
			{/if}
		
		{elseif $el.oState == 2}
		
			<p class="info">
				Операция будет обработана Администратором в ближайшее время
			</p>
		
		{/if}
		
		{$b = []}
		{if $el.oState <= 2}
			{$b['cancel'] = 'Отменить'}
		{/if}
		{if $el.oState >= 5}
			{$b['del'] = 'Удалить'}
		{/if}
		{include file='balance/_oper.tpl' bt=valueIf($opc, 'Подтвердить', ' ') b=$b
			errors=[
				'oper_not_found'=>'неверный статус операции',
				'oper_disabled'=>'операция отключена',
				'low_bal1'=>'недостаточно средств',
				'data_date_wrong'=>'неверная дата операции',
				'data_sum_wrong'=>'неверная сумма',
				'data_batch_wrong'=>'не задан batch-номер операции',
				'batch_exists'=>'операция с таким batch-номером уже существует'
			]
		}
	
	{/if}
	
{else}
	
	{include file='balance/_bal.tpl'}
	
	{$oper = $smarty.get.add}
	{if $oper == 'CASHIN'}
	
		<h1>Пополнение баланса</h1>
		{if $_cfg.Depo_AutoDepo}
			{include file='depo/_depo.interval.tpl'}
		{/if}
		{include file='edit.tpl'
			form='add'
			fields=[
				'Oper'=>$oper,
				'PSys'=>['S', 'С платежной системы!!', ['psys_empty'=>'плат.система не указана'], valueIf(count((array)$clist) > 1, [0=>'- выберите -'], []) + (array)$clist, 'default'=>$user.aDefCurr],
				'Sum'=>['$', 'Сумма!!', ['sum_wrong'=>'неверная сумма'], 'comment'=>' <i><span id="ccurr"></span></i>'],
				'Comis'=>['X', 'Комиссия', 'comment'=>' <i><span id="csum"></span></i>'],
				'Sum2'=>['X', 'Ваш баланс будет пополнен на сумму', 'comment'=>' <i><span id="sum2"></span></i>'],
				'Plan'=>['S', 'План', ['plan_wrong'=>'неверный план'], [0=>'- авто -'] + (array)$plans, 'skip'=>(count($plans) <= 1)],
				'Compnd'=>['%',	'Процент реинвеста <<капитализация>>', ['compnd_wrong'=>"неверное значение [$cmin..$cmax]", 'compnd_wrong1'=>"неверное значение для плана '$cplan'"], 'skip'=>!$pcmax]
			]
			errors=[
				'oper_disabled'=>'операция отключена'
			]
		}
	
	{elseif $oper == 'CASHOUT'}
	
		<h1>Вывод средств</h1>
		{$s = valueIf($_cfg.Const_IntCurr, 'Сумма!! <<в единицах внутренней валюты>>', 'Сумма!!')}
		{include file='edit.tpl'
			form='add'
			fields=[
				'Oper'=>$oper,
				'PSys'=>['S', 'На платежную систему!!', ['psys_empty'=>'плат.система не указана'], valueIf(count((array)$clist) > 1, [0=>'- выберите -'], []) + (array)$clist, 'default'=>$user.aDefCurr],
				'Sum'=>['$', $s, ['sum_wrong'=>'неверная сумма', 'limit_exceeded'=>'превышен лимит'], 'comment'=>valueIf($_cfg.Const_IntCurr, " <b>{$icurr}</b>", ' <i><span id="ccurr"></span></i>')],
				'Comis'=>['X', 'Комиссия', 'comment'=>' <i><span id="csum"></span></i>'],
				'Sum2'=>['X', 'На Ваш счет будет выведена сумма', 'comment'=>' <i><span id="sum2"></span></i>'],
				'PIN'=>
					[
						'*',
						'Введите PIN-код!!',
						[
							'pin_wrong'=>'неверный код'
						],
						'skip'=>!$_cfg.Bal_NeedPIN,
						'size'=>8
					]
			]
			errors=[
				'low_bal1'=>'недостаточно средств',
				'oper_disabled'=>'операция отключена'
			]
		}
	
	{elseif $oper == 'EX'}
	
		<h1>Обмен валют</h1>
		{include file='edit.tpl'
			form='add'
			fields=[
				'Oper'=>$oper,
				'PSys'=>['S', 'С платежной системы!!', ['psys_empty'=>'плат.система не указана'], valueIf(count((array)$clist) > 1, [0=>'- выберите -'], []) + (array)$clist],
				'Sum'=>['$', 'Сумма!!', ['sum_wrong'=>'неверная сумма'], 'comment'=>' <i><span id="ccurr"></span></i>'],
				'Comis'=>['X', 'Комиссия', 'comment'=>' <i><span id="csum"></span></i>'],
				'PSys2'=>['S', 'На платежную систему!!', ['psys2_empty'=>'плат.система не указана', 'psys2_equal_psys'=>'плат.системы должны различаться', 'ex_rate_not_set'=>'Курс валюты не задан'], valueIf(count((array)$clist2) > 1, [0=>'- выберите -'], []) + (array)$clist2],
				'Sum2'=>['X', 'Сумма к получению', 'comment'=>' <i><span id="sum2"></span></i>']
			]
			errors=[
				'low_bal1'=>'недостаточно средств',
				'oper_disabled'=>'операция отключена'
			]
		}
	
	{elseif $oper == 'TR'}

		<h1>Перевод средств</h1>
		{include file='edit.tpl'
			form='add'
			fields=[
				'Oper'=>$oper,
				'PSys'=>valueIf($_cfg.Const_IntCurr, 
					1, 
					['S', 'Платежная система!!', ['psys_empty'=>'плат.система не указана'], valueIf(count((array)$clist) > 1, [0=>'- выберите -'], []) + (array)$clist]
				),
				'Sum'=>['$', 'Сумма!!', ['sum_wrong'=>'неверная сумма'], 'comment'=>' <i><span id="ccurr"></span></i>'],
				'Comis'=>['X', 'Комиссия', 'comment'=>' <i><span id="csum"></span></i>'],
				'Sum2'=>['X', 'Получателю будет переведена сумма', 'comment'=>' <i><span id="sum2"></span></i>'],
				'Login2'=>['T', 'Получатель!!', ['user2_empty'=>'пользователь не найден', 'user2_equal_user'=>'пользователи должны различаться']],
				'Memo'=>['W', 'Примечание', 'size'=>4]
			]
			errors=[
				'low_bal1'=>'недостаточно средств',
				'oper_disabled'=>'операция отключена'
			]
		}
	
	{/if}

	{include file='balance/_oper.js.tpl' oper=$oper use_sum2=true}
	
{/if}

{include file='footer.tpl'}
{/strip}