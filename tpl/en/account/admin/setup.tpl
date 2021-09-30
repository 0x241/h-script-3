{strip}
{include file='admin/header.tpl' title='Settings'}

{include file='edit.tpl' 
	values=$cfg
	fields=[
		'LockData'=>['C', 'Deny modify personal data'],
		'Loginza'=>['C', 'Allow a "quick" registration and login,<br>using accounts other services <<provider uLogin.ru>>'],
		'ISP'=>['C', 'Allow a "quick" registration and login via ISP <<InvestorsStartPage.com>>'],
		
		1=>'Registration',
		'RegMode'=>['S', 'Mode', 0, [0=>'Deny', 1=>'Allow', 2=>'Only with ref', 3=>'By invitation only']],
		'RegCheck'=>['S', 'Checking for multiple registrations', 0, [0=>'No', 1=>'By IP-address', 2=>'By cookie', 3=>'By IP-address and cookie']],
		'UseName'=>['S', 'Require the entry of the Name', 0, [0=>'No (=Login)', 1=>'Yes', 2=>'In Personal settings']],
		'UseAvatar'=>['S', 'Use Avatar', 0, [0=>'No', 1=>'yes'], 'comment'=>'using  <a href="https://ru.gravatar.com/">gravatar.com</a>'],
		'MinLogin'=>['I', 'Min Login length'],
		'LoginRegx'=>['T', 'Login format <<regular expression>>'],
		'MinPass'=>['I', 'Min Password length'],
		'PassRegx'=>['T', 'Password format <<regular expression>>'],
		'RegCaptcha'=>['S', 'Protect by "captcha"', 0, [0=>'No', 1=>'Auto', 2=>'Always']],
		'RegConfirm'=>['C', 'Confirm operation by e-mail'],
		'RegLogin'=>['C', 'Log in to your account immediately after registration'],
		
	'Sign in',
		'LoginCaptcha'=>['S', 'Protect by "captcha"', 0, [0=>'No', 1=>'Auto', 2=>'Always']],
		
		'Change e-mail',
		'ChangeMailCaptcha'=>['S', 'Protect by "captcha"', 0, [0=>'No', 1=>'Auto', 2=>'Always']],
		'ChangeMailConfirm'=>['C', 'Confirm operation by e-mail'],
		
		'Password reset',
		'ResetPassCaptcha'=>['S', 'Protect by "captcha"', 0, [0=>'No', 1=>'Auto', 2=>'Always']]
	]
}
	
{include file='admin/footer.tpl'}
{/strip}