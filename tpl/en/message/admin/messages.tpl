{strip}
{include file='admin/header.tpl' title='Messages'}

{include file='list.tpl' 
	title='Messages'
	url='*'
	fields=[
		'bID'=>['ID'],
		'mTS'=>['Date'],
		'uLogin'=>['Sender'],
		'To'=>['Receivers'],
		'mTopic'=>['Topic'],
		'mText'=>['Text']
	]
	values=$list
	row='*'
	btns=['del'=>'Delete']
}

<a href="{_link module='message/admin/message'}?add" class="button-green">New message</a><br>

{include file='admin/footer.tpl'}
{/strip}