{strip}
{include file='header.tpl' title='Смена пароля'}

<h1>Смена пароля</h1>

{if $user.uPTS == 1}

	<p class="info">
		You have been given a temporary password.<br>
		Change it to a more complex
	</p>

{elseif isset($smarty.get.need_change)}

	<p class="info">
		You have not changed your password.<br>
		The security policy of our website requires a change it
	</p>

{/if}

{include file='edit.tpl'
	url='*'
	fields=
	[
		'Pass0'=>
			[
				'*',
				'Old password!!',
				[
					'pass0_wrong'=>'wrong password'
				]
			],
		'Pass'=>
			[
				'*',
				'New password!!',
				[
					'pass_empty'=>'input password',
					'pass_short'=>"password is too short [less than $MinPass]",
					'pass_wrong'=>'password does not match the format'
				]
			],
		'Pass2'=>
			[
				'*',
				'Повторите новый пароль!!',
				[
					'pass_not_equal'=>'passwords do not match'
				]
			],
		'PIN'=>
			[
				'*',
				'Enter the PIN-code! <<to confirm the change>>',
				[
					'pin_wrong'=>'wrong code'
				],
				'skip'=>($_cfg.Sec_MinPIN == 0),
				'size'=>8
			]
	]
	btn_text='Change'
	btns=valueIf(isset($smarty.get.need_change), ['skip'=>'Do not change'])
}

{include file='footer.tpl'}
{/strip}