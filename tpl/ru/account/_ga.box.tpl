{if !$user.aGA}
	<input name="GAKey" value="{$GACode}" type="hidden">
	Для активиции <a href="https://www.google.com/landing/2step/" target="_blank">Google Authenticator</a> используйте ключ:<br>
	<big>{$GACode}</big><br>
	<img src="{$GAQR}">
	и
{else}
	Для отключения Google Authenticator
{/if}