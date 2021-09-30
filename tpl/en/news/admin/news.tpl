{strip}
{include file='admin/header.tpl' title='News'}

{include file='edit.tpl'
	title='News'
	title_new='News'
	fields=[
		'nID'=>[],
		'nTS'=>
			[
				'DT', 
				'Publication date!!',
				[
					'date_empty'=>'input date'
				], 
				'default'=>$today
			],
		'nTopic'=>
			[
				'L', 
				'Topic!!',
				[
					'topic_empty'=>'input topic'
				], 
				size=>50
			],
		'nAttn'=>
			[
				'CC', 
				'Important'
			],
		'nAnnounce'=>
			[
				'W',
				'Announce!!',
				[
					'ann_empty'=>'укажите анонс'
				], 
				'size'=>5
			],
		'nText'=>
			[
				'Y', 
				'Full text!!', 
				[
					'text_empty'=>'укажите текст новости'
				], 
				'size'=>15
			],
		'nDBegin'=>
			[
				'D', 
				'Show from'
			],
		'nDEnd'=>
			[
				'D', 
				'To'
			]
	]
	values=$el
}

{include file='admin/footer.tpl'}
{/strip}