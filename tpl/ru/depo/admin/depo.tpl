{strip}
{include file='admin/header.tpl' title='Депозит'}

{if $el}

	{include file='depo/_depo.admin.tpl' from_admin=true}

{else}

	{if $smarty.get.user}

		{include file='depo/_depo.new.tpl' from_admin=true}
	
	{else}
	
		{include file='edit.tpl'
			form='new'
			title='Новый депозит'
			fields=[
				'Login'=>
					[
						'T',
						'Пользователь!!',
						[
							'user_empty'=>'пользователь не найден'
						],
						'default'=>$smarty.get.user
					]
			]
			btn_text='Далее'
		}
	
	{/if}
	
{/if}

{include file='admin/footer.tpl'}
{/strip}