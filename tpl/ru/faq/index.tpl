{strip}
{include file='header.tpl' title='FAQ'}

<h1>FAQ</h1>

{if $list}
	<table class="formatTable" width="600px">
	{foreach name=list from=$list key=id item=l}
		<tr>
			<td>
				<div class="question" style="cursor: pointer;">
					<h2>{$l.fQuestion}</h2>
				</div>
				<div style="padding: 10px; background-color: #F3F3F3; display: none;">
					<small>{$l.fCat}</small><br>
					{$l.fAnswer}
				</div>
			</td>
		</tr>
	{/foreach}
	</table>
	{include file='pl.tpl'}
	<br>
{/if}

<script type="text/javascript">
	$('.question').next().hide();
	$('.question').click(
		function()
		{
			$(this).next().slideToggle();
	    }
	);
</script>

{include file='footer.tpl'}
{/strip}