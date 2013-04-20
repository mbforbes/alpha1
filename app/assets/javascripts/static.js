$( document ).ready(function() {
    $( "a" ).click(function( event ) {
        alert( "Thanks for visiting!" );
    });

    $(".btmbar").mouseover(function() {
    	$(".btmbar").animate({
	    		height: 80,
	    	}
	    );
    });
});