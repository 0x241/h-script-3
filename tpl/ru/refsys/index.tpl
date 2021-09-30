{strip}
{include file='header.tpl' title='Реферальная система'}

<h1>Реферальная система</h1>


{*----inviter: pouop---*}
	<style>	{*----style for popup window---*}
		.overlay { display:none; position:fixed; z-index:999; opacity:0.5; filter:alpha(opacity=50); top:0; right:0; left:0; bottom:0; background:#000; }
		.popup  { display:none; position:fixed; border:3px solid #999; background:#fff; width:394px; height:194px; top:50%; left:50%; margin:-100px 0 0 -100px; z-index:1000;  border-radius:10px; padding:30px;}
		.close { display:block; width:12px; text-align:center; cursor:pointer;  height:12px; line-height:12px; background:#fff; color:red; border:3px solid red;  position:absolute; top:10px; right:10px; text-decoration:none; border-radius:3px; font-size:10px; }
	</style>

	<div class="overlay"></div>
	<div class="popup" id="popup1">
		<span class="close">X</span>
	{include file='edit.tpl'
		fields=[
			'InvLogin'=>
				[
					'X',
					'Вас пригласил',
					0,
					{$reflogin},
					'skip'=>!$reflogin
				],
			'InvAvatar'=>
			[
				'X',
				"{include file='_usericon.tpl' user=$upref}"
			],
			'InvName'=>
				[
					'X',
					'Имя:',
					0,
					{$upref.aName},
					'skip'=>!$upref
				],
			'InvE-mail'=>
				[
					'X',
					'E-mail:',
					0,
					"<a href=\"mailto:{$upref.uMail}\" >{$upref.uMail}</a>"
				]

		]
		btn_text=' '
	}
	</div>
{*-end inviter popup*}

{if _uid()}

	{include file='edit.tpl'
		fields=[
			'RefLogin'=>
				[
					'X',
					'Вас пригласил',
					0,
					"<a href='javascript:void(0);'><span class='open_popup' rel='popup1'>{$reflogin}</span></a>",
					'skip'=>!$reflogin
				],
			'RefURL'=>
				[
					'X',
					'Ваша реф-ссылка',
					0,
					"<a href=\"{$refurl}\" target=\"_blank\">{$refurl}</a>"
				]
		]
		btn_text=' '
	}

	{if $maxlevel > 1}
	{for $i = 1 to $maxlevel}
		{if $i > 1}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;{/if}
		<a href="{_link module='refsys'}?level={$i}" class="">Уровень {$i}</a>
	{/for}
	{/if}

	<h2>Уровень {$level}</h2>

{$cid = [
'USD' => exValue(1, reset($vcurrs.USD)),
'EUR' => exValue(1, reset($vcurrs.EUR)),
'RUB' => exValue(1, reset($vcurrs.RUB)),
'BTC' => exValue(1, reset($vcurrs.BTC)),
'ETH' => exValue(1, reset($vcurrs.ETH)),
'XRP' => exValue(1, reset($vcurrs.XRP))
]}

	<table class="list">
	<tr>
		<th>ВСЕГО по Уровень {$level}
		{foreach $vcurrs as $curr => $cids}
			{if (!in_array($curr,$ccurs))}
			{continue}
			{/if}
		<th>{$curr}
		{/foreach}
	<tr>
		<td>Оборот
		{foreach $vcurrs as $curr => $cids}
				{if (!in_array($curr,$ccurs))}
					{continue}
				{/if}<td align="right">
				{_z($list2[$curr]['ZDepo'], $cid[$curr])}
		{/foreach}
	<tr>
		<td>Реф.бонус
		{foreach $vcurrs as $curr => $cids}
			{if (!in_array($curr,$ccurs))}
				{continue}
			{/if}
			<td align="right">{_z($list2[$curr]['ZRef'], $cid[$curr])}{/foreach}
	</table>
<br>

	{foreach $ccurs as $c}
		{$zdepo["ZDepo$c"]=["<small>Оборот<br>$c</small>"]}
	{/foreach}

	{foreach $ccurs as $c}
		{$zref["ZRef$c"]=["<small>Реф<br>$c</small>"]}
	{/foreach}

	{include file='list.tpl'
		fields=[
			'uLogin'=>['Пользователь'],
			'uMail'=>['e-mail'],
			'aCTS'=>['Дата регистрации']
		]+$zdepo+$zref
		values=$list
		row='*'
		linkparams="&level={$level}"
	}

	{if $_cfg.Account_RegMode == 3}
	
		<h2>Инвайты</h2>
		
	{/if}
	
{/if}

<h2>Рекламные материалы</h2>

Здесь будут баннеры и кнопки

	<script> {* Script for popup*}
		$('.open_popup').click(function() {
			var popup_id = $('#' + $(this).attr("rel"));
			$(popup_id).show();
			$('.overlay').show();
		});

		$('.popup .close, .overlay').click(function() {
			$('.overlay, .popup').hide();
		});
	</script>

{include file='footer.tpl'}
{/strip}