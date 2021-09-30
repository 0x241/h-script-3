<?php

$_auth = 1;
require_once('module/auth.php');

$table = 'Deps';
$id_field = 'dID';
$uid_field = 'duID';
$out_link = moduleToLink('depo');

try 
{

	if (sendedForm('', 'new')) 
	{
		checkFormSecurity('new');

		cn($_IN['Sum']);		
		if ($_cfg['Const_IntCurr'])
			$_IN['PSys'] = 1;
		setError($id = opDepoCreate(_uid(), _INN('PSys'), _IN('Sum'), _IN('Compnd'), _INN('Plan'), true), 'new');
		showInfo('Completed', moduleToLink() . "?id=$id");
	}

	if (sendedForm('chg'))
	{
		checkFormSecurity();
		
		setError(opDepoChangeCompnd(_uid(), $id = _INN($id_field), _IN('Compnd')));
		showInfo('Completed', moduleToLink() . "?id=$id");
	}
	
	if (sendedForm('add'))
	{
		checkFormSecurity();
		
		cn($_IN['Sum']);		
		setError(opDepoAdd(_uid(), _INN('dcID'), _IN('Sum'), $id = _INN($id_field)));
		showInfo('Completed', moduleToLink() . "?id=$id");
	}
	if (sendedForm('sub'))
	{
		checkFormSecurity();
		
		cn($_IN['Sum']);		
		setError(opDepoSub(_uid(), _INN('dcID'), _IN('Sum'), $id = _INN($id_field)));
		showInfo('Completed', moduleToLink() . "?id=$id");
	}

} 
catch (Exception $e) 
{
}

if (!isset($_GET['add']))
{
	if (_GETN('id'))
		$el = $db->fetch1Row($db->select("$table LEFT JOIN Currs ON cID=dcID LEFT JOIN Plans ON pID=dpID", 
			'*', "$id_field=?d and $uid_field=?d", array(_GETN('id'), _uid())));
	if (!$el)
		goToURL(moduleToLink() . '?add');
	//--calculte next time accrual, if weekend
	$nc = $el['pNoCalc'] ;
	$t = stampToTime($el['dNTS']);
	if (!$nc and $el['pWDays'] and ($el['pPer'] <= 24) and ($el['dState']==1))
	{
		useLib('calendar');
		while (getDayType($t) > 1)	{$t += $el['pPer'] * HS2_UNIX_HOUR;}
		$el['dNTS']=timeToStamp($t);
	}//--
	stampArrayToStr($el, 'dCTS, dLTS, dNTS', 0);
	setPage('el', $el, 3);
	setPage('currs', $_currs);
}
else
{
	if (!$_cfg['Const_IntCurr'])
	{
		setPage('currs', $_currs);
		$list = array();
		foreach ($_currs as $id => $r)
			if ($r['wBal'] > 0)
				$list[$id] = $r['cName'];
		if (!$list)
			showInfo('*CantComplete', $out_link);
		setPage('clist', $list);
	}
	$plans = opDepoGetPlanList(_uid());
	$pl = array();
	$cmax = 0;
	foreach ($plans as $pid => $p)
		if (!$p['Disabled'])
		{
			$pl[$pid] = $p['pName'];
			if ($p['pCompndMax'] > $cmax)
				$cmax = $p['pCompndMax'];
		}
	if (!$pl)
		showInfo('*CantComplete', $out_link);
	setPage('plans', $pl);
	setPage('pcmax', $cmax);
}

showPage();

?>