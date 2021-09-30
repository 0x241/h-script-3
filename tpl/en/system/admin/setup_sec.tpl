{strip}
{include file='admin/header.tpl' title='Security'}

{include file='edit.tpl' 
	values=$cfg
	fields=[
		'HTTPSMode'=>['S', "Use http<b>s</b> <<to change use https://>>", 0, [0=>'only at secure pages', 1=>'always'], 'readonly'=>!$via_https],
		'MinPIN'=>['I', 'Min PIN-code length <<0 - do not use>>'],
		'MinSQA'=>['I', 'Min Question/Answer length <<0 - do not use>>'],
		'BFC'=>['I', 'Brute force checking (N wrong logins) <<0 - do not use>>'],
		'IP'=>['S', 'IP-address change cheking', 0, [0=>'no', 1=>'x.0.0.0', 2=>'x.x.0.0', 3=>'x.x.x.0', 4=>'x.x.x.x']],
		'ForceReConfig'=>['C', 'Require verification of "Personal Settings" after registration'],
		'PassTime'=>['I', 'User must change password every N days <<0 - no>>'],
		'TimeOut'=>['I', 'Autologout after N minutes <<0 - do not use>>'],
		'_IPs' => ['A', "IP-addresses that are allowed to access the Control Panel <br> <<one line - one address in the format xxxx>> <br> your current IP: <b> {$curr_ip} </b> {include file='_country.tpl' ip=$curr_ip}"],
		'Proxy server',
		'ProxyHost'=>['T', 'Host!! <<[scheme://]address[:port]>>'],
		'ProxyAuth'=>['T', 'Authorization <<login:password>>']
	]
}

{include file='admin/footer.tpl'}
{/strip}