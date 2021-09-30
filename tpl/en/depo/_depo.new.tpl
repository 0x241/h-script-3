{strip}

{include file='edit.tpl'
	form='new'
	title_new=valueIf($from_admin, 'New deposit')
	fields=[
		'Login'=>$smarty.get.user,
		'User'=>
			[
				'X',
				'User',
				0,
				$smarty.get.user,
				'skip'=>!$from_admin
			],
		'Bal'=>
			[
				'U',
				'balance/bal.tpl',
				'skip'=>!$from_admin and $_cfg.Const_IntCurr
			],
		'PSys'=>valueIf(!$from_admin and $_cfg.Const_IntCurr, 1,
			[
				'S', 
				'Payment system!!',
				[
					'psys_empty'=>'select pay.system',
					'psys_wrong'=>'wrong pay.system'
				],
				valueIf(count((array)$clist) > 1, [0=>'- select -'], []) + (array)$clist
			]),
		'Sum'=>
			[
				'$',
				'Amount!!',
				[
					'sum_empty'=>'input amount',
					'sum_wrong'=>'wrong amount'
				],
				'comment'=>' <i><span id="ccurr"></span></i>'
			],
		'Plan'=>
			[
				'S', 
				'Plan',
				[
					'plan_wrong'=>'wrong plan'
				],
				[0=>'- auto -'] + (array)$plans,
				'skip'=>(count($plans) <= 1)
			],
		'Compnd'=>
			[
				'%',
				'Compaund',
				[
					'compnd_wrong'=>"wrong value [$cmin..$cmax]",
					'compnd_wrong1'=>"wrong value for plan '$cplan'"
				],
				'skip'=>!$pcmax
			]
	]
	values=$el
	errors=[
		'oper_disabled'=>'operation disabled',
		'low_bal1'=>'insufficient funds'
	]
}
	
<script type="text/javascript">
	function updateCurr()
	{
		$('#ccurr').html('');
		$.ajax(
			{
				type: 'POST',
				url: 'ajax',
				data: 'module=balance&do=getcurr'+
					'&cid='+$('#new_PSys').val(),
				success: 
					function(ex)
					{
						$('#ccurr').html(ex);
					}
			}
		);
	}
	$('#new_PSys').change(updateCurr);
	updateCurr();
</script>

{/strip}