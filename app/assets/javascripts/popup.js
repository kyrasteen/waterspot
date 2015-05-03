$(document).ready( function() {
  $("#rating").on("click", function() {
    $("#popup").addClass("show");
  });

  $("#close").click(function(){
    $("#popup").addClass("hide");
  });
});
