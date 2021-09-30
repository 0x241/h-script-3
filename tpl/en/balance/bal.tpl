{strip}
{if $currs}
<table class="FormatTable" border="1">
	<tr>
		<th>Payment system</th>
		<th><small>Available</small></th>
		<th><small>Busy</small></th>
		<th><small>Pending</small></th>
	</tr>
{foreach from=$currs key=i item=c}
{if ($c.wBal != 0) or ($c.wLock != 0) or ($c.wOut != 0)}
	<tr>
		<td>{$c.cName} <i><small>{$c.cCurr}</small></i></td>
		<td align="right">{_z($c.wBal, $c.wcID, -1)}</td>
		<td align="right">{_z($c.wLock, $c.wcID, -1)}</td>
		<td align="right">{_z($c.wOut, $c.wcID, -1)}</td>
	</tr>
{/if}
{/foreach}
</table>
{/if}
{/strip}
