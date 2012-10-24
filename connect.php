<?php
$host		= '127.0.0.1';
$user		= 'root';
$password	= 'anbazin';
$bdd 		= 'coaster';


// Connection
$link = new mysqli( $host, $user, $password, $bdd );


if ( $link->connect_error)
	die( debug('Connect DB Error') );

$link->set_charset("utf8");
?>

