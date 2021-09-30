{strip}

Программа работает {$stat.worked} дн.<br>
Всего участников {$stat.users}<br>
Сейчас на сайте {$stat.usersonline}<br>
Принято средств ${$stat.zin|string_format:"%.2f"}<br>
Выплачено средств ${$stat.zout|string_format:"%.2f"}<br>
в т.ч. рефских ${$stat.zref|string_format:"%.2f"}<br>
Реинвестировано ${$stat.zreinv|string_format:"%.2f"}<br>
Активных вкладов {$stat.deps}<br>
Оконченных вкладов {$stat.depsclosed}<br>
{if $stat.lastuser}
	Новый участник ({$stat.lastuser.uLogin})<br>
{/if}
{if $stat.lastinop}
	Новый вклад ${$stat.lastinop.oSum|string_format:"%.2f"} ({$stat.lastinop.uLogin})<br>
{*	Новый вклад {_z($stat.lastinop.oSum, $stat.lastinop.ocID, 2)} ({$stat.lastinop.uLogin})<br>*}
{/if}
{if $stat.lastoutop}
	Последняя выплата ${$stat.lastoutop.oSum|string_format:"%.2f"} ({$stat.lastoutop.uLogin})<br>
{/if}

{/strip}