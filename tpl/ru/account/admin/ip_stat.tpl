{strip}
{include file='admin/header.tpl' title='IP Table'}

	<h2> Статистика IP <br> и кол-во  аторизаций и регистраций</h2>
	<small><< только одно использование IP не показывается >></small>

	{include file='list.tpl'

	url='*'
	fields=[
		'ip'=>['IP'],
		'auth'=>['auth'],
    	'reg'=>['reg'],
    	'sum'=>['sum']
	]
	values=$list
	row='*'

}



{include file='admin/footer.tpl'}
{/strip}