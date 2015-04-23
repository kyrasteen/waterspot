$(document).ready(function() {

  var slider = $('#slider').CircularSlider({
    radius: 75,
    innerCircleRatio: '0.5',
    handleDist: 1,
    min: 0,
    max: 10,
    value: 0,
    shape: "Circle",
    touch: true,
    animate: true,
    animateDuration : 360,
    selectable: false,
    slide: function(ui, value) {},
    formLabel: undefined
  });
});
