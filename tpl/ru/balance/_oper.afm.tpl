{if $pvalues.acc}

	{if $el.oState <= 1}
	
		<br>
		<p class="info">
			{if $pform}В случае невозможности оплатить напрямую через сайт,<br>{/if}
			Совершите оплату по указанным реквизитам вручную,<br>
			а затем укажите данные этого платежа в форме ниже
		</p>
		
	{/if}
	
	<h2>Платежные реквизиты<br>(для оплаты вручную через {$el.cName})</h2>
	
	<table class="formatTable">
	{foreach from=$pfields key=f item=v}
	{if $pvalues[$f]}
		<tr>
			<td align="right">
				{$v[0] = str_replace('*', ' <span class="descr_rem">(не обязательно)</span>', $v[0])}
				{if $f === 'acc'}
					Наш кошелек <span class="descr_rem">({$v[0]})</span>
				{else}
					{$v[0]}
				{/if}
			</td>
			<td>
				<span class="uline">{$pvalues[$f]}</span>
			</td>
		</tr>
	{/if}
	{/foreach}
		<tr>
			<td align="right">
				Сумма
			</td>
			<td>
				<span class="uline">{_z($el.oSum, $el.ocID, 1)}</span>
			</td>
		</tr>
	</table>
	
{/if}