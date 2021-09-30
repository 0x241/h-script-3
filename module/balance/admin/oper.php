<?php

$_auth = 71;
require_once('module/auth.php');
require_once('lib/psys.php');

useLib('balance');

$table = 'Opers';
$id_field = 'oID';
$out_link = moduleToLink('balance/admin/opers');

try 
{

	if (sendedForm('', 'add'))
	{
		checkFormSecurity('add');

		if (!_IN('Oper'))
			setError('oper_empty', 'add');
		$uid = $db->fetch1($db->select('Users', 'uID', 'uLogin=? and (uState=1 or uState=2)', array(_IN('Login'))));
		if (!$uid)
			setError('user_empty', 'add');
		if (!isset_IN('PSys'))
			goToURL(moduleToLink() . '?add=' . _IN('Oper') . '&user=' . _IN('Login'));
		cn($_IN['Sum']);
		$a = array(
			'uid2' => $db->fetch1($db->select('Users', 'uID', 'uLogin=?', array(_IN('Login2')))),
			'cid2' => _IN('PSys2'),
			'pid' => _IN('Plan')
		);
		if ((_IN('Oper') == 'CALCIN') and (_INN('PSys') < 0))
		{
			$d = $db->fetch1Row($db->select('Deps LEFT JOIN Plans ON pID=dpID LEFT JOIN Users ON uID=duID', '*', 
				'duID=?d and dState=1 and (dNPer<pNPer or pNPer=0)', array($uid)));
			useLib('depo');
			setError(opDepoCharge($d, -1, false, true));
		}
		else
			setError($id = opOperCreate($uid, _IN('Oper'), _INN('PSys'), _IN('Sum'), $a, _IN('Memo'), false, true), 'add');
		showInfo('Added', moduleToLink() . "?id=$id");
	}

	if (sendedForm('', 'data'))
	{
		checkFormSecurity('data');

		if ($o = $db->fetch1Row($db->select('Opers LEFT JOIN Currs on cID=ocID', '*',
			"$id_field=?d and oState<=2", array(_INN('oID')))))
		{
			$a = array(
				'date' => timeToStamp(textToTime(_IN('date'))),
				'batch' => strip_tags(_IN('batch')),
				'memo' => _IN('memo')
			);
			if (!$a['date'] or (stampToTime($a['date']) >= time()))
				setError('data_date_wrong', 'data');
			if (!$a['batch'])
				setError('data_batch_wrong', 'data');
			setError($a = opEditToCurrParams(getPayFields($o['cCID']), $a, $_IN), 'data');
			$db->update('Opers', array('oBatch' => valueIf($o['oState'] == 2, '?' . $a['batch']), 'oParams2' => arrayToStr($a)), '', 'oID=?d', array($o['oID']));
			showInfo('Saved');
		}
		showInfo('*Error');
	}
	
	if ($id = _INN($id_field))
	{
		checkFormSecurity();
		
		if ($o = $db->fetch1Row($db->select('Opers', '*', "$id_field=?d", array($id))))
		{
			if (sendedForm('del') and ($o['oState'] >= 4))
			{
				$db->delete('Opers', 'oID=?d', array($id));
				showInfo('Deleted', $out_link);
			}
			elseif (sendedForm('cancel') and ($o['oState'] <= 2))
			{
				if (opOperCancel($o['ouID'], $id, array(), true) === true)
					showInfo('Canceled');
			}
			elseif (sendedForm() and ($o['oState'] <= 2))
			{
				if ($o['oState'] < 2)
					setError(opOperConfirm($o['ouID'], $id, array(), true));
				setError(opOperComplete($o['ouID'], $id, array(), true, (array)_IN('API')));
				showInfo();
			}
		}
		showInfo('*Error');
	}
	
} 
catch (Exception $e) 
{
}

if (!isset($_GET['add']))
{
	if ($id = _GETN('id'))
		$el = $db->fetch1Row($db->select("$table LEFT JOIN Users on uID=ouID LEFT JOIN Currs on cID=ocID", '*', "$id_field=?d", array($id)));
	if (!$el)
		goToURL($out_link);
	stampArrayToStr($el, 'oCTS, oTS, oNTS');
	$el['oParams'] = strToArray($el['oParams']);
	$el['oParams2'] = strToArray($el['oParams2']);
	stampArrayToStr($el['oParams2'], 'date', 1);
	setPage('el', $el);
	if ((($el['oOper'] == 'CASHIN') or ($is_out = ($el['oOper'] == 'CASHOUT'))) and ($el['oState'] <= 2))
	{
		$c = getCIDs($el['cCID']);
		if ($a = opCurrParamsToEdit(getPayFields($el['cCID'])))
			setPage('dfields', array(1 => '') + $a, 1);
		if (!$c[2 + $is_out])
			setPage('defaultbatch', valueIf($is_out, 'OUT', 'IN') . str_pad($el['oID'], 6, '0', STR_PAD_LEFT));
		opDecodeCurrParams($el, $p, $p, $p);
		if ($is_out and $c[3] and !$p['apipass'])
			if ($a = opCurrParamsToEdit(getAPIFields($el['cCID']), 'API'))
				setPage('afields', array(1 => '') + $a, 1);
	}
}
else
{
	if ($oper = _GET('add'))
	{
		$uid = $db->fetch1($db->select('Users', 'uID', 'uLogin=? and (uState=1 or uState=2)', array(_GET('user'))));
		if (!$uid)
			goToURL(moduleToLink() . '?add');
		setPage('currs', $db->fetchIDRows($db->select('Currs LEFT JOIN Wallets ON wcID=cID and wuID=?d', 
		'*', 'cDisabled=0', array($uid), 'cID'), false, 'cID'));
	}
	$list = array();
	foreach ($_currs as $id => $r)
		if (($id > 1) or !in_array(_GET('add'), array('CASHIN', 'CASHOUT')))
			$list[$id] = $r['cName'];
	if ($oper == 'CALCIN')
	{
		if ($dlist = $db->fetchRows($db->select('Deps LEFT JOIN Plans ON pID=dpID', '*', 'duID=?d and dState=1', array($uid), 'dID')))
		{
			foreach ($dlist as $d)
				$list[-$d['dID']] = '#' . $d['dID'] . ' [' . textLangFilter($d['pName'], $_GS['lang']) . '] - ' . _z($d['dZD'], $d['dcID']) . ' ' . $_currs[$d['dcID']]['cCurr'] . ' ' . $_currs[$d['dcID']]['cName'];
		}
	}
	setPage('clist', $list);
}

showPage();

?>