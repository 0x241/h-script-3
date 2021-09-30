{strip}
    {include file='admin/header.tpl' title='Queue'}

    {include file='sms/_statuses.tpl'}

    {include file='list.tpl'
    title='Queue'
    url='*'
    fields=[
    'qID' => ['ID'],
    'uLogin' => ['Sent'],
    'qFromTo' => ['To'],
    'qText' => ['Text'],
    'qState' => ['Status'],
    'qPartsPrice' => ['<small> Number <br> parts </small>'],
    'qError' => ['description'],
    'qErrCnt' => ['<small> attempted </small>']
    ]
    values=$list
    row='*'
    btns=['del'=>'Delete']
    }

    {include file='admin/footer.tpl'}
{/strip}