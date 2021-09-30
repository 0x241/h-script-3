{strip}
{include file='admin/header.tpl' title='Отправка СМС'}

{include file='edit.tpl' 
	fields=[
		'From'=>['T', 'Отправитель <<пусто - значение "по умолчанию">>', ['from_wrong'=>'неверный отправитель']],
		'To'=>['T', 'Номер получателя', ['to_wrong'=>'неверный номер получателя']],
		'Text'=>['W', 'Текст', ['msg_empty'=>'введите сообщение', 'msg_too_long'=>'сообщение слишком длинное'], 'size'=>5]
	]
	btn_text=' '
	btns=['send'=>'Отправить']
}

{include file='admin/footer.tpl'}
{/strip}