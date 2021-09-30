<?php

$_auth = 1;
require_once('module/auth.php');

$table = 'Opers';
$id_field = 'oID';
$uid_field = 'ouID';

try 
{
} 
catch (Exception $e) 
{
}

setPage('currs', $_currs);

$list = opPageGet(_GETN('page'), 10, "$table LEFT JOIN Users on uID=ouID LEFT JOIN Currs on cID=ocID",
	"$table.*, uLogin, cName, cCurr, (oNTS>0) AS _Marked",
	"$uid_field=?d", array(_uid()),
	array(
		'oTS' => array('oID desc', 'oID'),
		'oState' => array()
	), 
	_GET('sort'), $id_field
);
stampTableToStr($list, 'oCTS, oTS, oNTS');
foreach ($list as $id => $r)
	$list[$id]['oParams'] = strToArray($r['oParams']);
setPage('list', $list);

showPage();

?>