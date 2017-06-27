$(document).ready(function () {
  // Escribe tu código aquí
  $("#tab1").show();

  $('ul.tabs li').click(function(){
    $('.tab').hide();
    
    var tab_id = $(this).children("a").attr("href");
    //console.log(tab_id);
    $('ul.tabs li').removeClass('active');
    $(this).addClass('active');
    $(tab_id).show();
  })

});
