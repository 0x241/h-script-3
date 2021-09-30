{strip}
{include file='admin/header.tpl' title='Reviews'}

{include file='list.tpl' 
	title='Reviews'
	url='*'
	fields=[
		'oID'=>['ID'],
		'oTS'=>['Date'],
		'uLogin'=>['Author'],
		'oText'=>['Text'],
		'oState'=>['<small>Approved</small>'],
		'oOrder'=>['<small>Weight</small>']
	]
	values=$list
	row='*'
	btns=['accept'=>'Approve', 'del'=>'Delete']
}

{include file='admin/footer.tpl'}
{/strip}