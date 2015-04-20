$(document).ready(function() {
  L.mapbox.accessToken = 'pk.eyJ1Ijoia3lyYXdlYmVyIiwiYSI6IkNpTExOQU0ifQ.hIs3Lhi-wDaWM122_ZIvNQ';
  var map = L.mapbox.map('map', 'kyraweber.lp8mldi9')
.setView([40, -94.50], 4)
  .addControl(L.mapbox.shareControl());
  map.legendControl.addLegend(document.getElementById('legend').innerHTML);
  map.featureLayer.on('click', function(e) {
            map.panTo(e.layer.getLatLng());
                });
  L.marker([37.9, -77], {
    icon: L.mapbox.marker.icon({
      'marker-size': 'small',
      'marker-symbol': 'circle-stroked',
      'marker-color': '#045A8D'
    })
  }).addTo(map);
});
