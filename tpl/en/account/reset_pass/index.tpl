{strip}
{include file='header.tpl' title='Password reset'}

<h1>Password reset</h1>

{if isset($smarty.get.done)}

	<h2>Operation completed!</h2>
	<p class="info">
		Now You can <a href="{_link module='account/login'}">login</a> to your account, with <b>new</b> password.<br>
		After that it must be changed to another
	</p>

{elseif isset($smarty.get.need_confirm)}

	<h2>Operation NOT completed!</h2>
	<p class="info">
		To get a temporary password <a href="{_link module='confirm'}">input confirmation code</a><br>
		or click on the link that was sent to your e-mail.<br><br>
		If message is not coming, then try <a href="{_link module='account/change_mail'}">change e-mail</a>
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
						'login_empty'=>"input $txt_login",
						'login_not_found'=>'wrong Login/e-mail',
						'mail_not_found'=>'e-mail not found'
					]
				],
			'Mail'=>
				[
					'T',
					'e-mail!!',
					[
					],
					'skip'=>$_cfg.Const_NoLogins
				]
		]
		captcha=$_cfg.Account_ResetPassCaptcha
		btn_text='Next'
	}

{/if}

{include file='footer.tpl'}
{/strip}
