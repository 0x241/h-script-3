{strip}
{include file='header.tpl' title='Account'}

<h1>Personal settings</h1>

{if $_cfg.Sec_ForceReConfig and $user.aNeedReConfig}

	<p class="info">
		Before you begin you must set your personal settings
	</p>
	
{/if}

{include file='edit.tpl'
	url='*'
	title1='Parameters'
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
				'Your Name!!',
				[
					'name_empty'=>'input Name'
				],
				'readonly'=>$_cfg.Account_LockData,
				'skip'=>($_cfg.Account_UseName == 0)
			],
		'uLogin'=>
			[
				'X',
				'Your Login',
				0,
				'skip'=>$_cfg.Const_NoLogins
			],
		'uMail'=>
			[
				'X',
				'Your e-mail'
			],
		'aTel'=>
			[
				'T',
				'Your phone number!! <<with country code>>',
				[
					'tel_wrong'=>'wrong number'
				],
				'skip'=>!$_cfg.SMS_REG
			],
		'TZ'=>
			[
				'T',
				'Your time zone!! <<от GMT>>',
				[
					'tz_wrong'=>'wrong zone [h:m]'
				],
				'comment'=>'+4:00 = Moscow',
				default=>$utz,
				'size'=>6
			],
		'aNoMail'=>
			[
				'C',
				'Do not be notified to e-mail',
				'skip'=>$_cfg.Msg_NoMail
			],
		98=>'Google Authenticator',
		'GA'=>
			[
				'U',
				'account/_ga.box.tpl'
			],
		'GACode'=>['T', 'input code from application', ['ga_wrong' => 'wrong code']],
		99=>'Security',
		'GA'=>
			[
				'U',
				'account/_ga.box.tpl'
			],
		'aIPSec'=>
			[
				'S',
				'Control IP-address change',
				0,
				[
					0=>'- default -', 
					1=>'x.0.0.0', 
					2=>'x.x.0.0', 
					3=>'x.x.x.0', 
					4=>'x.x.x.x'
				]
			],
		'aSessIP'=>['C', 'Bind session to IP-address'],
		'aSessUniq'=>['C', 'Disallow parallel sessions'],
		'aTimeOut'=>['I', 'Auto logout in N minutes <<0 - default>>'],
		'aSQuestion'=>
			[
				'T',
				'Secret question!!',
				[
					'secq_empty'=>'input question',
					'secq_short'=>"question is too short [less than {$_cfg.Sec_MinSQA}]"
				],
				'skip'=>($_cfg.Sec_MinSQA == 0),
				'size'=>40
			],
		'aSAnswer'=>
			[
				'*',
				'Secret answer!! <<input to change>>',
				[
					'seca_empty'=>'input answer',
					'seca_short'=>"answer is too short [less than {$_cfg.Sec_MinSQA}]",
					'seqa_equal_secq'=>'answer can not be the same with the question'
				],
				'skip'=>($_cfg.Sec_MinSQA == 0),
				'size'=>40
			],
		'PIN'=>
			[
				'*',
				'Input PIN-code!! <<to confirm changes>>',
				[
					'pin_wrong'=>'wrong code'
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
	{if $_cfg.Account_Loginza}<a href="{_link module='account/ulogin'}" class="button-gray">Profiles</a>&nbsp;{/if}
	{if !$_cfg.Account_LockData}<a href="{_link module='account/change_mail'}" class="button-green">Change e-mail</a>&nbsp;{/if}
	<a href="{_link module='account/change_pass'}" class="button-green">Change password</a>
{/if}

{include file='footer.tpl'}

{/strip}