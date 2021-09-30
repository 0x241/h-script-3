{strip}
{include file='header.tpl' title='Messages'}

{if $el.mID}

	{include file='edit.tpl'
		title='Messages'
		fields=[
			'uLogin'=>
				[
					'T',
					'Sender',
					'readonly'=>true
				],
			'mTopic'=>
				[
					'T', 
					'Topic',
					'readonly'=>true
				],
			'mText'=>
				[
					'W', 
					'Text',
					'size'=>15,
					'readonly'=>true
				]
		]
		values=$el
		btn_text=' '
	}

{if $_cfg.Msg_Mode > 1}
	<a href="{_link module='message/show'}?new&re={$el.bID}" class="button-green">Answer</a><br>
{/if}
	
{else}

	{include file='edit.tpl'
		title='New message'
		fields=[
			'Re'=>[],
			'mTo'=>
				[
					'T', 
					'Receiver!!', 
					[
						'to_empty'=>'input receiver',
						'to_wrong'=>'user not found'
					], 
					'size'=>30
				],
			'mTopic'=>
				[
					'L', 
					'Topic!!',
					[
						'topic_empty'=>'input topic'
					], 
					size=>50
				],
			'mText'=>
				[
					'W', 
					'Text!!', 
					[
						'text_empty'=>'input text'
					], 
					'size'=>15
				]
		]
		values=$el
		btn_text=' '
		btns=['send'=>'Send']
	}
	
{/if}

{include file='footer.tpl'}
{/strip}