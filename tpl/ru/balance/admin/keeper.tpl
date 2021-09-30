{strip}
{include file='admin/header.tpl' title='Онлайн keeper'}

Это online версия программы h-keeper. Десктопную версию с полным функционалом Вы можете скачать с сайта <a href="http://h-keeper.ru">h-keeper.ru</a>
<br><br>

{if $list}

	<table class="Table" border="1">
	<tr>
		<th>
			Плат.система
		<th>
			Баланс
		<th>
			Ответ
	{foreach $list as $cid => $l}
	<tr>
		<td>
			{$l.cName}
		<td>
			{_z($l.balance.sum, $cid, 1)}
		<td>
			{$l.balance.result}
	{/foreach}
	</table>

	<h1>Перевод средств</h1>

	{if isset($smarty.get.batch)}

		<p class="info">
			Перевод успешно завершен. Batch: {$smarty.get.batch}
		</p>

	{/if}

	{include file='edit.tpl'
		url='*'
		fields=[
			'PSys'=>['S', 'Платежная система!!', ['psys_empty'=>'плат.система не указана'], [0=>'- выберите -'] + (array)$clist],
			'Sum'=>['$', 'Сумма!!', ['sum_wrong'=>'неверная сумма']],
			'To'=>['T', 'Кошелек получателя!!', ['wallet_empty'=>'укажите кошелек']],
			'Memo'=>['W', 'Примечание', 'size'=>4]
		]
		btn_text=' '
		btns=['send' => 'Отправить']
	}

{else}

	Нет платежных систем с API

{/if}

{include file='admin/footer.tpl'}
{/strip}