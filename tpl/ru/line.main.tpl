{strip}
<div class="_menuPanel">
{$smenu=[
	100=>['depo/calc', 'Калькулятор'],
	['faq', 'FAQ'],
	['depo/top', 'Топ'],
	['review', 'Отзывы']
]}
{if _uid()}
	{include file='menu.tpl' 
		class='mainMenu' 
		elements=[
			['cabinet', 'Кабинет'],
			['balance', 'Операции', 'count'=>$count_opers],
			['depo', 'Депозиты'],
			['message', 'Сообщения', 'count'=>$count_msg, 'skip'=>!$_cfg.Msg_Mode],
			['balance/wallets', 'Платежные реквизиты'],
			['tickets', 'Тикеты','count'=>$count_tickets],
			['refsys', 'Реф.система', 'skip'=>!$_cfg.Ref_Word]
		]+$smenu
	}
{else}
	{include file='menu.tpl' 
		class='mainMenu' 
		elements=[
		]+$smenu
	}
{/if}
</div>
<br>
{/strip}