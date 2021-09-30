{strip}
{include file='admin/header.tpl' title='Online keeper'}

This is an online version of h-keeper. Desktop version with full functional you can download at <a href="http://h-keeper.net">h-keeper.net</a>
<br><br>

{if $list}

	<table class="Table" border="1">
	<tr>
		<th>
			Payment system
		<th>
			Balance
		<th>
			Result
	{foreach $list as $cid => $l}
	<tr>
		<td>
			{$l.cName}
		<td>
			{_z($l.balance.sum, $cid, 1)}
		<td>
			{$l.balance.result}
	{/foreach}
	</table>

	<h1>Payment transaction</h1>

	{if isset($smarty.get.batch)}

		<p class="info">
			Transaction complete. Batch: {$smarty.get.batch}
		</p>

	{/if}

	{include file='edit.tpl'
		url='*'
		fields=[
			'PSys'=>['S', 'Payment system!!', ['psys_empty'=>'select pay.system'], [0=>'- select -'] + (array)$clist],
			'Sum'=>['$', 'Amount!!', ['sum_wrong'=>'amount wrong']],
			'To'=>['T', 'Payee wallet!!', ['wallet_empty'=>'enter wallet']],
			'Memo'=>['W', 'Memo', 'size'=>4]
		]
		btn_text=' '
		btns=['send' => 'Send']
	}

{else}

	No payment systems with API

{/if}

{include file='admin/footer.tpl'}
{/strip}