{strip}
{include file='header.tpl' title='Сброс пароля'}

<h1>Сброс пароля</h1>

{if isset($smarty.get.done)}

	<h2>Операция завершена!</h2>
	<p class="info">
		Теперь Вы можете <a href="{_link module='account/login'}">войти</a> в свой аккаунт, используя <b>новый</b> пароль.<br>
		После этого его можно будет сменить на другой
	</p>

{elseif isset($smarty.get.need_confirm)}

	<h2>Операция НЕ завершена!</h2>
	<p class="info">
		Для получения временного пароля <a href="{_link module='confirm'}">введите код подтверждения</a><br>
		или перейдите по ссылке, которые были высланы на Ваш e-mail.<br><br>
		Если письмо долго не приходит, то попробуйте <a href="{_link module='account/change_mail'}">сменить e-mail</a>
	</p>

{elseif isset($squest)}

	{include file='sqa.tpl'}

{else}

	{$txt_login=valueIf($_cfg.Const_NoLogins, 'e-mail', 'Логин')}
	{include file='edit.tpl' 
		url='*'
		fields=
		[
			'Login'=>
				[
					'T', 
					"$txt_login!!",
					[
						'login_empty'=>"укажите $txt_login",
						'login_not_found'=>'неверная пара Логин/e-mail',
						'mail_not_found'=>'e-mail не найден'
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
		btn_text='Далее'
	}

{/if}

{include file='footer.tpl'}
{/strip}
