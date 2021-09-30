{strip}
{include file='header.tpl' title='Сообщения'}

<h1>Сообщения</h1>

<a href="{_link module='message'}" class="button-gray">Входящие</a>

{if $list}

	{include file='list.tpl' 
		title='Исходящие'
		url='*'
		fields=[
			'mID'=>['ID'],
			'mTS'=>['Дата'],
			'uLogin'=>['Получатель'],
			'mTopic'=>['Тема'],
			'mText'=>['Текст']
		]
		values=$list
		row='*'
	}
	
{else}

	Сообщений нет

{/if}

<a href="{_link module='message/show'}?new" class="button-green">Написать</a><br>

{include file='footer.tpl'}
{/strip}