{strip}
{include file='header.tpl' title='Support'}

<h1>Support request</h1>

{if isset($smarty.get.done)}

	<h2>Your request has been sent successfully to support!</h2>
	<p class="info">
		The administrator will respond to you within 24 hours
	</p>

{else}

	{include file='message/support.box.tpl'}

{/if}	

{include file='footer.tpl'}
{/strip}