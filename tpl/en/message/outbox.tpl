{strip}
{include file='header.tpl' title='Messages'}

<h1>Messages</h1>

<a href="{_link module='message'}" class="button-gray">Inbox</a>

{if $list}

	{include file='list.tpl' 
		title='Outbox'
		url='*'
		fields=[
			'mID'=>['ID'],
			'mTS'=>['Date'],
			'uLogin'=>['Receiver'],
			'mTopic'=>['Topic'],
			'mText'=>['Text']
		]
		values=$list
		row='*'
	}
	
{else}

	No messages

{/if}

<a href="{_link module='message/show'}?new" class="button-green">Create</a><br>

{include file='footer.tpl'}
{/strip}