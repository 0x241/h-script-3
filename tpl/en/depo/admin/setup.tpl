{strip}
{include file='admin/header.tpl' title='Settings'}

{if ($_cfg.Depo_ChargeMode == 1) and !$_cfg.Cron_Enabled}

	<p class="info">
		For automatic accruals <a href="{_link module='cron/admin/setup'}">Scheduler</a> must be <b>enabled</b>
	</p>
	
{/if}

{include file='edit.tpl' 
	values=$cfg
	fields=[
		'OneFromGroup'=>['C', 'Avalible only one plan from group'],
		'AutoDepo'=>['C', 'Automatically make deposit after add funds'],
		'Interval'=>['I', 'Activate deposits are not more than 1 time in N minutes<br><<0 - no limits>>'],
		'LastTime'=>['X', 'Activation date of the last deposit', 0, $depolasttime, 'comment'=>valueIf($depolast < 0, "after {-$depolast} min.", "$depolast min. ago"), 'skip'=>(abs($depolast) >= 60)],
		'ChargeMode'=>['S', 'Accruals', 0, [0=>'off', 1=>'each in its time (automatic)', 2=>'all at the same time (manual)']],
		1=>'Manual accruals',
		'ManualPeriod'=>['S', 'Accrual once in', 0, [0=>'day', 1=>'week', 2=>'month']],
		'ManualDay'=>['I', 'Day number <<1..7>> or month <<1..31>>', 'comment'=>'0 = last day'],
		'Calculator',
		'_Compnd'=>['A', 'Reinvest percs', 'size'=>5],
		'Statistics',
		'ShowStat'=>['C', 'Show statistics'],
		'S0'=>['DT', 'Date and time stamp of start <<YYYYMMDDhhmmss>>', 'comment'=>20130924130000],
		'S1'=>['I', 'Total users'],
		'S2'=>['$', 'Total add funds'],
		'S3'=>['$', 'Total withdraws'],
		'S4'=>['$', 'including RCB'],
		'S5'=>['$', 'Reinvested'],
		'S6'=>['I', 'Active deposits'],
		'S7'=>['I', 'Closed deposits'],
		'S8'=>['$', 'New add funds <<amount>>'],
		'S9'=>['T', 'New add funds <<user>>'],
		'S11'=>['$', 'Last payout <<amount>>'],
		'S12'=>['T', 'Last payout <<user>>']
	]
}
	
{include file='admin/footer.tpl'}
{/strip}