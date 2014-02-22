$( document ).ready(function() {
  $('header').on('click', function(){
  	window.location = "/"
  })

  $('.locale').on('click', function(event){
    event.stopPropagation();
    var current_location = window.location.href;
    var current_host     = window.location.host;
    var new_locale       = $(this).find('span').text();
    window.location      = current_location.replace(
      new RegExp(window.location.host + "\/(ru|en)*"), window.location.host + "/" + new_locale);
  })
});
