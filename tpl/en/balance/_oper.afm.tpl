{if $pvalues.acc}

	{if $el.oState <= 1}
	
		<br>
		<p class="info">
			{if $pform}If you can not pay directly through the merchant,<br>{/if}
			Make a payment on the specified details manually,<br>
			and then specify the details of this payment in the form below
		</p>
		
	{/if}
	
	<h2>Our payment details<br>(to pay manually through {$el.cName})</h2>
	
	<table class="formatTable">
	{foreach from=$pfields key=f item=v}
	{if $pvalues[$f]}
		<tr>
			<td align="right">
				{$v[0] = str_replace('*', ' <span class="descr_rem">(optional)</span>', $v[0])}
				{if $f === 'acc'}
					Payee account <span class="descr_rem">({$v[0]})</span>
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
				Amount
			</td>
			<td>
				<span class="uline">{_z($el.oSum, $el.ocID, 1)}</span>
			</td>
		</tr>
	</table>
	
{/if}