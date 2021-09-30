{strip}
{include file='admin/header.tpl' title='User'}

<h2>User '{$el.aName}'</h2>
<a href="{_link module='account/admin/user'}?id={$el.uID}" class="button-gray">Main</a>
<br><br>

{$txt_login=valueIf($_cfg.Const_NoLogins, 'e-mail', 'Login')}
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
				'Registration',
				0,
				"{$el.aCTS} <small>(IP {$el.aCIP} {include file='_country.tpl' ip=$el.aCIP})</small>",
				'skip'=>!$el.aCTS
			],
		'aName'=>
			[
				'T',
				'Name!!',
				[
					'name_empty'=>'input Name'
				]
			],
		'aTZ'=>
			[
				'T',
				'Time zone!! <<GMT>>',
				[
					'tz_wrong'=>'wrong zone [h:m]'
				],
				'comment'=>'+4:00 = Moscow',
				'size'=>6
			],
		'aBD'=>
			[
				'D',
				'Date of birth'
			],
		'aCountry'=>
			[
				'T',
				'Country'
			],
		'aCity'=>
			[
				'T',
				'City'
			],
		'aTel'=>
			[
				'T',
				'Phone number'
			],
		'aNoMail'=>
			[
				'C',
				'Do not be notified by e-mail',
				'skip'=>$_cfg.Msg_NoMail
			],
		50=>'Special ref.system',
		'aPerc'=>
			[
				'A', 
				'From add funds<br><<values by levels>>'
			],
		'aDPerc'=>
			[
				'A', 
				'From deposit<br><<values by levels>>'
			],
		'aPPerc'=>
			[
				'A', 
				'From profit<br><<values by levels>>'
			],
		99=>'Security',
		'aGA'=>['T', 'Google Authenticator'],
		'aIPSec'=>
			[
				'S',
				'IP-address change control',
				0,
				[
					0=>'- by default -', 
					1=>'x.0.0.0', 
					2=>'x.x.0.0', 
					3=>'x.x.x.0', 
					4=>'x.x.x.x'
				]
			],
		'aSessIP'=>['C', 'Bind session to IP-address'],
		'aSessUniq'=>['C', 'Deny parallel sessions'],
		'aTimeOut'=>['I', 'Autologout after N min <<0 - by default>>'],
		'aSQuestion'=>
			[
				'T',
				'Secret question!!',
				[
					'secq_empty'=>'input question',
					'secq_short'=>"the question is too short [not less {$_cfg.Sec_MinSQA}]"
				],
				'skip'=>($_cfg.Sec_MinSQA == 0),
				'size'=>40
			],
		'aSAnswer'=>
			[
				'*',
				'Secret answer <<fill to change>>',
				[
					'seca_empty'=>'input answer',
					'seca_short'=>"the answer is too short [not less {$_cfg.Sec_MinSQA}]",
					'seqa_equal_secq'=>'answer and the question must be different'
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
			'Payment system by default!!',
			[
				'psys_wrong'=>'input pay.system'
			],
			[0=>'- select -'] + (array)$defcurr,
			'default'=>$el['aDefCurr']
		]
	]+$wfields}

	{include file='edit.tpl'
		form='wallets'
		title='Payment details'
		fields=$wfields
		values=$wdata
	}
	
{/if}
	
{include file='admin/footer.tpl'}
{/strip}