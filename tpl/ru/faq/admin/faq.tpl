{strip}
{include file='admin/header.tpl' title='FAQ'}

{include file='edit.tpl'
	title='Вопрос'
	title_new='Новый вопрос'
	fields=[
		'fID'=>[],
		'fCTS'=>
			[
				'X', 
				'Дата добавления',
				'skip'=>!$el.fID
			],
		'fHidden'=>
			[
				'C', 
				'Невидимый'
			],
		'fCat'=>
			[
				'S', 
				'Категория!!',
				[],
				[''=>'- нет -'] + (array)$cats,
				'skip'=>!$cats
			],
		'fQuestion'=>
			[
				'L', 
				'Вопрос!!',
				[
					'question_empty'=>'укажите вопрос'
				],
				size=>50
			],
		'fAnswer'=>
			[
				'Y',
				'Ответ!!',
				[
					'answer_empty'=>'укажите ответ'
				], 
				'size'=>15
			],
		'fOrder'=>
			[
				'I', 
				'Порядок <<сортировки>>'
			]
	]
	values=$el
}

{include file='admin/footer.tpl'}
{/strip}