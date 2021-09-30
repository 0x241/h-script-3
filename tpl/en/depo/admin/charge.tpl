{strip}
{include file='admin/header.tpl' title='Manual accruals'}

{if $_cfg.Depo_ChargeMode == 2}

	<p class="info">
		There will be <b>single</b> interest accrual<br>
		at the {$cdate} on all deposits that have marked plans
	</p>

	{include file='list.tpl' 
		title='Manual accrual'
		url='*'
		fields=[
			'pID'=>['ID'],
			'pHidden'=>['Hidden'],
			'pName'=>['Plan'],
			'pMin'=>['Min'],
			'pMax'=>['Max'],
			'pDays'=>['Dur.'],
			'pPerc'=>['<small>Perc.</small>'],
			'cnt'=>['<small>Deposits</small>']
		]
		values=$list
		row='*'
		btns=['del'=>'Make accrual']
	}

	<a href="{_link module='balance/admin/opers'}" class="button-green">Operations</a><br>
	
{elseif $_cfg.Depo_ChargeMode == 1}
	
	<p class="info">
		Accrual occurs <a href="{_link module='depo/admin/setup'}">automatically</a>
	</p>
	
{else}

	<p class="info">
		Accruals are <a href="{_link module='depo/admin/setup'}">disabled</a>
	</p>

{/if}

{include file='admin/footer.tpl'}
{/strip}