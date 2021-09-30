{strip}
{include file='header.tpl' title='Login'}

<h1>Login</h1>

{if isset($smarty.get.ip_changed)}

	<h2>Security system</h2>
	<p class="info">
		You are trying to access your account from a different IP-addresses.<br>
		To continue <a href="{_link module='confirm'}">input confirmation code</a><br>
		or click on the link that was sent to your e-mail
	</p>

{elseif isset($smarty.get.brute_force)}

	<h2>Security system</h2>
	<p class="info">
		Password has been entered incorrectly multiple times.<br>
		To continue <a href="{_link module='confirm'}">input confirmation code</a><br>
		or click on the link that was sent to your e-mail
	</p>

{else}

	{if $url}
		Page "<i>...{$url}</i>" requires authorization<br><br>
	{/if}
	{if $_cfg.Sys_LockSite}
		<p class="info">
			Currently on the site are technical works.<br>
			Login <b>only</b> for staff
		</p>
	{/if}
	
	{include file='account/login/box.tpl'}

	{if !$_cfg.Sys_LockSite}
		<br>
		<a href="{_link module='account/reset_pass'}">Forgot password</a><br>
		{if $_cfg.Account_RegMode >= 0}<a href="{_link module='account/register'}">I do not have a login</a><br>{/if}
		<a href="{_link module='confirm'}">Confirm</a> or <a href="{_link module='account/change_mail'}">change</a> e-mail
		<br>
	{/if}

{/if}

{include file='footer.tpl'}
{/strip}