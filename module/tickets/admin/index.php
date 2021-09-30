<?php

$_auth = 50;
require_once('module/auth.php');

$table = 'Tickets';
$id_field = 'tID';
	
try 
{

	if (isset_IN('ids') and (count($ids = (array)_IN('ids')) > 0))
	{
		$ids = $db->fetchRows($db->select($table, $id_field, '?# ?i', array($id_field, $ids)), 1);
		if (count($ids) > 0)
		{
			checkFormSecurity();
			
			if (sendedForm('del'))
			{
				$db->delete($table, '?# ?i', array($id_field, $ids));
				$db->delete('TMsg', '?# ?i', array('mtID', $ids));
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

$list = opPageGet(_GETN('page'), 20, 
	"$table LEFT JOIN Users ON uID=tuID", 
	"$table.*, uLogin, (SELECT COUNT(*) FROM TMsg WHERE mtID=tID and muID<>?d) AS cnt, (tState<=2) AS _Marked", '', array(_uid()), 
	array(
		$id_field => array(),
		'tLTS' => array('tLTS desc', 'tLTS'),
		'uLogin' => array('uLogin', 'uLogin desc')
	), 
	_GET('sort'), $id_field
);
stampTableToStr($list, 'tTS, tLTS');

setPage('list', $list);

showPage();

?>