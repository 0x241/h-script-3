{strip}
{if !$el.pDirect}
	{include file='header.tpl' title=$el.pTopic}
{/if}

{$el.pText}

{if !$el.pDirect}
	{include file='footer.tpl'}
{/if}
{/strip}