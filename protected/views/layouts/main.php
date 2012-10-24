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

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/jquery-ui-1.9.0.custom.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>

	<script src="<?php echo Yii::app()->request->baseUrl; ?>/assets/jquery-1.8.2.js"></script>
	<script src="<?php echo Yii::app()->request->baseUrl; ?>/assets/jquery-ui-1.9.0.custom.js"></script>
	<script>
	 $(function() {
	        $( "#draggable" ).draggable({ 
	                    revert: "valid",
            		    helper: "clone",
            	 drag: function( event, ui ) {
            	 	$(".store").slideUp();
	            }
	         });
	 
	        $( ".square" ).droppable({	           
	            hoverClass: "ui-state-active",
	            drop: function( event, ui ) {
	                 	$( this ).find( ".placeholder" ).remove();
               		$( '<div class="roue"></div>' ).text( ui.draggable.text() ).appendTo( this );
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
			<ul>
				<li><button class="show">LOOPS</button></li>
				<li><button class="show">TICKET D'OR</button></li>
				<li><button class="show">JAUGE</button></li>
				<li><button class="show">ACHAT</button></li>
				<li><button class="show">STORE</button></li>
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
				<div class="item">
					<div id="draggable" class="roue"></div>
					<span>5000$</span>
					<button id="opener">Open Dialog</button>
					<div class="dialog" title="Basic dialog"
    <p>This is an animated dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
</div>				
				</div>
				<br /><br /><br /><br />
			</div>
			<div id="tabs-2">
			</div>
			<div id="tabs-3">
			</div>
			</div>
		</div>			
			<?php for ($y = 0; $y < 9; $y++) 
				{ 	
					for ($x = 0; $x < 14; $x++)
					{
						echo '<div class="square"></div>';
					}					
				}
			?>			
		</div>
		<div class="notification">
				<p>NOTIFICATION</p>
		</div>
    </div>
</body>
</html>
