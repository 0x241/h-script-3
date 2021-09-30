{strip}
{include file='admin/header.tpl' title='User'}

{include file='account/admin/_statuses.tpl'}

{if $el}
	<h2>User '{$el.aName}'</h2>
	<a href="{_link module='account/admin/user2'}?id={$el.uID}" class="button-gray">Additional</a>
	<br><br>
{else}
	<h2>New user</h2>
{/if}

{$txt_login=valueIf($_cfg.Const_NoLogins, 'e-mail', 'login')}
{include file='edit.tpl'
	fields=[
		'uID'=>[],
		'uGroup'=>
			[
				'T', 
				'Group',
				'skip'=>!$el
				
			],
		'uLogin'=>
			[
				'T', 
				'Login!!',
				[
					'login_empty'=>'input login',
					'login_short'=>"username is too short [not less $MinLogin]",
					'login_wrong'=>'login can not contain a space',
					'login_used'=>'login is already in use'
				],
				'skip'=>($_cfg.Const_NoLogins)
			],
		'uMail'=>
			[
				'T',
				'e-mail!!',
				[
					'mail_empty'=>'input e-mail',
					'mail_wrong'=>'wrong e-mail',
					'mail_used'=>'e-mail is already in use'
				]
			],
		'uPass'=>
			[
				'*',
				valueIf(!$el, 'Password!!', 'Password'),
				[
					'pass_empty'=>'input password',
					'pass_short'=>"password is too short [not less $MinPass]",
					'pass_wrong'=>'password does not match format'
				]
			],
		'uPIN'=>
			[
				'*',
				valueIf(!$el, 'PIN-code!!', 'PIN-code'),
				[
					'pin_empty'=>'input PIN-code',
					'pin_short'=>"PIN-code is too short [not less $MinPass]",
					'pin_wrong'=>'PIN-code does not match format'
				],
				'skip'=>($_cfg.Sec_MinPIN == 0) or !$el
			],
		'uState'=>
			[
				'S',
				'State',
				0,
				$usr_statuses,
				'skip'=>!$el
			],
		'uBTS'=>
			[
				'DT', 
				'Banned till',
				[
					'bdate_empty'=>'input date'
				],
				'skip'=>!$el
			],
		'uLevel'=>
			[
				'I', 
				'Access level',
				[
					'lvl_wrong'=>'wrong value'
				],
				'size'=>3,
				'skip'=>!$el
			],
		'uRef'=>
			[
				'T',
				"Inviter{if $_cfg.Account_RegMode == 2}!!{/if}",
				[
					'ref_empty'=>"input $txt_login",
					'ref_not_found'=>"$txt_login not found",
					'ref_is_self'=>'wrong value'
				],
				'skip'=>(($_cfg.Account_RegMode == 3) or !$_cfg.Ref_Word or !$el)
			],
		'uBal'=>
			[
				'X',
				'Balance <<summary by all pay.systems>>',
				0,
				_z($el.uBal, 1),
				'skip'=>!$el
			],
		'Bal'=>
			[
				'U',
				'balance/bal.tpl',
				'skip'=>!$el
			],
		'uWDDisable'=>['C', 'Disable withdraw'],
		'uLang'=>
			[
				'S',
				'Language',
				0,
				$langs,
				'skip'=>!$el
			],
		'uMode'=>
			[
				'T',
				'Skin',
				'size'=>8,
				'skip'=>!$el
			],
		'uTheme'=>
			[
				'T',
				'Theme',
				'size'=>8,
				'skip'=>!$el
			],
		'Act'=>
			[
				'X',
				'Last activity',
				0,
				"{$el.uLTS} <small>(IP {$el.uLIP} {include file='_country.tpl' ip=$el.uLIP})</small>",
				'skip'=>!$el.uLTS
			]
	]
	values=$el
}

{if $el}
	<br>
	<a href="{_link module='balance/admin/opers'}?user={$el.uLogin}" class="button-green">All user operations</a>&nbsp;
	<a href="{_link module='message/admin/message'}?add&to={$el.uLogin}" class="button-green">Send a message to the user</a>&nbsp;
	<a href="{_link module='account/admin/user'}?id={$el.uID}&login" class="button-green">Login as user</a><br>
{/if}
{include file='admin/footer.tpl'}
{/strip}