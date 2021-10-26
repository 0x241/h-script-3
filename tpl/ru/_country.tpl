{strip}
{include file="geoip2/countries.tpl"}
{$c = giGetCountry($ip)}
{if $c == 'AA'}
	Localhost
{else}
	<img src="/static/images/flags/{$c}.png" width="15" height="10"> {$countries[$c]}
{/if}
{/strip}