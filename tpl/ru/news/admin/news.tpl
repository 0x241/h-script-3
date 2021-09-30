{strip}
{include file='admin/header.tpl' title='Публикация'}

{include file='edit.tpl'
	title='Публикация'
	title_new='Новая публикация'
	fields=[
		'nID'=>[],
		'nTS'=>
			[
				'DT', 
				'Дата публикации!!',
				[
					'date_empty'=>'укажите дату'
				], 
				'default'=>$today
			],
		'nTopic'=>
			[
				'L', 
				'Тема!!',
				[
					'topic_empty'=>'укажите тему'
				], 
				size=>50
			],
		'nAttn'=>
			[
				'CC', 
				'Важная'
			],
		'nAnnounce'=>
			[
				'W',
				'Краткий анонс!!',
				[
					'ann_empty'=>'укажите анонс'
				], 
				'size'=>5
			],
		'nText'=>
			[
				'Y', 
				'Полный текст!!', 
				[
					'text_empty'=>'укажите текст новости'
				], 
				'size'=>15
			],
		'nDBegin'=>
			[
				'D', 
				'Отображать с'
			],
		'nDEnd'=>
			[
				'D', 
				'По'
			]
	]
	values=$el
}

{include file='admin/footer.tpl'}
{/strip}