{if !$user.aGA}
	<input name="GAKey" value="{$GACode}" type="hidden">
	To activate <a href="https://www.google.com/landing/2step/" target="_blank">Google Authenticator</a> use this key:<br>
	<big>{$GACode}</big><br>
	<img src="{$GAQR}">
	and
{else}
	To deactivate Google Authenticator
{/if}