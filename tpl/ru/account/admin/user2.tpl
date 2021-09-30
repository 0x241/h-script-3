{strip}
{include file='admin/header.tpl' title='Пользователь'}

<h2>Пользователь '{$el.aName}'</h2>
<a href="{_link module='account/admin/user'}?id={$el.uID}" class="button-gray">Основные параметры</a>
<br><br>

{$txt_login=valueIf($_cfg.Const_NoLogins, 'e-mail', 'Логин')}
{include file='edit.tpl'
	fields=[
		'auID'=>[],
		'uLogin'=>
			[
				'X', 
				$txt_login
			],
		'C'=>
			[
				'X',
				'Регистрация',
				0,
				"{$el.aCTS} <small>(IP {$el.aCIP} {include file='_country.tpl' ip=$el.aCIP})</small>",
				'skip'=>!$el.aCTS
			],
		'aName'=>
			[
				'T',
				'Имя!!',
				[
					'name_empty'=>'укажите имя'
				]
			],
		'aTZ'=>
			[
				'T',
				'Часовой пояс!! <<от GMT>>',
				[
					'tz_wrong'=>'неверное смещение [ч:м]'
				],
				'comment'=>'+4:00 = Москва',
				'size'=>6
			],
		'aBD'=>
			[
				'D',
				'Дата рождения'
			],
		'aCountry'=>
			[
				'T',
				'Страна'
			],
		'aCity'=>
			[
				'T',
				'Город'
			],
		'aTel'=>
			[
				'T',
				'Номер телефона'
			],
		'aNoMail'=>
			[
				'C',
				'Не получать оповещения на e-mail',
				'skip'=>$_cfg.Msg_NoMail
			],
		50=>'Специальная реф.система',
		'aPerc'=>
			[
				'A', 
				'От пополнения<br><<значения по уровням>>'
			],
		'aDPerc'=>
			[
				'A', 
				'От вклада<br><<значения по уровням>>'
			],
		'aPPerc'=>
			[
				'A', 
				'От начисления<br><<значения по уровням>>'
			],
		99=>'Безопасность',
		'aGA'=>['T', 'Google Authenticator'],
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
			]
	]
	values=$el
}

{if $wfields}

	<br>
	{$wfields = [
		'auID'=>[],
		'DefCurr'=>[
			'S',
			'Платежная система по умолчанию!!',
			[
				'psys_wrong'=>'укажите плат.систему'
			],
			[0=>'- выберите -'] + (array)$defcurr,
			'default'=>$el['aDefCurr']
		]
	]+$wfields}

	{include file='edit.tpl'
		form='wallets'
		title='Платежные реквизиты'
		fields=$wfields
		values=$wdata
	}
	
{/if}
	
{include file='admin/footer.tpl'}
{/strip}