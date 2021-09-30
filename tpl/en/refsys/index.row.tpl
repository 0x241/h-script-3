{strip}
<td>
	{$l.uLogin}
</td>
<td>
	{$l.uMail}
</td>
<td class="nowrap">
	<small>{$l.aCTS}</small>
</td>
{foreach $vcurrs as $curr => $cids}
	{if (!in_array($curr,$ccurs))}
		{continue}
	{/if}
<td align="right">
	{_z($list2[$curr][$l.uID]['ZDepo'], $cid[$curr])}
</td>
{/foreach}
{foreach $vcurrs as $curr => $cids}
	{if (!in_array($curr,$ccurs))}
		{continue}
	{/if}
<td align="right">
	{_z($list2[$curr][$l.uID]['ZRef'], $cid[$curr])}
</td>
{/foreach}
{/strip}