{strip}
<td class="nowrap">
	<small>{$l.oCTS}</small>
	<br>
	<small>{$l.oTS}</small>
</td>
<td>
	<a href="{_link module='balance/oper'}?id={$l.oID}">
	{if $l.oNTS}
		<b>{$op_names[$l.oOper]}</b>
	{else}
		{$op_names[$l.oOper]}
	{/if}
	</a>
</td>
<td>
	{$l.cName}
</td>
<td align="right">
	{if in_array($l.oOper, array('BONUS', 'CASHIN', 'EXIN', 'TRIN', 'SELL', 'REF', 'TAKE', 'CALCIN'))}
		{_z($l.oSum, $l.ocID, -1)}
		{if $l.oComis != 0}
			<br>
			<sup>{_z($l.oComis, $l.ocID, -1)}</sup>
		{/if}
	{/if}
</td>
<td align="right">
	{if in_array($l.oOper, array('PENALTY', 'CASHOUT', 'EX', 'TR', 'BUY', 'GIVE', 'CALCOUT'))}
		<span style="color: red;">{_z($l.oSum, $l.ocID, -1)}</span>
		{if $l.oComis != 0}
			<br>
			<sup>{_z($l.oComis, $l.ocID, -1)}</sup>
		{/if}
	{/if}
</td>
<td>
	{$l.oBatch}
</td>
<td class="nowrap">
	<a href="{_link module='balance/oper'}?id={$l.oID}">
	{if $l.oNTS}
		<b>{$op_statuses[$l.oState]}</b>
	{else}
		{$op_statuses[$l.oState]}
	{/if}
	</a>
	{if $l.oNTS}
		<br>
		<small>{$l.oNTS}</small>
	{/if}
</td>
<td>
	{if $l.oParams.user}<i>{$l.oParams.user}</i> {/if}
	<small>
		{if $l.oMemo[0] == '~'}
			Ошибка
		{else}
			{$l.oMemo}
		{/if}
	</small>
</td>
{/strip}