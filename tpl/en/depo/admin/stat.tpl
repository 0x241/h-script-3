{strip}
{include file='admin/header.tpl' title='Statistics'}

<h2>Information</h2>

Total users: {$users.all}, incl. active: {$users.active}, incl. with deposits: {$users.wdepo}<br>
Total dposits: {$deps.all}, incl. active: {$deps.active}<br>
<br>

<table class="FormatTable" border="1">
	<tr>
		<th></th>
		<th colspan="11">Operation</th>
		<th rowspan="2"><small>Active deposits</small></th>
		<th colspan="3">Balance</th>
	</tr>
	<tr>
		<th>Pay.system</th>
		<th><small>Bonus</small></th>
		<th><small>Penalty</small></th>
		<th><small>Add funds</small></th>
		<th><small>Ref.com</small></th>
		<th><small>Deposit</small></th>
		<th><small>Reinvest</small></th>
		<th><small>Removal</small></th>
		<th><small>Accrual</small></th>
		<th><small>Calcout</small></th>
		<th><small>Pending</small></th>
		<th><small>Withdrawal</small></th>
		<th><small>Available</small></th>
		<th><small>Locked</small></th>
		<th><small>Waiting</small></th>
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
	<td align="right"><b>TOTAL:</b></td>
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
	title='Filter parameters'
	fields=[
		'PSys'=>
			[
				'S',
				'Pay.system',
				0,
				[0=>'- all -'] + (array)$clist
			],
		'D1'=>
			[
				'DT',
				'Date from',
				'default'=>$today
			],
		'D2'=>
			[
				'DT',
				'Date to'
			]
	]
	btn_text='Show'
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
		<td>Registtrations</td>
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
		<td>Bonus</td>
			<td align="right">{_z($res.BONUS.USD, $cid.USD)}</td>
			<td align="right">{_z($res.BONUS.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.BONUS.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.BONUS.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.BONUS.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.BONUS.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>Penalty</td>
			<td align="right">{_z($res.PENALTY.USD, $cid.USD)}</td>
			<td align="right">{_z($res.PENALTY.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.PENALTY.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.PENALTY.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.PENALTY.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.PENALTY.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>Add funds</td>
			<td align="right">{_z($res.CASHIN.USD, $cid.USD)}</td>
			<td align="right">{_z($res.CASHIN.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.CASHIN.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.CASHIN.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.CASHIN.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.CASHIN.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>Ref.com</td>
			<td align="right">{_z($res.REF.USD, $cid.USD)}</td>
			<td align="right">{_z($res.REF.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.REF.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.REF.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.REF.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.REF.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>Deposit</td>
			<td align="right">{_z($res.GIVE.USD, $cid.USD)}</td>
			<td align="right">{_z($res.GIVE.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.GIVE.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.GIVE.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.GIVE.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.GIVE.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>Removal</td>
			<td align="right">{_z($res.TAKE.USD, $cid.USD)}</td>
			<td align="right">{_z($res.TAKE.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.TAKE.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.TAKE.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.TAKE.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.TAKE.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>Accrual</td>
			<td align="right">{_z($res.CALCIN.USD, $cid.USD)}</td>
			<td align="right">{_z($res.CALCIN.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.CALCIN.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.CALCIN.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.CALCIN.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.CALCIN.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>Calcout</td>
			<td align="right">{_z($res.CALCOUT.USD, $cid.USD)}</td>
			<td align="right">{_z($res.CALCOUT.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.CALCOUT.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.CALCOUT.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.CALCOUT.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.CALCOUT.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>Withdraw</td>
			<td align="right">{_z($res.CASHOUT.USD, $cid.USD)}</td>
			<td align="right">{_z($res.CASHOUT.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.CASHOUT.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.CASHOUT.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.CASHOUT.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.CASHOUT.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>Deposited</td>
			<td align="right">{_z($res.DEPO.USD, $cid.USD)}</td>
			<td align="right">{_z($res.DEPO.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.DEPO.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.DEPO.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.DEPO.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.DEPO.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>incl. active now</td>
			<td align="right">{_z($res.DEPO2.USD, $cid.USD)}</td>
			<td align="right">{_z($res.DEPO2.EUR, $cid.EUR)}</td>
			<td align="right">{_z($res.DEPO2.RUB, $cid.RUB)}</td>
			<td align="right">{_z($res.DEPO2.BTC, $cid.BTC)}</td>
			<td align="right">{_z($res.DEPO2.ETH, $cid.ETH)}</td>
			<td align="right">{_z($res.DEPO2.XRP, $cid.XRP)}</td>
	</tr>
	<tr>
		<td>System profit</td>
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