{strip}
{include file='admin/header.tpl' title='FAQ'}

{include file='edit.tpl'
	title='Question'
	title_new='New question'
	fields=[
		'fID'=>[],
		'fCTS'=>
			[
				'X', 
				'Creation date',
				'skip'=>!$el.fID
			],
		'fHidden'=>
			[
				'C', 
				'Hidden'
			],
		'fCat'=>
			[
				'S', 
				'Category!!',
				[],
				[''=>'- no -'] + (array)$cats,
				'skip'=>!$cats
			],
		'fQuestion'=>
			[
				'L', 
				'Question!!',
				[
					'question_empty'=>'input question'
				],
				size=>50
			],
		'fAnswer'=>
			[
				'Y',
				'Answer!!',
				[
					'answer_empty'=>'input answer'
				], 
				'size'=>15
			],
		'fOrder'=>
			[
				'I', 
				'Sorting order'
			]
	]
	values=$el
}

{include file='admin/footer.tpl'}
{/strip}