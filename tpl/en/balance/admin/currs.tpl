{strip}
{include file='admin/header.tpl' title='Pay.systems'}

{include file='list.tpl' 
	title='Pay.systems'
	url='*'
	fields=[
		'cID'=>['ID'],
		'cCID'=>['Code'],
		'cName'=>['Title'],
		'cCurr'=>['Currency'],
		'cBal'=>['Balance'],
		'cAPI'=>['API'],
		'cDisable'=>['<small>Disabled.</small>'],
		'cCASHIN'=>['<small>Add funds</small>'],
		'cCASHOUT'=>['<small>Withdraw</small>'],
		'cEX'=>['<small>Exch.</small>'],
		'cTR'=>['<small>Transf.</small>'],
		'cBUY'=>['<small>Buy</small>'],
		'cSELL'=>['<small>Sale</small>'],
		'cBUY2'=>['<small>Service</small>'],
		'cSELL2'=>['<small>Sale service</small>'],
		'cGIVE'=>['<small>Deposit</small>'],
		'cTAKE'=>['<small>Removal</small>'],
		'cHidden'=>['<small>Hidden</small>']
	]
	values=$list
	row='*'
	btns=['del'=>'Delete']
}

<a href="{_link module='balance/admin/curr'}?add" class="button-green">Add pay.system</a><br>

{include file='admin/footer.tpl'}
{/strip}