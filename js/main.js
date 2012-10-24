$(function() {

 	// Map drag
        $( "#map_inner" ).draggable({ });

        $( ".drag-item" ).draggable({ 
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

             	$( this ).empty();
             	item = ui.draggable.attr('data-item');
             	$( '<div class="square-'+ item +'"></div>').appendTo( this );
            }
        });

    	// TAB
        $( "#tabs" ).tabs();
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

	// dialogs for items
        $( ".dialog" ).click(
        	function()
        	{
			$( ".dialog" ).dialog({
				show: "blind",
				hide: "explode"
       			});
    		}
    	);

});