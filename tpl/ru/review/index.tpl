{strip}
{include file='header.tpl' title='Отзывы'}

<h1>Отзывы</h1>
<h3>Всего отзывов - {$total}</h3>

{if isset($smarty.get.awating)}

	<h2>Ваш отзыв успешно добавлен!</h2>
	<p class="info">
		Администратор проверит его в ближайшее время
	</p>

{else}

	{if $list}
		<table class="formatTable" width="600px">
		{foreach name=list from=$list key=id item=l}
			<tr>
				<td>
					{include file='_usericon.tpl' user=$l}
					<h2>{$l.uLogin}</h2>
					<small>{$l.oTS}</small>
					<div style="padding: 10px; background-color: #F3F3F3;">
						{$l.oText|nl2br}
					</div>
				</td>
			</tr>
		{/foreach}
		</table>
		{include file='pl.tpl'}
		<br>
	{else}
		- Нет записей -
	{/if}

	{if _uid()}
		{include file='edit.tpl'
			title='Оставьте свой отзыв'
			fields=
			[
				'Text'=>
					[
						'W',
						valueIf($_cfg.Review_Mode, 'Текст <<проверяется>>', 'Текст'),
						[
							'text_empty'=>'укажите текст'
						],
						'size'=>5
					]
			]
			btn_text='Добавить'
		}
	{/if}

{/if}

{include file='footer.tpl'}
{/strip}