<?php

$_auth = 90;
require_once('module/auth.php');

$table = 'Users';
$id_field = 'uID';
$fform = 'users_filter';
	
try 
{

	if (sendedForm('', $fform))
	{
		checkFormSecurity($fform);
		
		foreach (array('uGroup', 'uLogin', 'aName', 'uMail', 'uState', 'RefLogin') as $f)
			$_SESSION[$fform][$f] = _IN($f);
		opPageReset();
		goToURL();
	}

	if (sendedForm('clear', $fform))
	{
		checkFormSecurity($fform);
		
		unset($_SESSION[$fform]);
		opPageReset();
		goToURL();
	}

	if (isset_IN('ids') and (count($ids = (array)_IN('ids')) > 0))
	{
		$ids = $db->fetchRows($db->select($table, $id_field, '?# ?i', array($id_field, $ids)), 1);
		if (count($ids) > 0)
		{
			checkFormSecurity();
			
			if (sendedForm('setgroup'))
			{
				$db->update('Users', array('uGroup' => _IN('Group')), '', '?# ?i', array($id_field, $ids));
			}
			
			if (sendedForm('del'))
			{
//				$db->delete('AddInfo', '?# ?i', array('auID', $ids));
//				$db->delete($table, '?# ?i', array($id_field, $ids));
			}
			
			showInfo();
		}
		else
			showInfo('*NoSelected');
	}

} 
catch (Exception $e) 
{
}

$flt = '1';
$fp = array();
if (isset($_SESSION[$fform]))
	foreach (array('uGroup' => 'Users.uGroup', 'uLogin' => 'Users.uLogin', 'aName' => 'aName', 'uMail' => 'Users.uMail', 'uState' => 'Users.uState', 'RefLogin' => 'U.uLogin') as $f => $b)
		if (($v = $_SESSION[$fform][$f]) != valueIf($f == 'uState', '9'))
		{
			if ($f == 'uLogin')
			{
				$flt .= ' and ((Users.uLogin=?) or (Users.uMail=?))';
				$fp[] = $v;
			}
			else
				$flt .= ' and (' . $b . valueIf(in_array($f, array('uLogin', 'aName', 'uMail')), ' ?%)' ,'=?)');
			$fp[] = $v;
		}

$list = opPageGet(_GETN('page'), 20, "$table LEFT JOIN AddInfo ON auID=uID LEFT JOIN Users U ON U.uID=Users.uRef", 
	'Users.*, AddInfo.aName, U.uLogin as RefLogin', 
	$flt, $fp, 
	array(
		$id_field => array(),
		'uGroup' => array(),
		'uLogin' => array(),
		'aName' => array(),
		'uMail' => array(),
		'uState' => array(),
		'uLevel' => array(),
		'RefLogin' => array(),
		'BalUSD' => array(),
		'BalEUR' => array(),
		'BalRUB' => array(),
		'BalBTC' => array(),
		'BalETH' => array(),
		'BalXRP' => array()
	), 
	_GET('sort'), $id_field
);
stampTableToStr($list, 'nBTS, nLTS');

$wlist = $db->fetchRows($db->select('Wallets', 'wuID, wcID, wBal', 'wuID ?i and wBal>0', array(array_keys($list))));
foreach ($wlist as $w)
	$list[$w['wuID']]['Bal' . $_currs[$w['wcID']]['cCurrID']] += $w['wBal'];

setPage('list', $list);

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
setPage('vcurrs', $vcurrs);

showPage();

?>