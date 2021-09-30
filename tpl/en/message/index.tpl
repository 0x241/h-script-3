{strip}
{include file='header.tpl' title='Messages'}

<h1>Messages</h1>

{if $_cfg.Msg_Mode > 1}
	<a href="{_link module='message/outbox'}" class="button-gray">Outbox</a>
{/if}

{if $list}

	{include file='list.tpl' 
		title='Inbox'
		url='*'
		fields=[
			'bID'=>['ID'],
			'mTS'=>['Date'],
			'uLogin'=>['Sender'],
			'mTopic'=>['Topic'],
			'bRTS'=>['Readed']
		]
		values=$list
		row='*'
		btns=['del'=>'Delete']
	}
	
{else}

	No messages

{/if}

{include file='footer.tpl'}
{/strip}