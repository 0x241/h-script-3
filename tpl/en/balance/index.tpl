{strip}
{include file='header.tpl' title='Balance'}

<h1>Balance</h1>

{if isset($smarty.get.fail)}

	<h2>Operation NOT complete!</h2>
	<p class="info">
		The operation was was aborted or an error occurs.<br>
		Try <a href="{$_selfLink}">again</a> later
	</p>

{else}

	{include file='balance/_bal.tpl'}
	<br><br>

	<a href="{_link module='balance/oper'}?add=CASHIN" class="button-green">Add funds</a>

	&nbsp;<a href="{_link module='balance/oper'}?add=CASHOUT" class="button-green">Withdraw</a>

	{if !$_cfg.Const_IntCurr}
		&nbsp;<a href="{_link module='balance/oper'}?add=EX" class="button-green">Exchange</a>
	{/if}

	&nbsp;<a href="{_link module='balance/oper'}?add=TR" class="button-green">Transfer</a>
	<br>

	{if $list}

		<br>
		<hr width="400px">

		{include file='balance/_statuses.tpl'}

		{include file='list.tpl' 
			title='Operations'
			url='*'
			fields=[
				'oTS'=>['Date'],
				'oOper'=>['Operation'],
				'oCID'=>['Pay.system'],
				'oSum1'=>['In'],
				'oSum2'=>['Out'],
				'oBatch'=>['Batch-number'],
				'oState'=>['State'],
				'oMemo'=>['Memo']
			]
			values=$list
			row='*'
		}
		
	{/if}

{/if}

{include file='footer.tpl'}
{/strip}