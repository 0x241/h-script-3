{strip}
{include file='header.tpl' title='Новость'}

<h1>Новость</h1>

<h2>{$el.nTopic}</h2>

<div style="width: 600px; text-align: left;">
	<small>{$el.nTS}</small>
	{if $el.nAttn}&nbsp;&nbsp;&nbsp;<b style="color: red;">Важно!</b>{/if}
	<div style="padding: 10px; background-color: #F3F3F3;">
		{$el.nText}
	</div>
</div>
<br>

{include file='footer.tpl'}
{/strip}