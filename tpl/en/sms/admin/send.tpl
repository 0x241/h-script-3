{strip}
{include file = 'admin/header.tpl' title = 'Send SMS'}

{include file = 'edit.tpl'
fields = [
'From' => ['T', 'Sender << empty - "default" >>', ['from_wrong' => 'invalid sender']],
'To' => ['T', 'Number of the recipient', ['to_wrong' => 'invalid number of the recipient']],
'Text' => ['W', 'text', ['msg_empty' => 'enter message', 'msg_too_long' => 'Message too long'], 'size' => 5]
]
btn_text = ''
btns = ['send' => 'Send']
}

{include file = 'admin/footer.tpl'}
{/strip}