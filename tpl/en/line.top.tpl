{strip}
<div class="_topLine">
	<div class="topLinks">
	<table class="formatTable" width="100%">
	<tr>
		<td align="left">
			{include file='links.tpl' 
				elements=[
					['index', 'Main'],
					['news', 'News'],
					['cabinet', 'Cabinet', 'skip'=>!_uid()],
					['admin', 'Control panel', 'count'=>$count_aopers, 'skip'=>($user.uLevel < 90)]
				]
			}
		</td>
		<td align="right">
			{if _uid()}
				{include file='links.element.tpl' module='account' text=$user.aName}
				{if $curr1}
					{include file='links.element.tpl' module='balance' text='Balance'}
					{_z($curr1.wBal, $curr1.cID, 2)}
				{/if}
				{include file='links.element.tpl' module='account/login' params='out' text='Logout'}
			{else}
				{if $_cfg.RegMode >= 0}
					{include file='links.element.tpl' module='account/register' text='Registration'}
				{/if}
				{include file='links.element.tpl' module='account/login' text='Login'}
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