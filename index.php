<?php 
set_include_path(get_include_path() . PATH_SEPARATOR . 'phpseclib');
include('Net/SSH2.php');
$host="103.227.253.209";
$root_password="Tempik12";

$ssh = new Net_SSH2($host);
 if (!$ssh->login('root', $root_password)) {
    echo "login gagal";
 }else{
 	echo "login berhasil";
 }


 ?>