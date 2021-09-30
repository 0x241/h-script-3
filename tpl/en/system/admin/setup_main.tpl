{strip}
{include file='admin/header.tpl' title='Main'}

{if $cfg.NeedReConfig}

	<p class="info">
		Check all script settings
	</p>
	
{/if}

{include file='edit.tpl'
	values=$cfg
	fields=[
		'SiteName'=>['T', 'Site name'],
		'ForceCharset'=>['C', 'Force header "utf-8 encoding" <<for some hostings>>'],
		'AdminMail'=>['T', 'Admin e-mail'],
		'NotifyMail'=>['T', 'Notification center e-mail'],
		'LockSite'=>['C', 'Technical work <<login prohibition>>'],
        'OutIP'=>['X', 'Outgoing server IP', 'default' => "{$ip} {include file='_country.tpl' ip=$ip}"]
	]
}

{include file='admin/footer.tpl'}
{/strip}