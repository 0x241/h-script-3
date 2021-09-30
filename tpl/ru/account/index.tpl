{strip}
{include file='header.tpl' title='Аккаунт'}

<h1>Личные параметры</h1>

{if $_cfg.Sec_ForceReConfig and $user.aNeedReConfig}

	<p class="info">
		Перед началом работы Вы должны задать свои личные параметры
	</p>
	
{/if}

{include file='edit.tpl'
	url='*'
	title1='Параметры'
	fields=
	[
		'Avatar'=>
			[
				'U',
				'account/_avatar.box.tpl',
				'skip'=>!$_cfg.Account_UseAvatar
			],
		'aName'=>
			[
				'T',
				'Ваше имя!!',
				[
					'name_empty'=>'укажите имя'
				],
				'readonly'=>$_cfg.Account_LockData,
				'skip'=>($_cfg.Account_UseName == 0)
			],
		'uLogin'=>
			[
				'X',
				'Ваш логин',
				0,
				'skip'=>$_cfg.Const_NoLogins
			],
		'uMail'=>
			[
				'X',
				'Ваш e-mail'
			],
		'aTel'=>
			[
				'T',
				'Ваш номер телефона!! <<с кодом страны>>',
				[
					'tel_wrong'=>'неверный номер'
				],
				'skip'=>!$_cfg.SMS_REG
			],
		'TZ'=>
			[
				'T',
				'Ваш часовой пояс!! <<от GMT>>',
				[
					'tz_wrong'=>'неверное смещение [ч:м]'
				],
				'comment'=>'+4:00 = Москва',
				default=>$utz,
				'size'=>6
			],
		'aNoMail'=>
			[
				'C',
				'Не получать оповещения на e-mail',
				'skip'=>$_cfg.Msg_NoMail
			],
		98=>'Google Authenticator',
		'GA'=>
			[
				'U',
				'account/_ga.box.tpl'
			],
		'GACode'=>['T', 'введите код из приложения', ['ga_wrong' => 'неверный код']],
		99=>'Безопасность',
		'aIPSec'=>
			[
				'S',
				'Контроль смены IP-адреса',
				0,
				[
					0=>'- по умолчанию -', 
					1=>'x.0.0.0', 
					2=>'x.x.0.0', 
					3=>'x.x.x.0', 
					4=>'x.x.x.x'
				]
			],
		'aSessIP'=>['C', 'Привязывать сессию к IP-адресу'],
		'aSessUniq'=>['C', 'Запретить параллельные сессии'],
		'aTimeOut'=>['I', 'Автовыход через N минут <<0 - по умолчанию>>'],
		'aSQuestion'=>
			[
				'T',
				'Контрольный вопрос!!',
				[
					'secq_empty'=>'укажите вопрос',
					'secq_short'=>"вопрос слишком короткий [не менее {$_cfg.Sec_MinSQA}]"
				],
				'skip'=>($_cfg.Sec_MinSQA == 0),
				'size'=>40
			],
		'aSAnswer'=>
			[
				'*',
				'Контрольный ответ <<заполните чтобы сменить>>',
				[
					'seca_empty'=>'укажите ответ',
					'seca_short'=>"ответ слишком короткий [не менее {$_cfg.Sec_MinSQA}]",
					'seqa_equal_secq'=>'ответ не может совпадать с вопросом'
				],
				'skip'=>($_cfg.Sec_MinSQA == 0),
				'size'=>40
			],
		'PIN'=>
			[
				'*',
				'Введите PIN-код!! <<чтобы подтвердить изменения>>',
				[
					'pin_wrong'=>'неверный код'
				],
				'skip'=>($_cfg.Sec_MinPIN == 0),
				'size'=>8
			]
	]
	values=$user
	hide_cancel=$user.aNeedReConfig
}

{if !($_cfg.Sec_ForceReConfig and $user.aNeedReConfig)}
	<br>
	{if $_cfg.Account_Loginza}<a href="{_link module='account/ulogin'}" class="button-gray">Профили</a>&nbsp;{/if}
	{if !$_cfg.Account_LockData}<a href="{_link module='account/change_mail'}" class="button-green">Сменить e-mail</a>&nbsp;{/if}
	<a href="{_link module='account/change_pass'}" class="button-green">Сменить пароль</a>
{/if}

{include file='footer.tpl'}

{/strip}