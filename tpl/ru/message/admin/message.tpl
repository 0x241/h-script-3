{strip}
{include file='admin/header.tpl' title='Сообщение'}

{if $el.mID}

	{include file='edit.tpl'
		title='Cообщение'
		fields=[
			'uLogin'=>
				[
					'T',
					'Отправитель',
					'skip'=>!$el.uLogin,
					'readonly'=>true
				],
			'mMail'=>
				[
					'T',
					'e-mail отправителя',
					'skip'=>!$el.mMail,
					'readonly'=>true
				],
			'To1'=>
				[
					'T',
					'Получатель',
					'default'=>$el.mTo,
					'skip'=>($el.mToCnt != 1),
					'readonly'=>true
				],
			'mTo'=>
				[
					'A', 
					'Получатели<br><<* - всем>>', 
					'size'=>30,
					'skip'=>($el.mToCnt == 1),
					'readonly'=>true
				],
			'mAttn'=>
				[
					'CC', 
					'Важное',
					'readonly'=>true
				],
			'mTopic'=>
				[
					'L', 
					'Тема',
					'size'=>50,
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

	{if $el.mToCnt == 1}
		<a href="{_link module='message/admin/message'}?add&re={$el.mID}" class="button-green">Ответить</a><br>
	{/if}
	
{else}

	{include file='edit.tpl'
		title='Новое сообщение'
		fields=[
			'Re'=>[],
			'uLogin'=>
				[
					'T',
					'Отправитель',
					[
						'user_not_found'=>'пользователь не найден'
					],
					'default'=>valueIf(!$el.mMail, exValue($user.uLogin, $smarty.get.from))
				],
			'mMail'=>
				[
					'T',
					'e-mail отправителя',
					[
						'mail_wrong'=>'неверный e-mail'
					]
				],
			'mTo'=>
				[
					'A',
					'Получатели!!<br><<Одна строка - один получатель<br>Для отправки на e-mail указывайте префикс "mailto:">>', 
					[
						'to_empty'=>'укажите получателей',
						'to_wrong'=>"получатели не найдены: [$wrusrs]"
					], 
					'size'=>30,
					'default'=>$smarty.get.to,
					'comment'=>$el.mLang
				],
			'mAttn'=>
				[
					'CC', 
					'Важное'
				],
			'Feed'=>
				[
					'CC', 
					'Рассылка'
				],
			'mTopic'=>
				[
					'L', 
					'Тема!!',
					[
						'topic_empty'=>'укажите тему'
					], 
					'size'=>50
				],
			'mText'=>
				[
					'Y', 
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

{include file='admin/footer.tpl'}
{/strip}