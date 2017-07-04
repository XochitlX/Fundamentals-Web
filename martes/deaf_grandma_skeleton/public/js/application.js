$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 

  $( "form" ).submit(function( event ) {
    alert( "Handler for .submit() called." );
    event.preventDefault();
    console.log( $( this ).serialize() );
    var info = $( this ).serialize(); 
    $.post( "/abuelita", info, function( data ){
      console.log(data);
      $('#info_here').html(data);
    });
  });



});
