{strip}
{include file='header.tpl' title='Main'}

<h1>Main</h1>

{if $demo}

	<p class="info">
		Script works in <b>demo</b> mode.<br>
		Some functions are disabled
	</p>
	
{/if}

Current language folder: <a href="{_link module='system'}">{$current_lang}</a>

{include file='footer.tpl'}
{/strip}