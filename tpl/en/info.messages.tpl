{strip}
{assign 
	var='info_msg'
	value=
		[
			'Completed'		=>'Completed',
			'Saved'			=>'Saved',
			'Canceled'		=>'Canceled',
			'Added'			=>'Added',
			'Deleted'		=>'Deleted',

			'LogIn'			=>'Logged in',
			'LogOut'		=>'Logged out',

			'*NoSelected'	=>'Select element(s)',
			'*CantComplete'	=>'Can\'t complete operation',
			'*AlreadyUsed'	=>'Already used',
			'*Error'		=>'The operation failed',
			'*ErrorCode'	=>'Error code',
			'*NoPage'		=>'Page not found',

			'*Denied'		=>'Access denied'
		] 
	scope='global'
}
{/strip}