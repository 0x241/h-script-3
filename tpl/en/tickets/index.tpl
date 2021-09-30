{strip}
{include file='header.tpl' title='Support'}

{include file='tickets/_states.tpl'}

{include file='list.tpl' 
	title='Tickets'
	fields=[
		'tLTS'=>['Date'],
		'tTopic'=>['Subject'],
		'tState'=>['Status'],
		'cnt'=>['Answers']
	]
	values=$list
	row='*'
}

<a href="{_link module='tickets/newticket'}" class="button-green">Create</a><br>

{include file='footer.tpl'}
{/strip}