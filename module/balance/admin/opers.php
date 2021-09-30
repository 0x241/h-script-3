<?php

$_auth = 70;
require_once('module/auth.php');

$table = 'Opers';
$id_field = 'oID';
$fform = 'opers_filter';
	
try 
{

	if (sendedForm('', $fform))
	{
		checkFormSecurity($fform);
		
		foreach (array('uLogin', 'oOper', 'ocID', 'oBatch', 'oState', 'oMemo') as $f)
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
			
			if (sendedForm('complete'))
			{
				foreach ($ids as $id)
					opOperComplete(0, $id, array(), true);
			}
			
			if (sendedForm('confirm'))
			{
				foreach ($ids as $id)
				if ($o = $db->fetch1Row($db->select('Opers', '*', '(oID=?d) and (oState<3) and (oOper=? or oOper=?)', array($id, 'CASHIN', 'CASHOUT'))))
				{
					$p = strToArray($o['oParams2']);
					if (!$p['date'])
						$p['date'] = timeToStamp();
					if (!$p['batch'])
						$p['batch'] = 'M' . str_pad($id, 6, '0', STR_PAD_LEFT);
					$db->update('Opers', array('oParams2' => arrayToStr($p)), '', 'oID=?d', array($id));
					  if ($o['oState'] < 2)
						opOperConfirm($o['ouID'], $id, array(), true);
						opOperComplete($o['ouID'], $id, array(), true);
				}
			}
			
			if (sendedForm('cancel'))
			{
				foreach ($ids as $id)
					opOperCancel(0, $id, array(), true);
			}
			
			if (sendedForm('del'))
			{
				$db->delete($table, '(oState >= 4) and (?# ?i)', array($id_field, $ids));
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

if ($user = $_GET['user'])
{
	$flt = 'uLogin=?';
	$fp = array($user);
	setPage('linkparams', "&user=$user");
}
else
{
	$flt = '1';
	$fp = array();
	if (isset($_SESSION[$fform]))
		foreach (array('uLogin' => '', 'oOper' => '0', 'ocID' => '0', 'oBatch' => '', 'oState' => '9', 'oMemo' => '') as $f => $v0)
			if (($v = $_SESSION[$fform][$f]) != $v0)
			{
				if ($f == 'uLogin')
				{
					$flt .= ' and ((Users.uLogin=?) or (Users.uMail=?))';
					$fp[] = $v;
				}
				else
					$flt .= ' and (' . $f . valueIf($f == 'oMemo', ' ?%)' ,'=?)');
				$fp[] = $v;
			}
}

$list = opPageGet(_GETN('page'), 20,
	"$table LEFT JOIN Users on uID=ouID LEFT JOIN Currs on cID=ocID",
	"$table.*, uLogin, cName, cCurr, (oState=2) AS _Marked", 
	$flt, $fp,
	array(
		$id_field => array(),
		'uLogin' => array('uLogin', 'uLogin desc'),
		'oTS' => array('oCTS desc', 'oCTS', 'oTS desc', 'oTS')
	), 
	_GET('sort'), $id_field
);
stampTableToStr($list, 'oCTS, oTS');
foreach ($list as $id => $r)
{
	$list[$id]['oParams'] = strToArray($r['oParams']);
	$list[$id]['oParams2'] = strToArray($r['oParams2']);
}

setPage('list', $list);

$currs = array();
foreach ($_currs as $id => $c)
	$currs[$id] = $c['cName'];
setPage('currs', $currs);

showPage();

?>