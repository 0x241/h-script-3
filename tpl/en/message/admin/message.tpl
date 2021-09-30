{strip}
{include file='admin/header.tpl' title='Message'}

{if $el.mID}

	{include file='edit.tpl'
		title='Message'
		fields=[
			'uLogin'=>
				[
					'T',
					'Sender',
					'skip'=>!$el.uLogin,
					'readonly'=>true
				],
			'mMail'=>
				[
					'T',
					'Sender\'s e-mail',
					'skip'=>!$el.mMail,
					'readonly'=>true
				],
			'To1'=>
				[
					'T',
					'Receiver',
					'default'=>$el.mTo,
					'skip'=>($el.mToCnt != 1),
					'readonly'=>true
				],
			'mTo'=>
				[
					'A', 
					'Receivers<br><<* - each>>', 
					'size'=>30,
					'skip'=>($el.mToCnt == 1),
					'readonly'=>true
				],
			'mAttn'=>
				[
					'CC', 
					'Important',
					'readonly'=>true
				],
			'mTopic'=>
				[
					'L', 
					'Topic',
					'size'=>50,
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

	{if $el.mToCnt == 1}
		<a href="{_link module='message/admin/message'}?add&re={$el.mID}" class="button-green">Answer</a><br>
	{/if}
	
{else}

	{include file='edit.tpl'
		title='New message'
		fields=[
			'Re'=>[],
			'uLogin'=>
				[
					'T',
					'Sebder',
					[
						'user_not_found'=>'user not found'
					],
					'default'=>valueIf(!$el.mMail, exValue($user.uLogin, $smarty.get.from))
				],
			'mMail'=>
				[
					'T',
					'Sender\'s e-mail',
					[
						'mail_wrong'=>'wrong e-mail'
					]
				],
			'mTo'=>
				[
					'A',
					'Receivers!!<br><<To send to e-mail use prifix "mailto:">>', 
					[
						'to_empty'=>'input receivers',
						'to_wrong'=>"receivers not found: [$wrusrs]"
					], 
					'size'=>30,
					'default'=>$smarty.get.to,
					'comment'=>$el.mLang
				],
			'mAttn'=>
				[
					'CC', 
					'Important'
				],
			'Feed'=>
				[
					'CC', 
					'Feed <<force text>>'
				],
			'mTopic'=>
				[
					'L', 
					'Topic!!',
					[
						'topic_empty'=>'input topic'
					], 
					'size'=>50
				],
			'mText'=>
				[
					'Y', 
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

{include file='admin/footer.tpl'}
{/strip}