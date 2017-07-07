$(document).ready(function() {

  $( "form" ).submit(function( event ) {
    event.preventDefault();
    console.log("entrando a la forma");
    $.post( "/rolls", function( data ){
      console.log(data);
      $('#die').html(data);
    });
  });
  
});
