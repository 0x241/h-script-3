{strip}
{include file='admin/header.tpl' title='Страница'}

{include file='edit.tpl'
	title='Страница'
	title_new='Новая страница'
	fields=[
		'pID'=>[],
		'pHidden'=>
			[
				'C',
				'Скрыта'
			],
		'pDirect'=>
			[
				'C',
				'Показывать только этот код <<без "шапки" и "подвала">>'
			],
		'pTopic'=>
			[
				'L', 
				'Название!!',
				[
					'topic_empty'=>'укажите название'
				], 
				size=>50
			],
		'pText'=>
			[
				'Y', 
				'Содержимое!!', 
				[
					'text_empty'=>'укажите содержимое'
				], 
				'size'=>15
			]
	]
	values=$el
}

{include file='admin/footer.tpl'}
{/strip}