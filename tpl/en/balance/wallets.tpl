{strip}
{include file='header.tpl' title='Payment details'}

<h1>Payment details</h1>

{if !$wfields}

	<p class="info">
		Payment systems are not connected
	</p>

{else}

	{if $_cfg.Const_IntCurr}
		{$wfields = [
			'DefCurr'=>[
				'S',
				'Default payment system!!',
				[
					'psys_wrong'=>'input pay.system'
				],
				[0=>'- select -'] + (array)$defcurr,
				'default'=>$user['aDefCurr']
			]
		]+$wfields}
	{/if}

	{if $showbutton and ($_cfg.Sec_MinPIN > 0)}
		{$wfields[] = ''}
		{$wfields['PIN'] = [
						'*',
						'Input PIN-code!! <<to confirm changes>>',
						[
							'pin_wrong'=>'wrong code'
						],
						'size'=>8
					]}
	{/if}
	
	{include file='edit.tpl'
		url='*'
		fields=$wfields
		values=$wdata
		btn_text=valueIf(!$showbutton, ' ')
	}
	
{/if}

{include file='footer.tpl'}
{/strip}