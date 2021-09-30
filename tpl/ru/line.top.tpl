{strip}
<div class="_topLine">
	<div class="topLinks">
	<table class="formatTable" width="100%">
	<tr>
		<td align="left">
			{include file='links.tpl' 
				elements=[
					['index', 'Главная'],
					['news', 'Новости'],
					['cabinet', 'Кабинет', 'skip'=>!_uid()],
					['admin', 'Панель управления', 'count'=>$count_aopers, 'skip'=>($user.uLevel < 90)]
				]
			}
		</td>
		<td align="right">
			{if _uid()}
				{include file='links.element.tpl' module='account' text=$user.aName}
				{if $curr1}
					{include file='links.element.tpl' module='balance' text='Баланс'}
					{_z($curr1.wBal, $curr1.cID, 2)}
				{/if}
				{include file='links.element.tpl' module='account/login' params='out' text='Выход'}
			{else}
				{if $_cfg.RegMode >= 0}
					{include file='links.element.tpl' module='account/register' text='Регистрация'}
				{/if}
				{include file='links.element.tpl' module='account/login' text='Вход'}
			{/if}
		</td>
		<td align="right" width="100px">
			{include file='widget/clock/index.tpl'}
		</td>
	</tr>
	</table>
	</div>
</div>
{/strip}