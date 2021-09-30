{strip}
{include file='admin/header.tpl' title=''}

{foreach from=$modules key=mc item=r}
	{include file='admin/module.block.tpl' modules_cat=$mc modules=$r}
{/foreach}

{include file='admin/footer.tpl'}
{/strip}