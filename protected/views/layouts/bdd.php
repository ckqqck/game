<?php 

$host		= '127.0.0.1';
$user		= 'root';
$password	= '';
$bdd 		= 'coaster';


// Connection
$link = new mysqli( $host, $user, $password, $bdd );


if ( $link->connect_error)
	die( debug('Connect DB Error') );

$link->set_charset("utf8");



// USER INFO
$user_query = 
	'SELECT u.*, l.*, m.*
	FROM `user` AS u
	LEFT JOIN `level` AS l ON l.id_level = u.level
	LEFT JOIN `map` AS m ON m.id_map = u.id_map
	WHERE u.id_user = "1" 
	LIMIT 1';

$user_info = $link->query( $user_query )->fetch_object();

// BONUS
$bonus_query = 
	'SELECT b.*
	FROM `bonus` AS b
	WHERE id_user = "'. $user_info->id_user .'" && time_end >= "'. date( 'Y-m-d H:i:s' ).'"
	';

$bonus_info = $link->query( $bonus_query )->fetch_object();


// MAP INFO
$map_query = 
	'SELECT c.*, i.*, e.pending, u.level
	FROM `chunk` AS c
	LEFT JOIN `item` AS i ON i.id_item = c.id_item
	LEFT JOIN `employee` AS e ON e.id_chunk = c.id_chunk
	LEFT JOIN `user` AS u ON u.id_user = e.id_user
	WHERE c.id_map = "'. $user_info->id_map .'" ';

$map_info = $link->query( $map_query );


// QUEST INFO
$quest_query = 
	'SELECT uq.*, q.*
	FROM `user_quest` AS uq
	LEFT JOIN `quest` AS q ON q.id_quest = uq.id_quest
	WHERE uq.id_user = "'. $user_info->id_map .'" ';

$quest_info = $link->query( $quest_query );

?>
<pre>
<?php
	print_r( $user_info );
	print_r( $bonus_info );
	print_r( $quest_info );
	print_r( $map_info );
?>
</pre>