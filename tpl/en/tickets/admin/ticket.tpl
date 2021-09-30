{strip}
{include file='admin/header.tpl' title='Ticket'}

{include file='tickets/_states.tpl'}

{if $el.tID}

	{include file='edit.tpl'
		form='ticket'
		title='Ticket'
		fields=[
			'tID'=>[],
			'tState'=>
				[
					'X',
					'State',
					0,
					$_tstates[$el.tState]
				],
			'uLogin'=>
				[
					'T',
					'Sender',
					'skip'=>!$el.uLogin,
					'readonly'=>true
				],
			'tMail'=>
				[
					'T',
					'sender e-mail',
					'skip'=>!$el.mMail,
					'readonly'=>true
				],
			'tTopic'=>
				[
					'L',
					'Subject',
					'size'=>50,
					'readonly'=>true
				],
			'tText'=>
				[
					'W',
					'Text',
					'size'=>10,
					'readonly'=>true
				]
		]
		values=$el
		btn_text=' '
		btns=valueIf($el.tState < 8, ['close'=>'Close ticket'])
	}
	
	<table class="FromatTable">
	{foreach $list as $l}
		<tr><td width="250px"><td width="250px"><td width="250px"></tr>
		<tr>
			{if $l.muID == $el.tuID}
				<td colspan="2">
			{else}
				<td><td colspan="2">
			{/if}
			<fieldset>
			{$l.mTS} [{$l.aName}]<br>
			<br>
			{$l.mText}
			</fieldset>
			</td>
		</tr>
	{/foreach}
	</table><br>

	{if $el.tState < 8}
	
		{include file='edit.tpl'
			fields=[
				'tID'=>$el.tID,
				'mText'=>
					[
						'W', 
						'Response!!',
						[
							'text_empty'=>'fill text'
						], 
						'size'=>10
					]
			]
			values=$el
			btn_text=' '
			btns=['answer'=>'Answer']
		}
		
	{/if}

{else}

	{include file='edit.tpl'
		title='New ticket'
		fields=[
			'uLogin'=>
				[
					'T',
					'Sender',
					[
						'user_not_found'=>'user not found'
					],
					'default'=>valueIf(!$el.mMail, exValue($user.uLogin, $smarty.get.from))
				],
			'tMail'=>
				[
					'T',
					'sender e-mail',
					[
						'mail_wrong'=>'wrong e-mail'
					],
					'skip'=>true
				],
			'tTopic'=>
				[
					'L', 
					'Subject!!',
					[
						'topic_empty'=>'type subject'
					], 
					'size'=>50
				],
			'tText'=>
				[
					'W', 
					'Text!!',
					[
						'text_empty'=>'type text'
					], 
					'size'=>15
				]
		]
		values=$el
		btn_text=' '
		btns=['create'=>'Create']
	}

{/if}

{include file='admin/footer.tpl'}
{/strip}