$(document).ready(function() {
  console.log("adentro de jquery");

  $( "form" ).submit(function( event ) {
    // alert( "Handler for .submit() called." );
    event.preventDefault();
    // $( "<div>" )
    //   .append( "default " + event.type + " prevented" )
    console.log( "*********serialize***********");
    var allInputs = $( ":input" );
    var rolls = allInputs[0].value
    console.log( rolls );
    //var name = $("#submit1.attr('value')";
    //console.log(name);
//    console.log( $( this ).serialize() );


    var info = $( this ).serialize(); 
    $.post( "/new", {info: info, rolls: rolls}, function( data ){
      console.log("data del post_rolls_ajax", data);
      $('#die').html(data);
    });
  });
  
});
