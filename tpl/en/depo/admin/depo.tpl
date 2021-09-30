{strip}
{include file='admin/header.tpl' title='Deposit'}

{if $el}

	{include file='depo/_depo.admin.tpl' from_admin=true}

{else}

	{if $smarty.get.user}

		{include file='depo/_depo.new.tpl' from_admin=true}
	
	{else}
	
		{include file='edit.tpl'
			form='new'
			title='New deposit'
			fields=[
				'Login'=>
					[
						'T',
						'User!!',
						[
							'user_empty'=>'user not found'
						],
						'default'=>$smarty.get.user
					]
			]
			btn_text='Next'
		}
	
	{/if}
	
{/if}

{include file='admin/footer.tpl'}
{/strip}