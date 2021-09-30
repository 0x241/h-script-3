{strip}
{include file='admin/header.tpl' title='Settings'}

    {include file='edit.tpl'
    values=$cfg
    fields=[
    'Word'=>['T', 'To enable <b>ref.system<b><br>specify the word in a ref-link', 'comment'=>'../?<u>ref</u>=..'],
	'Force'=>['C', 'Force rewrite new ref in cookies'],
    'Levels'=>['I', 'Number of shown levels <<for multilevel>>'],
        1=>'Add funds',
        'Type'=>['S', 'Type', '', [
                       'Multilevel'=>'',
          0=>'<rate> up-level',
                       'one level'=>'',
          2=>'&nbsp;from_num_of_actives_refers&nbsp;-&nbsp;rate(%)&nbsp;',
          3=>'&nbsp;from_sum_depo_refers&nbsp;-&nbsp;rate(%)&nbsp;',
          4=>'&nbsp;from_sum_active_depo_of_user&nbsp;-&nbsp;rate(%)&nbsp;'
    ]],
    '_Perc'=>['A', 'Values', 'size'=>5],
    'Deposit',
    'DType'=>['S', 'Type', '', [
    'Multilevel'=>'',
    0=>'<rate> up-level',
    'one level'=>'',
    2=>'&nbsp;from_num_of_actives_refers&nbsp;-&nbsp;rate(%)&nbsp;',
    3=>'&nbsp;from_sum_depo_refers&nbsp;-&nbsp;rate(%)&nbsp;',
    4=>'&nbsp;from_sum_active_depo_of_user&nbsp;-&nbsp;rate(%)&nbsp;'
    ]],
    '_DPerc'=>['A', 'Values', 'size'=>5],
    'Accrual',
    'PType'=>['S', 'Type', '', [
    'Multilevel'=>'',
    0=>'<rate> up-level',
    'one level'=>'',
    2=>'&nbsp;from_num_of_actives_refers&nbsp;-&nbsp;rate(%)&nbsp;',
    3=>'&nbsp;from_sum_depo_refers&nbsp;-&nbsp;rate(%)&nbsp;',
    4=>'&nbsp;from_sum_active_depo_of_user&nbsp;-&nbsp;rate(%)&nbsp;'
    ]],
    '_PPerc'=>['A', 'Values', 'size'=>5]
    ]
    }

    {include file='admin/footer.tpl'}
{/strip}