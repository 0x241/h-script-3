{strip}
{include file='header.tpl' title='Тикет'}

{include file='tickets/_states.tpl'}

{if $el.tID}

	{include file='edit.tpl'
		form='ticket'
		title='Тикет'
		fields=[
			'tID'=>[],
			'tState'=>
				[
					'X',
					'Статус',
					0,
					$_tstates[$el.tState]
				],
			'tTopic'=>
				[
					'L',
					'Тема',
					'size'=>50,
					'readonly'=>true
				],
			'tText'=>
				[
					'W',
					'Текст',
					'size'=>10,
					'readonly'=>true
				]
		]
		values=$el
		btn_text=' '
		btns=valueIf($el.tState < 8, ['close'=>'Закрыть тикет'])
	}
	
	<table class="FromatTable">
	{foreach $list as $l}
		<tr><td width="250px"><td width="250px"><td width="250px"></tr>
		<tr>
			{if $l.muID == $el.tuID}
				<td colspan="2">
			{else}
				<td><td colspan="2">
			{/if}
			<fieldset>
			{if $l.muID == $el.tuID}Вы{else}Тех.поддержка{/if}, {$l.mTS}<br>
			{$l.mText}
			</fieldset>
			</td>
		</tr>
	{/foreach}
	</table><br>

	{if $el.tState < 8}
	
		{include file='edit.tpl'
			fields=[
				'tID'=>$el.tID,
				'mText'=>
					[
						'W', 
						'Сообщение!!', 
						[
							'text_empty'=>'укажите текст'
						], 
						'size'=>10
					]
			]
			values=$el
			btn_text=' '
			btns=['answer'=>'Ответить']
		}
		
	{/if}

{else}

	{include file='edit.tpl'
		title='Новый тикет'
		fields=[
			'tTopic'=>
				[
					'L', 
					'Тема!!',
					[
						'topic_empty'=>'укажите тему'
					], 
					'size'=>50
				],
			'tText'=>
				[
					'W', 
					'Текст!!', 
					[
						'text_empty'=>'укажите текст'
					], 
					'size'=>15
				]
		]
		values=$el
		btn_text=' '
		btns=['create'=>'Создать тикет']
	}

{/if}

{include file='footer.tpl'}
{/strip}