{strip}
{include file='header.tpl' title='Подтверждение'}

<h1>Подтверждение операции</h1>

{if isset($smarty.get.done)}

	<h2>Операция завершена!</h2>

{else}

	{if isset($smarty.get.need_confirm_sms)}

		<h2>Операция НЕ завершена!</h2>
		<p class="info">
			Для завершения операции Вы должны ввести код подтверждения<br>
			который был выслан на Ваш телефон
		</p>
	
	{/if}

	{include file='edit.tpl' 
		url="{_link module='confirm'}"
		fields=
		[
			'Code'=>
				[
					'T', 
					'Введите код!!',
					[
						'code_empty'=>'укажите код',
						'code_not_found'=>'неверный код',
						'code_used'=>'код уже неактуален',
						'code_expired'=>'срок активации кода истек',
						'dif_ip'=>'подтверждение с Вашего IP-адреса невозможно',
						'oper_wrong'=>'неверная операция',
						'oper_unkn'=>'операция не реализована'
					],
					'size'=>40,
					'default'=>$smarty.get.code
				]	
		]
		captcha=$_cfg.Confirm_Captcha
		btn_text='Выполнить'
	}

{/if}

{include file='footer.tpl'}
{/strip}