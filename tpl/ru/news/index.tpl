{strip}
{include file='header.tpl' title='Новости'}

<h1>Новости</h1>

{if $list}
	<table class="formatTable" width="600px">
	{foreach name=list from=$list key=id item=l}
		<tr>
			<td>
				<h2>{$l.nTopic}</h2>
				<small>{$l.nTS}</small>
				{if $l.nAttn}&nbsp;&nbsp;&nbsp;<b style="color: red;">Важно!</b>{/if}
				<div style="padding: 10px; background-color: #F3F3F3;">
					{$l.nAnnounce|nl2br}
				</div>
				<div style="text-align: right;">
					<a href="{_link module='news/show' chpu=[$l.nID, $l.nTopic]}"><small>читать полностью</small></a>
				</div>
			</td>
		</tr>
	{/foreach}
	</table>
	{include file='pl.tpl'}
	<br>
{/if}

{include file='footer.tpl'}
{/strip}