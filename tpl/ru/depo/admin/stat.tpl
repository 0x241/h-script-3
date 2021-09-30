{strip}
{include file='admin/header.tpl' title='Статистика'}

<h2>Информация</h2>

Пользователей всего: {$users.all}, в т.ч. активных: {$users.active}, в т.ч. со вкладами: {$users.wdepo}<br>
Депозитов всего: {$deps.all}, в т.ч. активных: {$deps.active}<br>
<br>

<table class="FormatTable" border="1">
	<tr>
		<th></th>
		<th colspan="11">Операции</th>
		<th rowspan="2"><small>Активные депозиты</small></th>
		<th colspan="3">Балансы</th>
	</tr>
	<tr>
		<th>Плат.&nbsp;система</th>
		<th><small>Бонус</small></th>
		<th><small>Штраф</small></th>
		<th><small>Пополнение</small></th>
		<th><small>Рефские</small></th>
		<th><small>Вклад</small></th>
		<th><small>в т.ч. с баланса</small></th>
		<th><small>Снятие</small></th>
		<th><small>Начисление</small></th>
		<th><small>Списание</small></th>
		<th><small>Ожидает вывода</small></th>
		<th><small>Вывод</small></th>
		<th><small>Доступно</small></th>
		<th><small>Занято</small></th>
		<th><small>Ожидает</small></th>
	</tr>
{foreach $currs as $cid => $c}
	<tr>
		<td align="right">{$c.cName}&nbsp;<i><small>{$c.cCurr}</small></i></td>
		<td align="right">{_z($stat[$cid].BONUS, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].PENALTY, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].CASHIN, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].REF, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].GIVE, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].GIVE2, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].TAKE, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].CALCIN, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].CALCOUT, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].CASHOUT2, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].CASHOUT, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].DEPO, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].BAL, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].LOCK, $cid, -1)}</td>
		<td align="right">{_z($stat[$cid].OUT, $cid, -1)}</td>
	</tr>
{/foreach}
<tr>
	<td align="right"><b>ИТОГО:</b></td>
{foreach $vcurrs as $curr => $cids}
<tr>
	<td align="right">{$curr}</td>
	<td align="right">{_z($stat[0][$curr].BONUS, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].PENALTY, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].CASHIN, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].REF, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].GIVE, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].GIVE2, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].TAKE, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].CALCIN, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].CALCOUT, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].CASHOUT2, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].CASHOUT, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].DEPO, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].BAL, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].LOCK, reset($cids), -1)}</td>
	<td align="right">{_z($stat[0][$curr].OUT, reset($cids), -1)}</td>
</tr>
{/foreach}
</table>
<br>

{include file='edit.tpl'
	title='Параметры отбора'
	fields=[
		'PSys'=>
			[
				'S',
				'Платежная система',
				0,
				[0=>'- все -'] + (array)$clist
			],
		'D1'=>
			[
				'DT',
				'Дата с',
				'default'=>$today
			],
		'D2'=>
			[
				'DT',
				'Дата по'
			]
	]
	btn_text='Показать'
}

{if $res}
{$cid = [
'USD' => exValue(1, reset($vcurrs.USD)),
'EUR' => exValue(1, reset($vcurrs.EUR)),
'RUB' => exValue(1, reset($vcurrs.RUB)),
'BTC' => exValue(1, reset($vcurrs.BTC)),
'ETH' => exValue(1, reset($vcurrs.ETH)),
'XRP' => exValue(1, reset($vcurrs.XRP))
]}

	<br>
	<table class="FormatTable" border="1">
		<tr>
			<td>Регистрации</td>
			<td align="right">{$res.REG}</td>
		</tr>
		<tr>
			<td>&nbsp;
			<td width="10%">USD
			<td width="10%">EUR
			<td width="10%">RUB
			<td width="10%">BTC
			<td width="10%">ETH
			<td width="10%">XRP
		<tr>
			<td>Бонус</td>
			<td align="right">{_z($res.BONUS.USD, $cid.USD)}</td>
			<td align="right">{_z($res.BONUS.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.BONUS.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.BONUS.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.BONUS.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.BONUS.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>Штраф</td>
			<td align="right">{_z($res.PENALTY.USD, $cid.USD)}</td>
			<td align="right">{_z($res.PENALTY.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.PENALTY.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.PENALTY.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.PENALTY.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.PENALTY.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>Пополнение</td>
			<td align="right">{_z($res.CASHIN.USD, $cid.USD)}</td>
			<td align="right">{_z($res.CASHIN.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.CASHIN.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.CASHIN.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.CASHIN.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.CASHIN.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>Рефские</td>
			<td align="right">{_z($res.REF.USD, $cid.USD)}</td>
			<td align="right">{_z($res.REF.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.REF.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.REF.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.REF.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.REF.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>Вклад</td>
			<td align="right">{_z($res.GIVE.USD, $cid.USD)}</td>
			<td align="right">{_z($res.GIVE.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.GIVE.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.GIVE.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.GIVE.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.GIVE.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>Снятие</td>
			<td align="right">{_z($res.TAKE.USD, $cid.USD)}</td>
			<td align="right">{_z($res.TAKE.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.TAKE.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.TAKE.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.TAKE.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.TAKE.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>Начисление</td>
			<td align="right">{_z($res.CALCIN.USD, $cid.USD)}</td>
			<td align="right">{_z($res.CALCIN.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.CALCIN.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.CALCIN.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.CALCIN.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.CALCIN.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>Списание</td>
			<td align="right">{_z($res.CALCOUT.USD, $cid.USD)}</td>
			<td align="right">{_z($res.CALCOUT.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.CALCOUT.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.CALCOUT.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.CALCOUT.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.CALCOUT.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>Вывод</td>
			<td align="right">{_z($res.CASHOUT.USD, $cid.USD)}</td>
			<td align="right">{_z($res.CASHOUT.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.CASHOUT.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.CASHOUT.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.CASHOUT.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.CASHOUT.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>Сделано депозитов</td>
			<td align="right">{_z($res.DEPO.USD, $cid.USD)}</td>
			<td align="right">{_z($res.DEPO.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.DEPO.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.DEPO.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.DEPO.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.DEPO.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>из них активных сейчас</td>
			<td align="right">{_z($res.DEPO2.USD, $cid.USD)}</td>
			<td align="right">{_z($res.DEPO2.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.DEPO2.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.DEPO2.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.DEPO2.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.DEPO2.XRP, $cid.XRP)}</td>
		</tr>
		<tr>
			<td>Заработок системы</td>
			<td align="right">{_z($res.CASHIN.USD - $res.CASHOUT.USD, $cid.USD)}</td>
			<td align="right">{_z($res.CASHIN.EUR - $res.CASHOUT.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.CASHIN.RUB - $res.CASHOUT.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.CASHIN.BTC - $res.CASHOUT.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.CASHIN.ETH - $res.CASHOUT.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.CASHIN.XRP - $res.CASHOUT.XRP, $cid.XRP)}</td>
		</tr>
	</table>

{/if}

{include file='admin/footer.tpl'}
{/strip}