{strip}
<td>
	{$l.uID}
</td>
<td>
	{$l.uGroup}
</td>
<td>
	<a href="{_link module='account/admin/user'}?id={$l.uID}">{$l.uLogin}</a>
</td>
<td>
	<a href="{_link module='account/admin/user2'}?id={$l.uID}">{$l.aName}</a>
</td>
<td>
	<a href="{_link module='account/admin/user'}?id={$l.uID}">{$l.uMail}</a>
</td>
<td>
	{$usr_statuses[$l.uState]}
</td>
<td>
	{$l.uLevel}
</td>
<td>
	<a href="{_link module='account/admin/user'}?id={$l.uRef}">{$l.RefLogin}</a>
</td>
<td align="right">
	{_z($l.BalUSD, $cid.USD)}
</td>                          
<td align="right">             
	{_z($l.BalEUR, $cid.EUR)}
</td>                          
<td align="right">             
	{_z($l.BalRUB, $cid.RUB)}
</td>                          
<td align="right">             
	{_z($l.BalBTC, $cid.BTC)}
</td>                          
<td align="right">             
	{_z($l.BalETH, $cid.ETH)}
</td>
<td align="right">             
	{_z($l.BalXRP, $cid.XRP)}
</td>
{/strip}