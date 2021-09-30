{strip}

{$s1 = valueIf($el.cCID == 'BTCE', 'BTC-E код', 'Batch-номер!! <<хеш операции/транзакции>>')}
{$s2 = valueIf($el.cCID == 'BTCE', 'Введите код', 'укажите номер операции')}
{$s3 = valueIf($el.cCID == 'BTCE', 'Код уже используется', 'номер используется')}

{include file='edit.tpl'
	fields=[
		'oID'=>[],
		'oState'=>
			[
				'X',
				'Статус',
				0,
				"<b>{$op_statuses[$el.oState]}</b>"
			],
		'oCTS'=>
			[
				'X',
				'Дата'
			],
		'uLogin'=>
			[
				'X',
				'Пользователь',
				0,
				"<a href=\"{_link module='account/admin/user'}?id={$el.uID}\">{$el.uLogin}</a>",
				'skip'=>!$from_admin
			],
		'Login2'=>
			[
				'X',
				valueIf($el.oOper == 'TR', 'Получатель', 'Отправитель'),
				0,
				valueIf($from_admin, "<a href=\"{_link module='account/admin/user'}?id={$el.oParams.uid2}\">{$el.oParams.user}</a>", $el.oParams.user),
				'skip'=>!$el.oParams.uid2
			],
		'PSys'=>
			[
				'X',
				'Платежная система',
				0,
				valueIf($from_admin, "<a href=\"{_link module='balance/admin/curr'}?id={$el.ocID}\">{$el.cName}</a>", $el.cName)
			],
		'PayTo'=>
			[
				'X',
				'Реквизиты для оплаты',
				0,
				$smarty.get.payto,
				'skip'=>!$smarty.get.payto
			],
		'oSum'=>
			[
				'X',
				'Сумма',
				0,
				_z(valueIf($smarty.get.amount > 0, $smarty.get.amount, $el.oSum), $el.ocID, 1)
			],
		'oComis'=>
			[
				'X',
				'Комиссия',
				0,
				_z($el.oComis, $el.ocID, 1),
				'skip'=>($el.oComis == 0)
			],
		'Sum'=>
			[
				'X',
				$op_sums[$el.oOper],
				0,
				_z($el.oSum - $el.oComis, $el.ocID, 1),
				'skip'=>($el.oComis == 0)
			],
		'PSys2'=>
			[
				'X',
				valueIf($el.oOper == 'EX', 'На плат. систему', 'С плат. системы'),
				0,
				$el.oParams.psys,
				'skip'=>!$el.oParams.cid2
			],
		'Sum2'=>
			[
				'X',
				'Сумма к получению',
				0,
				_z($el.oParams.sum2, exValue($el.ocID, $el.oParams.cid2), 1),
				'skip'=>!$el.oParams.sum2
			],
		'Acc'=>
			[
				'X',
				valueIf($el.oOper == 'CASHOUT', 'Счет получателя', 'Счет отправителя'),
				0,
				$el.oParams2.acc,
				'skip'=>!in_array($el.oOper, array('CASHIN', 'CASHOUT')) or !$el.oParams2.acc
			],
		'oBatch'=>
			[
				'X',
				'Batch-номер',
				'skip'=>!$el.oBatch
			],
		'oMemo'=>
			[
				'X',
				'Примечание',
				'skip'=>!$el.oMemo,
				0,
				valueIf(!$from_admin and ($el.oMemo[0] == '~'), 'Ошибка', $el.oMemo)
			],
		'oTS'=>
			[
				'X',
				'Изменено',
				'skip'=>!$el.oTS
			],
		'oNTS'=>
			[
				'X',
				'Отработано',
				'skip'=>!$el.oNTS
			],
		'AFMM'=>['U', 'balance/_oper.afm.tpl', skip=>($el.oOper != 'CASHIN') or ($el.oState > 1) or ($_cfg.Bal_AFMMode == 0)],
		'AFMAccount'=>['T', 'Ваш кошелек!!', ['afmacc_wrong' => 'неверное значение'], skip=>($el.oOper != 'CASHIN') or ($el.oState > 1) or !($_cfg.Bal_AFMMode & 1)],
		'AFMBatch'=>['T', $s1, [
				'afmbatch_wrong' => 'неверное значение',
				'data_batch_wrong'=>$s2,
				'batch_exists'=>$s3
			], skip=>($el.oOper != 'CASHIN') or ($el.oState > 1) or !($_cfg.Bal_AFMMode & 2)]
	] + (array)$afields
	values=$el
	btn_text=$bt
	btns=$b
}

{if $afields}

	<br>
	<p class="info">
		Для данной платежной системы не прописаны <a href="{_link module='balance/admin/curr'}?id={$el.ocID}">параметры API</a><br>
		Вы можете выполнить эту операцию, указав параметры выше.<br>
		Это безопасно, т.к. введенные данные нигде не сохраняются
	</p>
	
{/if}

{if $el.oOper == 'CASHIN'}

	{if !isset($smarty.get.payto)}
		{include file='balance/_pform.tpl' btn_text='Оплатить через мерчант'}
	{/if}

	{if $_cfg.Bal_AFMMode == 0}

		{include file='balance/_oper.afm.tpl'}

	{/if}
	
	{if isset($pvalues.acc) or ($from_admin and ($el.oState <= 2))}
	
		{include file='balance/_oper.data.tpl' oComis=0}
		
	{/if}
	
{elseif ($el.oOper == 'CASHOUT') and ($from_admin and ($el.oState <= 2))}

	{include file='balance/_oper.data.tpl' oComis=$el.oComis}

{/if}
	
{/strip}