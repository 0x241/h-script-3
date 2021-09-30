{strip}
{if $stats}
<table class="FormatTable" border="1">
	<tr>
		<th>Pay. system</th>
		<th><small>Referral</small></th>
		<th><small>Added</small></th>
		<th><small>Deposited</small></th>
		<th><small>Accrued</small></th>
		<th><small>Withdrawal</small></th>
	</tr>
{foreach from=$stats key=i item=c}
	<tr>
		<td>{$c.cName} <i><small>{$c.cCurr}</small></i></td>
		<td align="right">{_z($c.ZREF, $c.cID, -1)}</td>
		<td align="right">{_z($c.ZIN, $c.cID, -1)}</td>
		<td align="right">{_z($c.ZINDEPO, $c.cID, -1)}</td>
		<td align="right">{_z($c.ZCALCIN, $c.cID, -1)}</td>
		<td align="right">{_z($c.ZOUT, $c.cID, -1)}</td>
	</tr>
{/foreach}
</table>
{/if}
{/strip}