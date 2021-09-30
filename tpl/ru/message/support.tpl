{strip}
{include file='header.tpl' title='Поддержка'}

<h1>Запрос в поддержку</h1>

{if isset($smarty.get.done)}

	<h2>Ваш запрос в поддержку успешно отправлен!</h2>
	<p class="info">
		Администратор ответит Вам в течение 24-х часов
	</p>

{else}

	{include file='message/support.box.tpl'}

{/if}	

{include file='footer.tpl'}
{/strip}