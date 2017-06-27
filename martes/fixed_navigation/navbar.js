
$(document).on('scroll', function (e) {
    var o = $(document).scrollTop() / 50;
    if (o > 0.01) { 
      $('.top-nav').css('opacity', 0.5);}
    else {
      $('.top-nav').css('opacity', 1);
    }
});