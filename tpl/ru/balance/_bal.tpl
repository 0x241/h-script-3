{strip}
{if $curr1}
	На Вашем счете {_z($curr1.wBal, $curr1.cID, 2)}
{elseif $user.uBal > 0}
	{include file='balance/bal.tpl'}
{else}
	На Вашем счете <b>нет средств</b>
{/if}
{/strip}