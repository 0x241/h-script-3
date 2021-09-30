{strip}
{if $stats}
<table class="FormatTable" border="1">
	<tr>
		<th>Плат. система</th>
		<th><small>Рефские</small></th>
		<th><small>Введено</small></th>
		<th><small>На депозитах</small></th>
		<th><small>Начислено</small></th>
		<th><small>Выведено</small></th>
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