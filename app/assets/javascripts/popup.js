$(document).ready( function() {
  $("#rating").on("click", function() {
    $("#popup").addClass("show");
  });

  $("#close").click(function(){
    $("#popup").addClass("hide");
  });

  // if(!localStorage["alertdisplayed"]) {
      // $("#home-popup").addClass("show");

    $("#close-btn").click(function(){
      $("#home-popup").addClass("hide");
    });

    // localStorage["alertdisplayed"] = true
//  }
});
