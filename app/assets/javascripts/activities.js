// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $(".read-activity").on("click", function() {
    var id = $(this).data("id");
    $.ajax({
      type: "PATCH",
      url: "/activities/" + id + ".js"
    });
  });
});
