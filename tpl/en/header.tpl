{strip}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>{if $title}{$title} | {/if}{$_cfg.Sys_SiteName}</title>
		<base href="{$root_url}" />
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="stylesheet" type="text/css" href="{$css_path}main.css">
		<script type="text/javascript" src="{$js_path}jquery.js"></script>
	</head>
	<body><center>
	{if !$short}
		{include file='line.top.tpl'}
		<div class="_body">
		{if $_cfg.UI_TopPanel}
			{include file='panel.top.tpl'}
		{/if}
		<table class="formatTable" width="100%">
		<tr>
			{if $_cfg.UI_LeftPanel}
				<td class="_panel">
					{include file='panel.left.tpl'}
				</td>
			{/if}
			<td align="center" valign="top">
				{include file='line.main.tpl'}
				{include file='info.tpl' _info=$tpl_info}
				<div class="_content">
	{/if}
{/strip}