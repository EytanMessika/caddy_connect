$(document).ready(function() {
  $( "#title_1" ).click(function() {
    $("#content_1").delay( 900 ).slideToggle();
  }).first().delay( 900 ).click();


  $( "#title_2" ).click(function() {
    $("#content_2").delay( 1100 ).slideToggle();
  }).first().click();
});