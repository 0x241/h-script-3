{strip}

Project works {$stat.worked} days<br>
Total users {$stat.users}<br>
Users on-line {$stat.usersonline}<br>
Total accepted funds ${$stat.zin|string_format:"%.2f"}<br>
Total withdrawals ${$stat.zout|string_format:"%.2f"}<br>
including RCB ${$stat.zref|string_format:"%.2f"}<br>
Reinvested ${$stat.zreinv|string_format:"%.2f"}<br>
Active deposits {$stat.deps}<br>
Completed deposits {$stat.depsclosed}<br>
{if $stat.lastuser}
	New user ({$stat.lastuser.uLogin})<br>
{/if}
{if $stat.lastinop}
	New deposit ${$stat.lastinop.oSum|string_format:"%.2f"} ({$stat.lastinop.uLogin})<br>
{*	New deposit {_z($stat.lastinop.oSum, $stat.lastinop.ocID, 2)} ({$stat.lastinop.uLogin})<br>*}
{/if}
{if $stat.lastoutop}
	Last withdrawal ${$stat.lastoutop.oSum|string_format:"%.2f"} ({$stat.lastoutop.uLogin})<br>
{/if}

{/strip}