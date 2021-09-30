{strip}
{include file='admin/header.tpl' title='Пользователь'}

{include file='account/admin/_statuses.tpl'}

{if $el}
	<h2>Пользователь '{$el.aName}'</h2>
	<a href="{_link module='account/admin/user2'}?id={$el.uID}" class="button-gray">Дополнительные параметры</a>
	<br><br>
{else}
	<h2>Новый пользователь</h2>
{/if}

{$txt_login=valueIf($_cfg.Const_NoLogins, 'e-mail', 'логин')}
{include file='edit.tpl'
	fields=[
		'uID'=>[],
		'uGroup'=>
			[
				'T', 
				'Группа',
				'skip'=>!$el
				
			],
		'uLogin'=>
			[
				'T', 
				'Логин!!',
				[
					'login_empty'=>'укажите логин',
					'login_short'=>"логин слишком короткий [не менее $MinLogin]",
					'login_wrong'=>'логин не может содержать пробел(ы)',
					'login_used'=>'логин уже используется'
				],
				'skip'=>($_cfg.Const_NoLogins)
			],
		'uMail'=>
			[
				'T',
				'e-mail!!',
				[
					'mail_empty'=>'укажите e-mail',
					'mail_wrong'=>'неверный e-mail',
					'mail_used'=>'e-mail уже используется'
				]
			],
		'uPass'=>
			[
				'*',
				valueIf(!$el, 'Пароль!!', 'Пароль'),
				[
					'pass_empty'=>'укажите пароль',
					'pass_short'=>"пароль слишком короткий [не менее $MinPass]",
					'pass_wrong'=>'пароль не соответствует формату'
				]
			],
		'uPIN'=>
			[
				'*',
				valueIf(!$el, 'PIN-код!!', 'PIN-код'),
				[
					'pin_empty'=>'укажите PIN-код',
					'pin_short'=>"PIN-код слишком короткий [не менее $MinPass]",
					'pin_wrong'=>'PIN-код не соответствует формату'
				],
				'skip'=>($_cfg.Sec_MinPIN == 0) or !$el
			],
		'uState'=>
			[
				'S',
				'Статус',
				0,
				$usr_statuses,
				'skip'=>!$el
			],
		'uBTS'=>
			[
				'DT', 
				'Забанен до',
				[
					'bdate_empty'=>'укажите срок'
				],
				'skip'=>!$el
			],
		'uLevel'=>
			[
				'I', 
				'Уровень доступа',
				[
					'lvl_wrong'=>'неверное значение'
				],
				'size'=>3,
				'skip'=>!$el
			],
		'uRef'=>
			[
				'T',
				"Кто пригласил{if $_cfg.Account_RegMode == 2}!!{/if}",
				[
					'ref_empty'=>"укажите $txt_login",
					'ref_not_found'=>"$txt_login не найден",
					'ref_is_self'=>'неверное значение'
				],
				'skip'=>(($_cfg.Account_RegMode == 3) or !$_cfg.Ref_Word or !$el)
			],
		'uBal'=>
			[
				'X',
				'Баланс <<сумма по всем плат. системам>>',
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
		'uWDDisable'=>['C', 'Запретить вывод средств'],
		'uLang'=>
			[
				'S',
				'Язык',
				0,
				$langs,
				'skip'=>!$el
			],
		'uMode'=>
			[
				'T',
				'Режим',
				'size'=>8,
				'skip'=>!$el
			],
		'uTheme'=>
			[
				'T',
				'Тема',
				'size'=>8,
				'skip'=>!$el
			],
		'Act'=>
			[
				'X',
				'Последняя активность',
				0,
				"{$el.uLTS} <small>(IP {$el.uLIP} {include file='_country.tpl' ip=$el.uLIP})</small>",
				'skip'=>!$el.uLTS
			]
	]
	values=$el
}

{if $el}
	<br>
	<a href="{_link module='balance/admin/opers'}?user={$el.uLogin}" class="button-green">Все операции пользователя</a>&nbsp;
	<a href="{_link module='message/admin/message'}?add&to={$el.uLogin}" class="button-green">Написать сообщение пользователю</a>&nbsp;
	<a href="{_link module='account/admin/user'}?id={$el.uID}&login" class="button-green">Войти как пользователь</a><br>
{/if}
{include file='admin/footer.tpl'}
{/strip}