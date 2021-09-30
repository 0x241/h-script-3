{strip}
    {include file='admin/header.tpl' title='Settings'}

    {include file='edit.tpl'
    values=$cfg
    fields=[
    'Prov'=>['S', 'Provider', 0, ['- disabled -', 'epochta.ru']],
    'From'=>['T', 'Sender << 14 numeric characters <br> or 11 alphanumeric (English letters and numbers) >>'],
    'SendCount'=>['I', 'Send messages to no more than a minute in N'],
    'UpdateCount'=>['I', 'Update the status messages, no more than a minute in N'],
    1=>'Confirmation operations',
    'REG'=>['C', 'Registration'],
    'CASHOUT'=>['C', 'Cashout'],
    'epochta.ru',
    'EP_Login'=>['T', 'Login << e-mail >>'],
    'EP_Pass'=>['*', 'password']
    ]
    btn_text='Save'
    }
{*		'smspilot.ru',
		'SP_Pass'=>['*', 'API-ключ']*}

    {include file='admin/footer.tpl'}
{/strip}