$(document).ready(function() {
  var $username = $('#username-field')

  $username.on("focus", function() {
    showHint();
  })

  $username.on("blur", function() {
    removeHint();
  })

  $('#confirm-password').on("change keyup", function() {
    checkAccuracy();
  })

})

function showHint() {
  var $nav = $('.large-nav')
  $nav.append('<p class="hints">Enter your Twitter username to login with Twitter in the future!</p>')
}

function removeHint() {
  var $hints = $('.hints');
  $hints.fadeOut("slow", function() {
    $hints.children().remove();
  });
}

function checkAccuracy() {
  var $passConfirm = $("#confirm-password")
  if($passConfirm.val() === $("#password").val()) {
    $passConfirm.css("color", "green");
    $("#submit-user").css("pointer-events", "auto")
  }
  else {
    $passConfirm.css("color", "red");
  }
}
