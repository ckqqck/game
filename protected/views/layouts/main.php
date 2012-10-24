<?php 
require( 'protected/views/layouts/bdd.php' );
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="language" content="en" />

		<!--[if lt IE 8]>
		<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
		<![endif]-->

		<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />
		<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/jquery-ui-1.9.0.custom.min.css" />
		<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />

		<title><?php echo CHtml::encode($this->pageTitle); ?></title>

		<script src="<?php echo Yii::app()->request->baseUrl; ?>/jquery/jquery-1.8.2.js"></script>
		<script src="<?php echo Yii::app()->request->baseUrl; ?>/jquery/jquery-ui-1.9.0.custom.min.js"></script>
		<script src="<?php echo Yii::app()->request->baseUrl; ?>/js/main.js"></script>
	</head>
	<body>

		<div class="header"></div>

		<div class="wrapper">

			<div class="menu">
				<button class="show">STORE</button>	
				<ul>
					<li>
						<?php echo $user_info->money; ?><img src="images/loops.png" />
					</li>
					<li>
						<?php echo $user_info->golden_ticket; ?><img src="images/ticket_dor.png" />
					</li>
					<li>
						<?php echo $user_info->level; ?><img src="images/level.png" />
					</li>				
					<li>
						<?php echo $user_info->total_visit; ?><img src="images/people.png" />
					</li>
				</ul>					
			</div>
			<!-- Menu -->

			<div class="store">
				<div id="tabs">
					<ul>
						<li><a href="#tabs-1">Attractions</a></li>
						<li><a href="#tabs-2">Batiments</a></li>
						<li><a href="#tabs-3">Decors</a></li>
						<li><a href="#tabs-4">Sols</a></li>
					</ul>
					<div id="tabs-1">				
						<?php require( 'protected/views/layouts/get_item.php' ); ?>
					</div>
					<div id="tabs-2">
					</div>
					<div id="tabs-3">
					</div>
				</div>
			</div>

			<div id="map">
				<div id="map_inner">
					<?php
						$start = $user_info->map_x - ( $user_info->map_x / 2 )+1;
						$end = $user_info->map_x - ( $user_info->map_x / 2 )-1;
						$mid_vert = $user_info->map_y - ( $user_info->map_y / 2 );

						for( $y = 0; $y <= $user_info->map_y; $y ++ ){

							echo '<div class="square-line">';

							if( $y <= $mid_vert ){
								$start--;
								$end++;
							}
							else{
								$start++;
								$end--;
							}

							for( $x = 0; $x <= $user_info->map_x; $x++ ){

								if( $x >= $start && $x <= $end ){
									$item = 4;
									if( $map_final->{ $x.'-'.$y }->id_item != 1 )
										$item = $map_final->{ $x.'-'.$y } ->id_item;
								}
								else
									$item = 1;

								echo 
								'<div class="square square-bg">
									<div class="square-'.$item.'" data-x="'. $x .'" data-y="'. $y .'"></div>
								</div>';
							}

							echo '</div><br>';
						}
					?>
				</div>
			</div>
	    	</div>
		<!-- Wrapper -->

	</body>
</html>
