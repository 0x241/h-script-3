<?php

if ($a['mail'] and ($f = fopen('tpl_c/nt_db', 'c+')))
{
	$t = intval(fgets($f));
	if ((abs(time() - $t) >= HS2_UNIX_HOUR) and flock($f, LOCK_EX))
	{
		ftruncate($f, 0);
		rewind($f);
		fwrite($f, time());
		fclose($f);
		if (!$db->link)
			sendMail($a['mail'], $_GS['domain'] . ' database open error!', 
				$db->lastError());
		elseif ($t = $db->fetchRows($db->query('SHOW TABLES'), 1))
		{
			$t = $db->fetchRows($db->query('CHECK TABLE ?#', array($t)));
			foreach ($t as $r)
				if (strtolower($r['Msg_type']) == 'error')
				{
					sendMail($a['mail'], $_GS['domain'] . ' database corrupt!', 
						nl2br("'Check table' result:" . HS2_NL . print_r($t, true)));
					$db->close();
					break;
				}
		}
	}
	else
		fclose($f);
}

?>