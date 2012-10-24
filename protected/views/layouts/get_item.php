<?php

 //$type  = $_GET['type'];
 $type  = 'carousel';

$real_type = array( 'carousel', 'shop', 'decoration', 'flooring' );

if( in_array( $type, $real_type ) ){
	$items = $link->query( 
	                      'SELECT i.*, ui.id_user
				FROM `item` AS i
				LEFT JOIN `user_item` AS ui ON ui.id_item = i.id_item
				WHERE i.type = "'. $type .'" && ( id_user = "'. $user_info->id_user .'" OR id_user IS NULL )
				' );
}

if( $items->num_rows ){

	while ( $item = $items->fetch_object() )  
	{
		if( 
		   	( $item->unlock_type  == 'level' && $user_info->level >= $item->unlock_amount)
		   OR 
		   	( $item->unlock_type  == 'xp' && $user_info->score_total >= $item->unlock_amount )
		   OR 
		   	( ($item->unlock_type  == 'loops' OR $item->unlock_type  == 'golden' ) && $item->id_user  )
		   )
		{
			$locked = 'unlocked';
		}
		else
		{
			$locked = 'locked';
		}

		echo 
		'<div class="square '. $locked .'">
			<div class="square-'. $item->id_item .'" data-lenghtx="'. $item->item_x .'" data-lenghty="'. $item->item_y .'"></div>
		</div>';
	}
}