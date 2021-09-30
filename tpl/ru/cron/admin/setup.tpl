{strip}
{include file='admin/header.tpl' title='Настройки'}

{if $_cfg.Cron_Enabled}

	<p class="info">
		Планировщик вызывается <b>при открытии каждой страницы</b>,<br>
		но срабатывает не чаще чем <b>1 раз в минуту</b>
	</p>
	<p class="info">
		Для того чтобы планировщик вызывался <b>автономно</b>,
		<br>необходимо прописать его вызов из <b>планировщика хостинга</b>:<br>
		<br>
			<i>wget -q -O /dev/null "{fullURL(moduleToLink('cron'))}" > /dev/null</i>
		<br>
			<i>curl "{fullURL(moduleToLink('cron'))}"</i>
		<br><br>или (в зависимости от настроек сервера) возможны варианты:<br><br>
			<i>/usr/bin/fetch -q -O /dev/null "{fullURL(moduleToLink('cron'))}" > /dev/null</i>
		<br>
			<i>/usr/bin/php -q {$cronpath} /dev/null</i>
		<br>
			<i>/usr/local/bin/php -q $HOME/cron.php /dev/null</i>
	</p>
	
	<a href="{fullURL(moduleToLink('cron'))}" target="_blank" class="button-green">Вызвать вручную</a><br><br>
	
{/if}

{$f = [
	'Enabled'=>['C', 'Включен'],
	'ByHost'=>['C', 'Вызывается автономно']
]}
{if $cfg.Enabled and $cronlist}
	{$f[] = 'Последние вызовы'}
	{foreach $cronlist as $m => $s}
		{$f[$m] = ['X', "Модуль $m", 'comment'=> valueIf($s < 1440, "$s мин. назад")]}
	{/foreach}
{/if}
	
{include file='edit.tpl' 
	values=$cfg
	fields=$f
}

{include file='admin/footer.tpl'}
{/strip}