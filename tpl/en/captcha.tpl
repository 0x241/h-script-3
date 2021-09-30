{strip}
{include file='err.tpl' errs=['captcha_wrong'=>'wrong code']}
{if $class}
	{$class = " {$class}"}
{/if}
{$class = "captcha{$class}{$error_class}"}
{include file='captcha/box.tpl'}
{/strip}