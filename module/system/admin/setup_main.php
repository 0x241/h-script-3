<?php

$module = 'Sys';
require_once('module/admin/setup.php');




$ip='';
try
{

    $curl_handle=curl_init();
    curl_setopt($curl_handle, CURLOPT_URL,'http://h-script.com/ip');
    curl_setopt($curl_handle, CURLOPT_CONNECTTIMEOUT, 2);
    curl_setopt($curl_handle, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl_handle, CURLOPT_USERAGENT, 'Your application name');
    $ip = curl_exec($curl_handle);
    curl_close($curl_handle);

}


catch (Exception $e)
{
}

SetPage('ip', $ip);
showPage();

?>