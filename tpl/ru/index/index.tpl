{strip}
{include file='header.tpl' title='Главная'}

<h1>Главная</h1>

{if $demo}

	<p class="info">
		Скрипт работает в <b>демонстрационном</b> режиме.<br>
		Некоторые функции недоступны
	</p>
	
{/if}

Текущая языковая папка: <a href="{_link module='system'}">{$current_lang}</a>

{include file='footer.tpl'}
{/strip}