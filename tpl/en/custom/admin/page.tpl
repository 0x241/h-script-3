{strip}
{include file='admin/header.tpl' title='Custom page'}

{include file='edit.tpl'
	title='Custom page'
	title_new='New custom page'
	fields=[
		'pID'=>[],
		'pHidden'=>
			[
				'C',
				'Disabled'
			],
		'pDirect'=>
			[
				'C',
				'Show only code <<w/o footer/header>>'
			],
		'pTopic'=>
			[
				'L', 
				'Title!!',
				[
					'topic_empty'=>'input title'
				], 
				size=>50
			],
		'pText'=>
			[
				'Y', 
				'Contents!!', 
				[
					'text_empty'=>'input contents'
				], 
				'size'=>15
			]
	]
	values=$el
}

{include file='admin/footer.tpl'}
{/strip}