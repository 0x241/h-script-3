{strip}
{include file='admin/header.tpl' title='Settings'}

{if $_cfg.Cron_Enabled}

	<p class="info">
		The scheduler is called <b>at the opening of each page</b>,<br>
		but can not occur more than once per <b>1 minute</b>
	</p>
	<p class="info">
		In order for the scheduler was called <b>standalone</b>,
		<br>it is necessary to register the call in hosting panel (cron jobs)</b>:<br>
		<br>
			<i>wget -q -O /dev/null "{fullURL(moduleToLink('cron'))}" > /dev/null</i>
		<br>
			<i>curl "{fullURL(moduleToLink('cron'))}"</i>
		<br><br>or(depends on hosting settings) there is can be variants:<br><br>
			<i>/usr/bin/fetch -q -O /dev/null "{fullURL(moduleToLink('cron'))}" > /dev/null</i>
		<br>
			<i>/usr/bin/php -q {$cronpath} /dev/null</i>
		<br>
			<i>/usr/local/bin/php -q $HOME/cron.php /dev/null</i>
	</p>
	
	<a href="{fullURL(moduleToLink('cron'))}" target="_blank" class="button-green">Call manually</a><br><br>
	
{/if}

{$f = [
	'Enabled'=>['C', 'Enabled'],
	'ByHost'=>['C', 'Called standalone']
]}
{if $cfg.Enabled and $cronlist}
	{$f[] = 'Last calls'}
	{foreach $cronlist as $m => $s}
		{$f[$m] = ['X', "Module $m", 'comment'=> valueIf($s < 1440, "$s min. ago")]}
	{/foreach}
{/if}
	
{include file='edit.tpl' 
	values=$cfg
	fields=$f
}

{include file='admin/footer.tpl'}
{/strip}