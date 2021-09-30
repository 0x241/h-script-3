<?php

@ignore_user_abort(1);
@set_time_limit(60);
header('Connection: close');
header('Content-Length: 0');
ob_end_clean();
ob_end_flush();
flush();

$_smode = 2;
require_once('module/auth.php');

if (!$_cfg['Cron_Enabled'] or !$_oncron)
	exit;

// onCron init

$cron_time = time();
function checkCronTO()
{
	global $cron_time;
	if (abs(time() - $cron_time) > 30)
		exit;
}

$cron_ts = timeToStamp();
foreach ($_oncron as $m => $n)
	if (($n > 0) and ($_cfg['Cron_' . $m] <= $cron_ts))
		if (file_exists($f = $_GS['module_dir'] . $m . '/oncron.php'))
			if (opWriteCfg('Cron', $m, timeToStamp(time() + $n * HS2_UNIX_MINUTE), ' and Val<=?', array($cron_ts)))
			{
				@include_once($f);
				checkCronTO();
			}

?>