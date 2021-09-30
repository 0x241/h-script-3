{strip}
{include file='admin/header.tpl' title='IP Table'}

	<h2> Statistics for IP:{$smarty.get.ip}</h2>

	{include file='list.tpl'
	url='*'
	fields=[
		'uID'=>['ID'],
		'uLogin'=>['Login'],
    	'aCIP'=>['IP reg'],
    	'uLIP'=>['IP auth']
	]
	values=$list
    linkparams="&ip={$smarty.get.ip}"
	row='*'
}



{include file='admin/footer.tpl'}
{/strip}