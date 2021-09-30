{strip}
{include file='admin/header.tpl' title='Interface'}

{include file='edit.tpl' 
	values=$cfg
	fields=[
		'_Langs'=>['A', 'Interface languages (folder names in "/tpl/")', 'size'=>4],
		'ShowIntro'=>['S', "Show <a href=\"{_link module='udp/intro'}\" target=\"_blank\">intro</a> <<Intro>>", 0, [0=>'no', 1=>'only first time', 2=>'always']],
		'TopPanel'=>['C', 'Show top panel'],
		'LeftPanel'=>['C', 'Show left panel'],
		'RightPanel'=>['C', 'Show right panel'],
		'BottomPanel'=>['C', 'Show bottom panel'],
		'DefaultTZ'=>['I', 'Time zone by default <<in hours GMT>>', 'comment'=>'+4 = Moscow', 'size'=>4],
		'NumDec'=>['S', 'Number of decimal places', 0, [0=>'no decimal (only integer)', 1=>'1 (.0)', 2=>'2 (.00)', 3=>'3 (.000)']]
	]
}

{include file='admin/footer.tpl'}
{/strip}