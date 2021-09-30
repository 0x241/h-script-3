{strip}
{include file='header.tpl' title='Топ'}

<h1>Лучшие рефоводы</h1>

<h2>По суммам</h2>
{if $list1}
	<table class="FormatTable" border="1">
		<tr>
			<th>Пользователь</th>
			<th>Сумма</th>
		</tr>
		{foreach from=$list1 key=i item=r}
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

<h2>По количеству</h2>
{if $list2}
	<table class="FormatTable" border="1">
		<tr>
			<th>Пользователь</th>
			<th>Кол-во</th>
		</tr>
		{foreach from=$list2 key=i item=r}
			{if $r.RCNT > 0}
				<tr>
					<td>{include file='_usericon.tpl' user=$r} {$r.uLogin}</td>
					<td align="right">{$r.RCNT}</td>
				</tr>
			{/if}
		{/foreach}
	</table>
{/if}

{include file='footer.tpl'}
{/strip}