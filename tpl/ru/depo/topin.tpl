{strip}
{include file='header.tpl' title='Топ вкладчиков'}

<h1>Лучшие вкладчики</h1>

{if $list}
	<table class="FormatTable" border="1">
		<tr>
			<th>Пользователь</th>
			<th>Сумма депозитов</th>
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