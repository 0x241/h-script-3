{strip}
{include file='header.tpl' title='Платежные реквизиты'}

<h1>Платежные реквизиты</h1>

{if !$wfields}

	<p class="info">
		Платежные системы не подключены
	</p>

{else}

	{if $_cfg.Const_IntCurr}
		{$wfields = [
			'DefCurr'=>[
				'S',
				'Платежная система по умолчанию!!',
				[
					'psys_wrong'=>'укажите плат.систему'
				],
				[0=>'- выберите -'] + (array)$defcurr,
				'default'=>$user['aDefCurr']
			]
		]+$wfields}
	{/if}

	{if $showbutton and ($_cfg.Sec_MinPIN > 0)}
		{$wfields[] = ''}
		{$wfields['PIN'] = [
						'*',
						'Введите PIN-код!! <<чтобы подтвердить изменения>>',
						[
							'pin_wrong'=>'неверный код'
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