{strip}
{include file='header.tpl' title='Profiles'}

<h1>Profiles</h1>

{if $logins}

	{include file='list.tpl' 
		title='Attached'
		fields=[
			'Icon'=>[''],
			'url'=>['Account'],
			'Action'=>['']
		]
		values=$logins
		row='*'
	}
	
{/if}

<p class="info">
	You can attach and other your profiles.<br>
	This will allow to understand during authorization<br>
	that this <strong>is you</strong>, rather than a few different users
</p>

<h2>Add profile</h2>

{include file='account/ulogin/_box.tpl'}

{include file='footer.tpl'}
{/strip}