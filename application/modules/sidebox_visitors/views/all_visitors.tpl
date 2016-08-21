{if $visitors}
	{foreach from=$visitors key=user_id item=nickname}
		{$nickname},
	{/foreach}
{/if}

{if $guests}
	{$guests}

	{if $guests == 1}
		{lang("guest", "sidebox_visitors")}
	{else}
		{lang("guests", "sidebox_visitors")}
	{/if}.
{/if}