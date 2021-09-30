{strip}
{include file='header.tpl' title='Сообщение'}

{if $el.mID}

	{include file='edit.tpl'
		title='Сообщение'
		fields=[
			'uLogin'=>
				[
					'T',
					'Отправитель',
					'readonly'=>true
				],
			'mTopic'=>
				[
					'T', 
					'Тема',
					'readonly'=>true
				],
			'mText'=>
				[
					'W', 
					'Текст',
					'size'=>15,
					'readonly'=>true
				]
		]
		values=$el
		btn_text=' '
	}

{if $_cfg.Msg_Mode > 1}
	<a href="{_link module='message/show'}?new&re={$el.bID}" class="button-green">Ответить</a><br>
{/if}
	
{else}

	{include file='edit.tpl'
		title='Новое сообщение'
		fields=[
			'Re'=>[],
			'mTo'=>
				[
					'T', 
					'Получатель!!', 
					[
						'to_empty'=>'укажите получателя',
						'to_wrong'=>'получатель не найдены'
					], 
					'size'=>30
				],
			'mTopic'=>
				[
					'L', 
					'Тема!!',
					[
						'topic_empty'=>'укажите тему'
					], 
					size=>50
				],
			'mText'=>
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
		btns=['send'=>'Отправить']
	}
	
{/if}

{include file='footer.tpl'}
{/strip}