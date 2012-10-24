<?php 
require( 'protected/views/layouts/bdd.php' );
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/jquery-ui-1.9.0.custom.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>

	<script src="<?php echo Yii::app()->request->baseUrl; ?>/jquery/jquery-1.8.2.js"></script>
	<script src="<?php echo Yii::app()->request->baseUrl; ?>/jquery/jquery-ui-1.9.0.custom.js"></script>
	<script>
	 $(function() {
	        $( ".drag-item" ).draggable({ 
	                    revert: "valid",
            		    helper: "clone",
            	 drag: function( event, ui ) {
            	 	//$(".store").slideUp();
	            }
	         });
	 
	        $( ".square" ).droppable({	           
	            hoverClass: "ui-state-active",
	            drop: function( event, ui ) {
                	$( this ).find( ".placeholder" ).remove();

                	$( this ).empty();
                	item = ui.draggable.attr('data-item');
                	$( '<div class="square-'+ item +'"></div>').appendTo( this );
	            }
	        });
	    });
	$(document).ready(function(){
  		$(".hide2").click(function(){
   		$(".store").hide();
  	});
	 	$(".show").click(function(){
	    $(".store").show();
 	});
	 	$(".batiments").click(function(){
	    $(".batiments").show();
	});
	});
	// tabs for store
	 $(function() {
        $( "#tabs" ).tabs();
    });	
	// dialogs for items
	 $(function() {
        $( ".dialog" ).click(
        	function()
         {
       		 $( ".dialog" ).dialog({
       		 	show: "blind",
            	hide: "explode"
       		 });
    	});
    });
	 </script>
</head>
<body>
	<div class="header">		
	</div>
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
		<div class="maps">
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
				<div class="square"></div>
			<br /><br /><br />
			</div>
			<div id="tabs-2">
			</div>
			<div id="tabs-3">
			</div>
			</div>
		</div>	
			<?php 
				while ( $row = $map_info->fetch_object() )  
				{
					echo 
					'<div class="square square-bg">
						<div class="square-'. $row->id_item .'" data-x="'. $row->chunk_x .'" data-y="'. $row->chunk_y .'"></div>
					</div>';
				}
			?>			
		</div>
		<div class="notification">
				<p>NOTIFICATION</p>
		</div>
    </div>
</body>
</html>
