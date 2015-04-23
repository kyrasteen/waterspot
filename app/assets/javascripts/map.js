$(document).ready(function() {
  L.mapbox.accessToken = 'pk.eyJ1Ijoia3lyYXdlYmVyIiwiYSI6IkNpTExOQU0ifQ.hIs3Lhi-wDaWM122_ZIvNQ';
  var map = L.mapbox.map('map', 'kyraweber.lp8mldi9')
  .setView([40, -94.50], 4)
  .addControl(L.mapbox.shareControl());

  map.legendControl.addLegend(document.getElementById('legend').innerHTML);
  var spotLayer = L.mapbox.featureLayer().addTo(map);

  spotLayer.on('layeradd', function(e) {
    var marker, popupContent, properties;
    marker = e.layer;
    properties = marker.feature.properties;
    popupContent = '<p>hello </p>' + properties.name + properties.date
    return marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 300
    });
  });

  $.ajax({
    dataType: 'text',
    url: '/spots.json',
    success: function(data) {
      var geojson;
      geojson = $.parseJSON(data);
      return spotLayer.setGeoJSON(geojson);
    }
  });
});
