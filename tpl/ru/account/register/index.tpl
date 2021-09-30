{strip}
{include file='header.tpl' title='Регистрация'}

<h1>Регистрация</h1>

{if isset($smarty.get.done)}

	<h2>Регистрация завершена!</h2>
	<p class="info">
		Теперь Вы можете <a href="{_link module='account/login'}">войти</a> в свой аккаунт
	</p>

{elseif isset($smarty.get.need_confirm)}

	<h2>Регистрация НЕ завершена!</h2>
	<p class="info">
		Для завершения операции Вы должны подтвердить свой e-mail.<br>
		Для этого <a href="{_link module='confirm'}">введите код подтверждения</a><br>
		или перейдите по ссылке, которые были высланы на Ваш e-mail.<br><br>
		Если письмо долго не приходит, то попробуйте <a href="{_link module='account/change_mail'}">сменить e-mail</a>
	</p>

{elseif isset($smarty.get.need_confirm_sms)}

	<h2>Регистрация НЕ завершена!</h2>
	<p class="info">
		Для завершения операции Вы должны подтвердить свой номер телефона.<br>
		Для этого <a href="{_link module='confirm'}">введите код подтверждения</a><br>
		который был выслан на Ваш телефон
	</p>

{elseif $_cfg.Account_RegMode == 0}

	<h2>Регистрация приостановлена!</h2>
	<p class="info">
		Регистрация на сайте временно приостановлена.<br>
		По всем вопросам обращайтесь в <a href="{_link module='message/support'}">поддержку</a>
	</p>

{else}

	{$txt_login=valueIf($_cfg.Const_NoLogins, 'e-mail', 'логин')}
	{if ($_cfg.Account_RegMode == 2) and !$valid_ref}

		<h2>Внимание!</h2>
		<p class="info">
			Регистрация на сайте возможна <b>только</b> <a href="{_link module='udp/about'}">по приглашению</a>.<br>
			Для этого Вы должны перейти на наш сайт<br>
			по специальной реф-ссылке участника или указать его {$txt_login}
		</p>
		
	{elseif $_cfg.Account_RegMode == 3}

		<h2>Внимание!</h2>
		<p class="info">
			Регистрация на сайте возможна <b>только</b> <a href="{_link module='udp/about'}">по приглашению</a>.<br>
			Для этого, Вы должны указать код приглашения
		</p>
		
	{/if}

	{if $_cfg.Account_Loginza and (($_cfg.Account_RegMode == 1) or (($_cfg.Account_RegMode == 2) and $valid_ref)) and ($_cfg.Sec_MinSQA == 0)}
		{include file='account/ulogin/_box.tpl'}
		<br>
		<h3>или</h3>
	{/if}
	{if $_cfg.Account_ISP and (($_cfg.Account_RegMode == 1) or (($_cfg.Account_RegMode == 2) and $valid_ref)) and ($_cfg.Sec_MinSQA == 0)}
		{include file='account/isp/_box.tpl'}
		<br>
		<h3>или</h3>
	{/if}

	{include file='edit.tpl'
		url="{_link module='account/register'}"
		form='register_frm'
		fields=
		[
			'aName'=>
				[
					'T',
					'Ваше имя',
					[
						'name_empty'=>'укажите имя'
					],
					'skip'=>($_cfg.Account_UseName != 1)
				],
			'uLogin'=>
				[
					'T', 
					'Придумайте логин!!',
					[
						'login_empty'=>'укажите логин',
						'login_short'=>"логин слишком короткий [не менее {$_cfg.Account_MinLogin}]",
						'login_wrong'=>'неверный формат логина',
						'login_used'=>'логин уже используется'
					],
					'skip'=>$_cfg.Const_NoLogins,
					'comment'=>' <span id="login_check" class="err"></span>'
				],
			'uMail'=>
				[
					'T',
					valueIf($_cfg.Account_RegConfirm, 'e-mail!! <<будет выслано подтверждение>>', 'e-mail!!'),
					[
						'mail_empty'=>'укажите e-mail',
						'mail_wrong'=>'неверный e-mail',
						'mail_used'=>'e-mail уже используется'
					],
					'comment'=>' <span id="mail_check" class="err"></span>'
				],
			'uPass'=>
				[
					'*',
					'Придумайте пароль!!',
					[
						'pass_empty'=>'укажите пароль',
						'pass_short'=>"пароль слишком короткий [не менее {$_cfg.Account_MinPass}]",
						'pass_wrong'=>'пароль не соответствует формату'
					]
				],
			'Pass2'=>
				[
					'*',
					'Повторите пароль!!',
					[
						'pass_not_equal'=>'пароли не совпадают'
					]
				],
			'aTel'=>
				[
					'T',
					'Номер телефона!! <<с кодом страны>>',
					[
						'tel_wrong'=>'неверный номер'
					],
					'skip'=>!$_cfg.SMS_REG
				],
			'uRef'=>
				[
					'T',
					"Вас пригласил{if $_cfg.Account_RegMode == 2}!!{/if}{if $_cfg.Const_NoLogins} <<укажите e-mail>>{/if}",
					[
						'ref_empty'=>"укажите $txt_login",
						'ref_not_found'=>"$txt_login не найден"
					],
					'default'=>$smarty.session._ref,
					'skip'=>(($_cfg.Account_RegMode == 3) or !$_cfg.Ref_Word),
					'readonly'=>$valid_ref
				],
			'Invite'=>
				[
					'T',
					'Код приглашения!!',
					[
						'inv_empty'=>'укажите код',
						'inv_not_found'=>'неверный код',
						'inv_used'=>'код уже использован'
					],
					'skip'=>($_cfg.Account_RegMode != 3)
				],
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
					'T',
					'Контрольный ответ!!',
					[
						'seca_empty'=>'укажите ответ',
						'seca_short'=>"ответ слишком короткий [не менее {$_cfg.Sec_MinSQA}]",
						'seqa_equal_secq'=>'ответ не может совпадать с вопросом'
					],
					'skip'=>($_cfg.Sec_MinSQA == 0),
					'size'=>40
				],
			'Agree'=>
				[
					'CC',
					"Я принимаю <a href=\"{_link module='udp/rules'}\" target=\"_blank\">правила</a> и соглашаюсь!! с условиями предоставления услуг",
					[
						'must_agree'=>'вы должны принять правила'
					]
				]
		]
		errors=['multi_reg'=>'множественная регистрация запрещена']
		captcha=$_cfg.Account_RegCaptcha
		btn_text='Зарегистрироваться'
	}

{/if}

{if !$_cfg.Const_NoLogins}

	<script type="text/javascript">
		function chkLogin()
		{
			$('#register_frm_uLogin').removeClass('error');
			$('#login_check').html('');
			$.ajax(
				{
					type: 'POST',
					url: 'ajax',
					data: 'module=account/register&do=chklogin&login='+
						encodeURIComponent($('#register_frm_uLogin').val()),
					success: 
						function(ex)
						{
							if (ex == 1)
							{
								$('#register_frm_uLogin').addClass('error');
								$('#login_check').html('занят');
							}
						}
				}
			);
		}
		tid2=0;
		$('#register_frm_uLogin').keypress(
			function()
			{
				clearTimeout(tid2);
				tid2=setTimeout(function(){ chkLogin(); }, 1000);
			}
		);
		chkLogin();
	</script>
	
{/if}

	<script type="text/javascript">
		function chkMail()
		{
			$('#register_frm_uMail').removeClass('error');
			$('#mail_check').html('');
			$.ajax(
				{
					type: 'POST',
					url: 'ajax',
					data: 'module=account/register&do=chkmail&mail='+
						encodeURIComponent($('#register_frm_uMail').val()),
					success: 
						function(ex)
						{
							if (ex == 1)
							{
								$('#register_frm_uMail').addClass('error');
								$('#mail_check').html('занят');
							}
						}
				}
			);
		}
		tid=0;
		$('#register_frm_uMail').keypress(
			function()
			{
				clearTimeout(tid);
				tid=setTimeout(function(){ chkMail(); }, 1000);
			}
		);
		chkMail();
	</script>

{include file='footer.tpl'}
{/strip}