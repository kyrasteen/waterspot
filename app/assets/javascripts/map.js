$(document).ready(function() {
  L.mapbox.accessToken = 'pk.eyJ1Ijoia3lyYXdlYmVyIiwiYSI6IkNpTExOQU0ifQ.hIs3Lhi-wDaWM122_ZIvNQ';
  var map = L.mapbox.map('map', 'kyraweber.lp8mldi9')
    .setView([40, -94.50], 4)
    .addControl(L.mapbox.shareControl());

  map.legendControl.addLegend(document.getElementById('legend').innerHTML);
  map.featureLayer.on('click', function(e) {
    map.panTo(e.layer.getLatLng());
  });

  // DONE 0 - what does the datat look like? what what coords expect
  // 1 - serve json from rails
  // 2 - make an ajax request here for it
  // 3 - take response data and plug into rails

  $.getJSON("/spots", function(data) {
    // data already parsed into javascript by jquery

    data.forEach(function(spot) {
      console.log('spot: ', spot);
      L.marker([Number(spot.lat), Number(spot.long)], {
        icon: L.mapbox.marker.icon({
          'marker-size': 'small',
          'marker-symbol': 'circle-stroked',
          'marker-color': '#045A8D'
        })
      }).addTo(map);
    });
  });
});
