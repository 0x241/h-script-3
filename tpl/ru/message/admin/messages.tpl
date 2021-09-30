{strip}
{include file='admin/header.tpl' title='Сообщения'}

{include file='list.tpl' 
	title='Сообщения'
	url='*'
	fields=[
		'bID'=>['ID'],
		'mTS'=>['Дата'],
		'uLogin'=>['Отправитель'],
		'To'=>['Получатели'],
		'mTopic'=>['Тема'],
		'mText'=>['Текст']
	]
	values=$list
	row='*'
	btns=['del'=>'Удалить']
}

<a href="{_link module='message/admin/message'}?add" class="button-green">Создать</a><br>

{include file='admin/footer.tpl'}
{/strip}