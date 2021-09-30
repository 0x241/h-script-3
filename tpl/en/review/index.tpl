{strip}
{include file='header.tpl' title='Reviews'}

<h1>Reviews</h1>
<h3>Total reviews - {$total}</h3>

{if isset($smarty.get.awating)}

	<h2>Your review has successfully added!</h2>
	<p class="info">
		The administrator will check it in the near future
	</p>

{else}

	{if $list}
		<table class="formatTable" width="600px">
		{foreach name=list from=$list key=id item=l}
			<tr>
				<td>
					{include file='_usericon.tpl' user=$l}
					<h2>{$l.uLogin}</h2>
					<small>{$l.oTS}</small>
					<div style="padding: 10px; background-color: #F3F3F3;">
						{$l.oText|nl2br}
					</div>
				</td>
			</tr>
		{/foreach}
		</table>
		{include file='pl.tpl'}
		<br>
	{else}
		- No records -
	{/if}

	{if _uid()}
		{include file='edit.tpl'
			title='Leave your own review'
			fields=
			[
				'Text'=>
					[
						'W',
						valueIf($_cfg.Review_Mode, 'Text <<moderated>>', 'Text'),
						[
							'text_empty'=>'input text'
						],
						'size'=>5
					]
			]
			btn_text='Add'
		}
	{/if}

{/if}

{include file='footer.tpl'}
{/strip}