<?php

if (version_compare(PHP_VERSION, '5.6.0', '<'))
	require_once('lib/tplutils53.php');
elseif (version_compare(PHP_VERSION, '7.2.0', '<'))
	require_once('lib/tplutils56.php');
else
	require_once('lib/tplutils72.php');