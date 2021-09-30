{strip}
{include file='admin/header.tpl' title='Интерфейс'}

{include file='edit.tpl' 
	values=$cfg
	fields=[
		'_Langs'=>['A', 'Языки интерфейса (имена подпапок в "/tpl/")<br><<одна строка - одно имя>>', 'size'=>4],
		'ShowIntro'=>['S', "Показывать <a href=\"{_link module='udp/intro'}\" target=\"_blank\">страницу-приветствие</a> <<Intro>>", 0, [0=>'никогда', 1=>'только при первом заходе', 2=>'всегда']],
		'TopPanel'=>['C', 'Показывать верхнюю панель'],
		'LeftPanel'=>['C', 'Показывать левую панель'],
		'RightPanel'=>['C', 'Показывать правую панель'],
		'BottomPanel'=>['C', 'Показывать нижнюю панель'],
		'DefaultTZ'=>['I', 'Часовой пояс по умолчанию <<в часах от GMT>>', 'comment'=>'+4 = Москва', 'size'=>4],
		'NumDec'=>['S', 'Кол-во знаков после запятой', 0, [0=>'нет (целые цисла)', 1=>'1 (.0)', 2=>'2 (.00)', 3=>'3 (.000)']]
	]
}

{include file='admin/footer.tpl'}
{/strip}