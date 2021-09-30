{strip}
{include file='header.tpl' title='Top of investors'}

<h1>Top of investors</h1>

{if $list}
	<table class="FormatTable" border="1">
		<tr>
			<th>User</th>
			<th>Deposit amount</th>
		</tr>
		{foreach from=$list key=i item=r}
			{if $r.RSUM > 0}
				<tr>
					<td>{include file='_usericon.tpl' user=$r} {$r.uLogin}</td>
					<td align="right">{_z($r.RSUM, 1)}</td>
				</tr>
			{/if}
		{/foreach}
	</table>
{/if}
<br>

{include file='footer.tpl'}
{/strip}