{strip}
    {include file='header.tpl' title='Ticket'}

    {include file='tickets/_states.tpl'}

    {if $el.tID}

        {include file='edit.tpl'
        form='ticket'
        title='Ticket'
        fields=[
        'tID'=>[],
        'tState'=>
        [
        'X',
        'State',
        0,
        $_tstates[$el.tState]
        ],
        'tTopic'=>
        [
        'L',
        'Subject',
        'size'=>50,
        'readonly'=>true
        ],
        'tText'=>
        [
        'W',
        'Text',
        'size'=>10,
        'readonly'=>true
        ]
        ]
        values=$el
        btn_text=' '
        btns=valueIf($el.tState < 8, ['close'=>'Close Ticket'])
        }

        <table class="FromatTable">
            {foreach $list as $l}
                <tr><td width="250px"><td width="250px"><td width="250px"></tr>
                <tr>
                    {if $l.muID == $el.tuID}
                    <td colspan="2">
                        {else}
                    <td><td colspan="2">
                        {/if}
                        <fieldset>
                            {if $l.muID == $el.tuID}You{else}Support{/if}, {$l.mTS}<br>
                            {$l.mText}
                        </fieldset>
                    </td>
                </tr>
            {/foreach}
        </table><br>

        {if $el.tState < 8}

            {include file='edit.tpl'
            fields=[
            'tID'=>$el.tID,
            'mText'=>
            [
            'W',
            'Message!!',
            [
            'text_empty'=>'fill text'
            ],
            'size'=>10
            ]
            ]
            values=$el
            btn_text=' '
            btns=['answer'=>'Answer']
            }

        {/if}

    {else}

        {include file='edit.tpl'
        title='New ticket'
        fields=[
        'tTopic'=>
        [
        'L',
        'Subject!!',
        [
        'topic_empty'=>'type subject'
        ],
        'size'=>50
        ],
        'tText'=>
        [
        'W',
        'Текст!!',
        [
        'text_empty'=>'fill text'
        ],
        'size'=>15
        ]
        ]
        values=$el
        btn_text=' '
        btns=['create'=>'Create ticket']
        }

    {/if}

    {include file='footer.tpl'}
{/strip}