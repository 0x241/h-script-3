<?php

$_auth = 90;
require_once('module/auth.php');

$vcurrs = array(
	'USD' => array(),
	'EUR' => array(),
	'RUB' => array(),
	'BTC' => array(),
	'ETH' => array(),
	'XRP' => array()
);
foreach ($_currs as $cid => $c)
	$vcurrs[$c['cCurrID']][] = $cid;

try 
{

	if (sendedForm() or !$_IN)
	{
		if ($_IN)
			checkFormSecurity();
			
		$a = $_IN;
		strArrayToStamp($a, 'D1', 1);
		if ($d1 = $a['D1'])
		{
			$ud1 = " and aCTS>='$d1'";
			$od1 = " and oCTS>='$d1'";
			$dd1 = " and dCTS>='$d1'";
		}
		strArrayToStamp($a, 'D2', 2);
		if ($d2 = $a['D2'])
		{
			$ud2 = " and aCTS<='$d2'";
			$od2 = " and oCTS<='$d2'";
			$dd2 = " and dCTS<='$d2'";
		}
		$res = array();
		if ($psys = _INN('PSys'))
		{
			$focurr = " and ocID=$psys";
			$fdcurr = " and dcID=$psys";
			$curr = $_currs[$psys]['cCurrID'];
			foreach (array('BONUS', 'PENALTY', 'CASHIN', 'REF', 'GIVE', 'TAKE', 'CALCIN', 'CALCOUT', 'CASHOUT') as $o)
				$res[$o][$curr] = $db->fetch1($db->select('Opers', 'SUM(oSum)', "oOper='$o' and oState=3$focurr$od1$od2"));
	//		$res['CASHOUT2'][$curr] = $db->fetch1($db->select('Opers', 'SUM(oSum)', "oOper='CASHOUT' and oState=2$focurr$od1$od2"));
			$res['DEPO'][$curr] = $db->fetch1($db->select('Deps', 'SUM(dZD)', "1$fdcurr$dd1$dd2"));
			$res['DEPO2'][$curr] = $db->fetch1($db->select('Deps', 'SUM(dZD)', "dState=1$fdcurr$dd1$dd2"));
		}
		else
		{
			foreach ($vcurrs as $curr => $cids)
			{
				foreach (array('BONUS', 'PENALTY', 'CASHIN', 'REF', 'GIVE', 'TAKE', 'CALCIN', 'CALCOUT', 'CASHOUT') as $o)
					$res[$o][$curr] = $db->fetch1($db->select('Opers', 'SUM(oSum)', "oOper='$o' and oState=3$od1$od2 and ocID ?i", array($cids)));
		//		$res['CASHOUT2'][$curr] = $db->fetch1($db->select('Opers', 'SUM(oSum)', "oOper='CASHOUT' and oState=2$od1$od2 and ocID ?i", array($cids)));
				$res['DEPO'][$curr] = $db->fetch1($db->select('Deps', 'SUM(dZD)', "1$dd1$dd2 and dcID ?i", array($cids)));
				$res['DEPO2'][$curr] = $db->fetch1($db->select('Deps', 'SUM(dZD)', "dState=1$dd1$dd2 and dcID ?i", array($cids)));
			}
		}
		$res['REG'] = 0 + $db->count('AddInfo', "1$ud1$ud2");
		setPage('res', $res);
	}

} 
catch (Exception $e) 
{
}

setPage('users', array(
	'all' => $db->count('Users'),
	'active' => $db->count('Users', 'uState=1'),
	'wdepo' => $db->count('Users', 'uState=1 and EXISTS(SELECT dID FROM Deps WHERE duID=uID)')
));
setPage('deps', array(
	'all' => $db->count('Deps'),
	'active' => $db->count('Deps', 'dState=1')
));
setPage('currs', $_currs);
setPage('vcurrs', $vcurrs);
$stat = array();
foreach ($_currs as $cid => $c)
{
	$curr = $c['cCurrID'];
	foreach (array('BONUS', 'PENALTY', 'CASHIN', 'REF', 'GIVE', 'TAKE', 'CALCIN', 'CALCOUT', 'CASHOUT') as $o)
	{
		$stat[$cid][$o] = $db->fetch1($db->select('Opers', 'SUM(oSum)', 'oOper=? and ocID=?d and oState=3', array($o, $cid)));
		$stat[0][$curr][$o] += $stat[$cid][$o];
	}
	$stat[$cid]['GIVE2'] = $db->fetch1($db->select('Opers', 'SUM(oSum)', 'oOper=? and ocID=?d and oState=3 and (oMemo ?%)', array('GIVE', $cid, 'Auto')));
	$stat[$cid]['CASHOUT2'] = $db->fetch1($db->select('Opers', 'SUM(oSum)', 'oOper=? and ocID=?d and oState=2', array('CASHOUT', $cid)));
	$stat[$cid]['DEPO'] = $db->fetch1($db->select('Deps', 'SUM(dZD)', 'dcID=?d and dState=1', array($cid)));
	$o = $db->fetch1Row($db->select('Wallets', 'SUM(wBal) AS Z1, SUM(wLock) AS Z2, SUM(wOut) AS Z3', 'wcID=?d', array($cid)));
	$stat[$cid]['BAL'] = $o['Z1'];
	$stat[$cid]['LOCK'] = $o['Z2'];
	$stat[$cid]['OUT'] = $o['Z3'];
	foreach (array('GIVE2', 'CASHOUT2', 'DEPO', 'BAL', 'LOCK', 'OUT') as $o)
		$stat[0][$curr][$o] += $stat[$cid][$o];
}
setPage('stat', $stat);
$list = array();
foreach ($_currs as $id => $r)
	$list[$id] = $r['cName'];
setPage('clist', $list);
setPage('today', timeToStr(time(), 1));
showPage();

?>