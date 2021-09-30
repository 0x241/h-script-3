<?php

require_once('module/auth.php');
useLib('balance');

try 
{

	switch (_RQ('do'))
	{
	case 'getcurr':
		$c = $_currs[_RQ('cid')];
		echo('<small>' . textLangFilter($c['cCurr'], $_GS['lang']) . '</small>');
		break;
	case 'getsum':
		cn($_REQUEST['sum']);
		$oper = _RQ('oper');
		$cid = _RQ('cid');
		$sum = _zr(_RQ('sum'), $cid);
		$c = $_currs[$cid];
		if ($_cfg['Const_IntCurr'] and in_array($oper, array('CASHIN', 'CASHOUT')))
		{
			$zc = $_cfg['Bal_Rate' . $c['cCurrID']];
			if ($zc > 0)
			{
				if ($oper == 'CASHIN')
				{
/*					$sum2 = $sum / ($zc * (1 + $c['cEXOut'] / 100));
					$z1 = $sum2;
					$z2 = 2 * $sum2;
					
					function calcz($z)
					{
						global $_user, $cid;
						$cz = opCalcComis($cid, 'CASHIN', $z, $_user['uLevel'] >= 90);
						$z = opCalcExSum(true, $cid, $z - $cz);
						return ($z - opCalcComis($cid, 'EX', $z, $_user['uLevel'] >= 90));
					}
					
					if ((calcz($z1) <= $sum) and (calcz($z2) >= $sum))
					{
					}*/
					$cid2 = 1;
					$csum = opCalcComis($cid, 'CASHIN', $sum, $_user['uLevel'] >= 90);
					$sum -= $csum;
					$csum1 = opCalcComis($cid, 'EX', $sum, $_user['uLevel'] >= 90);
					$sum2 = opCalcExSum(true, $cid, $sum - $csum1);
				}
				else
				{
					$cid2 = $cid;
					$csum1 = opCalcComis($cid, 'EX', $sum, $_user['uLevel'] >= 90);
					$sum2 = opCalcExSum(false, $cid, $sum - $csum1);
					$csum = opCalcComis($cid, 'CASHOUT', $sum2, $_user['uLevel'] >= 90);
					$sum2 -= $csum;
				}
			}
			else
				$sum2 = 0;
		}
		elseif ($oper == 'EX')
		{
			$cid2 = _RQ('cid2');
			$csum = opCalcComis($cid, $oper, $sum, $_user['uLevel'] >= 90);
			$sum2 = opCalcEx($cid, $cid2, $sum - $csum);
		}
		else
		{
			$cid2 = $cid;
			$csum = opCalcComis($cid, $oper, $sum, $_user['uLevel'] >= 90);
			$sum2 = $sum - $csum;
		}
		$res = array(
			'<small>' . textLangFilter($c['cCurr'], $_GS['lang']) . '</small>',
			valueIf($csum > 0, _z($csum, $cid, 2), '-'),
			valueIf($sum2 > 0, _z($sum2, $cid2, 2), '-')
		);
		echo(json_encode($res));
		break;
	}

}
catch (Exception $e) 
{
}

?>