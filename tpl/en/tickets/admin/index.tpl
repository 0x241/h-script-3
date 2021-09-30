{strip}
{include file='admin/header.tpl' title='Support'}

{include file='tickets/_states.tpl'}

{include file='list.tpl' 
	title='Tickets'
	url='*'
	fields=[
		'tID'=>['ID'],
		'tLTS'=>['Date'],
		'uLogin'=>['Sender'],
		'tTopic'=>['Subject'],
		'tText'=>['Text'],
		'tState'=>['State'],
		'cnt'=>['Response']
	]
	values=$list
	row='*'
	btns=['del'=>'Delete']
}

<a href="{_link module='tickets/admin/ticket'}?add" class="button-green">Create</a><br>

{include file='admin/footer.tpl'}
{/strip}