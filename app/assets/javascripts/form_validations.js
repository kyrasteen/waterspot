$(document).ready(function() {
  var $username = $('#username-field')
  var $nav      = $('.large-nav')

  $username.on("focus", function() {
    showHint($nav);
  })

  $username.on("blur", function() {
    removeHint();
  })

  $('#confirm-password').on("change keyup", function() {
    checkAccuracy();
  })
})

function showHint(nav) {
  nav.append('<p class="hints">Enter your twitter username to login with twitter in the future!</p>')
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
  }
  else {
    $passConfirm.css("color", "red");
  }
}
