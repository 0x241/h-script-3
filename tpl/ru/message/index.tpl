{strip}
{include file='header.tpl' title='Сообщения'}

<h1>Сообщения</h1>

{if $_cfg.Msg_Mode > 1}
	<a href="{_link module='message/outbox'}" class="button-gray">Исходящие</a>
{/if}

{if $list}

	{include file='list.tpl' 
		title='Входящие'
		url='*'
		fields=[
			'bID'=>['ID'],
			'mTS'=>['Дата'],
			'uLogin'=>['Отправитель'],
			'mTopic'=>['Тема'],
			'bRTS'=>['Прочтено']
		]
		values=$list
		row='*'
		btns=['del'=>'Удалить']
	}
	
{else}

	Сообщений нет

{/if}

{include file='footer.tpl'}
{/strip}