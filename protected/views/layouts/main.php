<?php /* @var $this Controller */ ?>
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

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>

	<script src="<?php echo Yii::app()->request->baseUrl; ?>/assets/jquery-1.8.2.js"></script>
	<script src="<?php echo Yii::app()->request->baseUrl; ?>/assets/jquery-ui-1.9.0.custom.js"></script>
	<script>
	 $(function() {
	        $( "#draggable" ).draggable({ 
	                    revert: "valid",
            		helper: "clone" 
            	});
	 
	        $( ".square" ).droppable({
	            activeClass: "ui-state-hover",
	            hoverClass: "ui-state-active",
	            drop: function( event, ui ) {
	                 	$( this ).find( ".placeholder" ).remove();
               		$( '<div class="square2"></div>' ).text( ui.draggable.text() ).appendTo( this );
	            }
	        });
	    });
    	</script>
</head>

<body>
	<div class="header">		
	</div>
	<div class="wrapper">
		<div class="menu">
			<ul>
			<li>LOOPS</li>
			<li>TICKET D'OR</li>
			<li>JAUGE</li>
			<li>ACHAT</li>
			<li>STORE</li>
		</ul>
		</div>
		<div id="draggable" class="square2"></div>

		<div class="maps">
			<?php for ($x = 0; $x < 27; $x++) 
			{ 	
				for ($y = 0; $y < 18; $y++)
				{
					echo '<div class="square"></div>';
				}					
			}
			?>
		<div class="notification">
			<p>NOTIFICATION</p>
		</div>
	</div>
</body>
</html>
