{strip}
{include file='admin/header.tpl' title='FAQ'}

{include file='list.tpl' 
	title='FAQ'
	url='*'
	fields=[
		'fID'=>['ID'],
		'fCTS'=>['<small>Creation date</small>'],
		'fHidden'=>['<small>Hidden</small>'],
		'fCat'=>['Category'],
		'fQuestion'=>['Question'],
		'fAnswer'=>['Answer'],
		'fOrder'=>['<small>Sorting order</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Delete']
}

<a href="{_link module='faq/admin/faq'}?add" class="button-green">Add question</a><br>

{include file='admin/footer.tpl'}
{/strip}