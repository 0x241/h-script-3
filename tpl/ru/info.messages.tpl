{strip}
{assign 
	var='info_msg'
	value=
		[
			'Completed'		=>'Выполнено',
			'Saved'			=>'Сохранено',
			'Canceled'		=>'Отменено',
			'Added'			=>'Добавлено',
			'Deleted'		=>'Удалено',

			'LogIn'			=>'Вход выполнен',
			'LogOut'		=>'Выход выполнен',

			'*NoSelected'	=>'Отметьте хотябы один элемент',
			'*CantComplete'	=>'Операция не может быть выполнена',
			'*AlreadyUsed'	=>'Данные уже используются',
			'*Error'		=>'Ошибка при выполнении операции',
			'*ErrorCode'	=>'Код ошибки',
			'*NoPage'		=>'Страница не найдена',

			'*Denied'		=>'В доступе отказано'
		] 
	scope='global'
}
{/strip}