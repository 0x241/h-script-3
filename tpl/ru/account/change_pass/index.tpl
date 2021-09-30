{strip}
{include file='header.tpl' title='Смена пароля'}

<h1>Смена пароля</h1>

{if $user.uPTS == 1}

	<p class="info">
		Вам был выдан временный пароль.<br>
		Смените его на более сложный
	</p>

{elseif isset($smarty.get.need_change)}

	<p class="info">
		Вы давно не меняли пароль.<br>
		Политика безопасности нашего сайта требует сменить его
	</p>

{/if}

{include file='edit.tpl'
	url='*'
	fields=
	[
		'Pass0'=>
			[
				'*',
				'Старый пароль!!',
				[
					'pass0_wrong'=>'неверный пароль'
				]
			],
		'Pass'=>
			[
				'*',
				'Новый пароль!!',
				[
					'pass_empty'=>'укажите пароль',
					'pass_short'=>"пароль слишком короткий [не менее $MinPass]",
					'pass_wrong'=>'пароль не соответствует формату'
				]
			],
		'Pass2'=>
			[
				'*',
				'Повторите новый пароль!!',
				[
					'pass_not_equal'=>'пароли не совпадают'
				]
			],
		'PIN'=>
			[
				'*',
				'Введите PIN-код!! <<чтобы подтвердить смену>>',
				[
					'pin_wrong'=>'неверный код'
				],
				'skip'=>($_cfg.Sec_MinPIN == 0),
				'size'=>8
			]
	]
	btn_text='Сменить'
	btns=valueIf(isset($smarty.get.need_change), ['skip'=>'Не менять'])
}

{include file='footer.tpl'}
{/strip}