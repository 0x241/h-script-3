{strip}
{include file='admin/header.tpl' title='Начисление'}

{if $_cfg.Depo_ChargeMode == 2}

	<p class="info">
		Произойдет <b>однократное</b> начисление процентов<br>
		на <b>{$cdate}</b> по всем вкладам, имеющим отмеченные планы
	</p>

	{include file='list.tpl' 
		title='Ручное начисление'
		url='*'
		fields=[
			'pID'=>['ID'],
			'pHidden'=>['Невид.'],
			'pName'=>['Наменование'],
			'pMin'=>['Мин.'],
			'pMax'=>['Макс.'],
			'pDays'=>['Длит.'],
			'pPerc'=>['<small>Процент</small>'],
			'cnt'=>['<small>Вкладов</small>']
		]
		values=$list
		row='*'
		btns=['del'=>'Начислить']
	}

	<a href="{_link module='balance/admin/opers'}" class="button-green">Операции</a><br>
	
{elseif $_cfg.Depo_ChargeMode == 1}
	
	<p class="info">
		Начисление происходит <a href="{_link module='depo/admin/setup'}">автоматически</a>
	</p>
	
{else}

	<p class="info">
		Начисление <a href="{_link module='depo/admin/setup'}">отключено</a>
	</p>

{/if}

{include file='admin/footer.tpl'}
{/strip}