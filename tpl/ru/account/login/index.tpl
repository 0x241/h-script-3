{strip}
{include file='header.tpl' title='Вход'}

<h1>Вход</h1>

{if isset($smarty.get.ip_changed)}

	<h2>Система безопасности</h2>
	<p class="info">
		Вы пытаетесь войти в аккаунт с другого IP-адреса.<br>
		Для продолжения <a href="{_link module='confirm'}">введите код подтверждения</a><br>
		или перейдите по ссылке, которые были высланы на Ваш e-mail
	</p>

{elseif isset($smarty.get.brute_force)}

	<h2>Система безопасности</h2>
	<p class="info">
		До этого пароль был неверно введен несколько раз подряд.<br>
		Для продолжения <a href="{_link module='confirm'}">введите код подтверждения</a><br>
		или перейдите по ссылке, которые были высланы на Ваш e-mail
	</p>

{else}

	{if $url}
		Страница "<i>...{$url}</i>" требует авторизации<br><br>
	{/if}
	{if $_cfg.Sys_LockSite}
		<p class="info">
			В настоящее время на сайте идут технические работы.<br>
			Вход <b>только</b> для обслуживающего персонала
		</p>
	{/if}
	
	{include file='account/login/box.tpl'}

	{if !$_cfg.Sys_LockSite}
		<br>
		<a href="{_link module='account/reset_pass'}">Забыл пароль</a><br>
		{if $_cfg.Account_RegMode >= 0}<a href="{_link module='account/register'}">Еще нет логина</a><br>{/if}
		<a href="{_link module='confirm'}">Подтвердить</a> или <a href="{_link module='account/change_mail'}">сменить</a> e-mail
		<br>
	{/if}

{/if}

{include file='footer.tpl'}
{/strip}