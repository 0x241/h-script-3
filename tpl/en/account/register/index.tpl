{strip}
{include file='header.tpl' title='Registration'}

<h1>Registration</h1>

{if isset($smarty.get.done)}

	<h2>Registration complete!</h2>
	<p class="info">
		Now You can <a href="{_link module='account/login'}">login</a> to your account
	</p>

{elseif isset($smarty.get.need_confirm)}

	<h2>Registration NOT complete!</h2>
	<p class="info">
		To complete the operation, you must confirm your e-mail.<br>
		Please <a href="{_link module='confirm'}">input confirmation code</a><br>
		or click on the link that was sent to your e-mail.<br><br>
		If message is not coming, then try <a href="{_link module='account/change_mail'}">change e-mail</a>
	</p>

{elseif isset($smarty.get.need_confirm_sms)}

	<h2>Registration NOT complete!</h2>
	<p class="info">
		To complete the operation, you must confirm your phone number.<br>
		Please <a href="{_link module='confirm'}">input confirmation code</a><br>
		that was sent to your phone
	</p>

{elseif $_cfg.Account_RegMode == 0}

	<h2>Registration suspended!</h2>
	<p class="info">
		Registration on the site is temporarily suspended.<br>
		For all questions please contact the <a href="{_link module='message/support'}">support</a>
	</p>

{else}

	{$txt_login=valueIf($_cfg.Const_NoLogins, 'e-mail', 'login')}
	{if ($_cfg.Account_RegMode == 2) and !$valid_ref}

		<h2>Attention!</h2>
		<p class="info">
			Registration on the site is possible <a href="{_link module='udp/about'}">by invitation</a> <b>only</b>.<br>
			To do this, you must come to our website<br>
			by special member ref-link or specify the {$txt_login}
		</p>
		
	{elseif $_cfg.Account_RegMode == 3}

		<h2>Attention!</h2>
		<p class="info">
			Registration on the site is possible <a href="{_link module='udp/about'}">by invitation</a> <b>only</b>.<br>
			To do this, you must specify an invitation code
		</p>
		
	{/if}

	{if $_cfg.Account_Loginza and (($_cfg.Account_RegMode == 1) or (($_cfg.Account_RegMode == 2) and $valid_ref)) and ($_cfg.Sec_MinSQA == 0)}
		{include file='account/ulogin/_box.tpl'}
		<br>
		<h3>or</h3>
	{/if}
	{if $_cfg.Account_ISP and (($_cfg.Account_RegMode == 1) or (($_cfg.Account_RegMode == 2) and $valid_ref)) and ($_cfg.Sec_MinSQA == 0)}
		{include file='account/isp/_box.tpl'}
		<br>
		<h3>or</h3>
	{/if}

	{include file='edit.tpl'
		url="{_link module='account/register'}"
		form='register_frm'
		fields=
		[
			'aName'=>
				[
					'T',
					'Your Name',
					[
						'name_empty'=>'input Name'
					],
					'skip'=>($_cfg.Account_UseName != 1)
				],
			'uLogin'=>
				[
					'T', 
					'Your Login!!',
					[
						'login_empty'=>'Enter login',
						'login_short'=>"login is too short [less than {$_cfg.Account_MinLogin}]",
						'login_wrong'=>'wrong login format',
						'login_used'=>'this login is busy'
					],
					'skip'=>$_cfg.Const_NoLogins,
					'comment'=>' <span id="login_check" class="err"></span>'
				],
			'uMail'=>
				[
					'T',
					valueIf($_cfg.Account_RegConfirm, 'e-mail!! <<confirmation will be sent>>', 'e-mail!!'),
					[
						'mail_empty'=>'input e-mail',
						'mail_wrong'=>'wrong e-mail',
						'mail_used'=>'e-mail is already in use'
					],
					'comment'=>' <span id="mail_check" class="err"></span>'
				],
			'uPass'=>
				[
					'*',
					'Your Password!!',
					[
						'pass_empty'=>'input password',
						'pass_short'=>"password is too short [less than {$_cfg.Account_MinPass}]",
						'pass_wrong'=>'password does not match the format'
					]
				],
			'Pass2'=>
				[
					'*',
					'Re-type password!!',
					[
						'pass_not_equal'=>'passwords do not match'
					]
				],
			'aTel'=>
				[
					'T',
					'Phone number!! <<with country code>>',
					[
						'tel_wrong'=>'wrong number'
					],
					'skip'=>!$_cfg.SMS_REG
				],
			'uRef'=>
				[
					'T',
					"You invited by{if $_cfg.Account_RegMode == 2}!!{/if}{if $_cfg.Const_NoLogins} <<e-mail>>{/if}",
					[
						'ref_empty'=>"inpur $txt_login",
						'ref_not_found'=>"$txt_login not found"
					],
					'default'=>$smarty.session._ref,
					'skip'=>(($_cfg.Account_RegMode == 3) or !$_cfg.Ref_Word),
					'readonly'=>$valid_ref
				],
			'Invite'=>
				[
					'T',
					'Invite code!!',
					[
						'inv_empty'=>'input code',
						'inv_not_found'=>'wrong code',
						'inv_used'=>'code is already in use'
					],
					'skip'=>($_cfg.Account_RegMode != 3)
				],
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
					'T',
					'Secret answer!!',
					[
						'seca_empty'=>'input answer',
						'seca_short'=>"answer is too short [less than {$_cfg.Sec_MinSQA}]",
						'seqa_equal_secq'=>'answer can not be the same with the question'
					],
					'skip'=>($_cfg.Sec_MinSQA == 0),
					'size'=>40
				],
			'Agree'=>
				[
					'CC',
					"I accept <a href=\"{_link module='udp/rules'}\" target=\"_blank\">rules</a> and agree!! terms of service",
					[
						'must_agree'=>'you must accept the rules'
					]
				]
		]
		errors=['multi_reg'=>'multiple registration is forbidden']
		captcha=$_cfg.Account_RegCaptcha
		btn_text='Sign up'
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
								$('#login_check').html('used');
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
								$('#mail_check').html('used');
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