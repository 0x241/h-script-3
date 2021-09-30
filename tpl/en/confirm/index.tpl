{strip}
{include file='header.tpl' title='Confirmation'}

<h1>Operation confirmation</h1>

{if isset($smarty.get.done)}

	<h2>Operation complete!</h2>

{else}

	{if isset($smarty.get.need_confirm_sms)}

		<h2>Operation NOT complete!</h2>
		<p class="info">
			To complete the operation, you must input confirmation code<br>
			that was sent to your phone
		</p>
	
	{/if}

	{include file='edit.tpl' 
		url="{_link module='confirm'}"
		fields=
		[
			'Code'=>
				[
					'T', 
					'Confirmation code!!',
					[
						'code_empty'=>'input code',
						'code_not_found'=>'wrong code',
						'code_used'=>'code is already outdated',
						'code_expired'=>'code has expired',
						'dif_ip'=>'confirmation from your IP-address can not be done',
						'oper_wrong'=>'wrong operation',
						'oper_unkn'=>'operation is not implemented'
					],
					'size'=>40,
					'default'=>$smarty.get.code
				]	
		]
		captcha=$_cfg.Confirm_Captcha
		btn_text='Execute'
	}

{/if}

{include file='footer.tpl'}
{/strip}