{strip}
{include file='header.tpl' title='Change e-mail'}

<h1>Change e-mail</h1>

{if isset($smarty.get.done)}

	<h2>Е-mail changed!</h2>

{elseif isset($smarty.get.need_confirm)}

	<h2>Operation NOT complete!</h2>
	<p class="info">
		To complete the operation, you must confirm your e-mail.<br>
		Please <a href="{_link module='confirm'}">input confirmation code</a><br>
		or click on the link that was sent to your e-mail.<br><br>
		If message is not coming, then try <a href="{_link module='account/change_mail'}">change e-mail</a>
	</p>

{elseif isset($smarty.get.already_used)}

	<h2>The operation could not be completed!</h2>
	<p class="info">
		This e-mail can not be confirmed by you,<br>
		because it is already used by another user
	</p>

{elseif isset($squest)}

	{include file='sqa.tpl'}

{else}

	{$txt_login=valueIf($_cfg.Const_NoLogins, 'e-mail', 'Login')}
	{include file='edit.tpl' 
		url='*'
		fields=
		[
			'Login'=>
				[
					'T', 
					"$txt_login!!",
					[
						'login_empty'=>"input $txt_login/Password", 
						'login_not_found'=>"wrong $txt_login/Пароль", 
						'banned'=>"access to the account is suspended $ban_date", 
						'blocked'=>'account is blocked'
					],
					'skip'=>_uid()
				],
			'Pass'=>
				[
					'*',
					'Пароль!!',
					[
						'pass_not_found'=>'wrong Password'
					]
				],
			'NewMail'=>
				[
					'T',
					valueIf($_cfg.Account_ChangeMailConfirm, 'New e-mail!! <<confirmation will be sent>>', 'New e-mail!!'),
					[
						'mail_empty'=>'input e-mail',
						'mail_wrong'=>'wrong e-mail',
						'mail_used'=>'e-mail is already used'
					]
				]
		]
		captcha=$_cfg.Account_ChangeMailCaptcha
		btn_text='Next'
	}

{/if}

{include file='footer.tpl'}
{/strip}