$(document).ready(function() {

  $('#new_spot').on('submit', function(event) {
    $.getJSON('/api/v1/polygons').
      then(function(data) {
      var polygons = data;

      $.getJSON('/api/v1/spots/:id'). //does not matter what id is????
        then(function(spot) {
        polygons.forEach(function(polygon) {
          turfInside(polygon, spot[0]);
        });
      })
    })
  })

  //$.post('/api/v1/area_watches')
function turfInside(polygon, spot) {
  if(turf.inside(spot, polygon)) {
    $.ajax({
      dataType: 'text',
      type: 'post',
      url: '/api/v1/area_watches',
      data : { data_value: JSON.stringify(spot), data_poly: JSON.stringify(polygon) }
    })
  }
}

  L.mapbox.accessToken = 'pk.eyJ1Ijoia3lyYXdlYmVyIiwiYSI6IkNpTExOQU0ifQ.hIs3Lhi-wDaWM122_ZIvNQ';

  var southWest = L.latLng(26.412, -115.927),
    northEast = L.latLng(53.774, -78.125),
    bounds = L.latLngBounds(southWest, northEast);

  var map = L.mapbox.map('map', 'kyraweber.lp8mldi9', {
    maxZoom: 19,
    minZoom: 2
  })
  .setView([39.7, -104.50], 7)

  var mousemove = document.getElementById('mousemove');

  map.on('mousemove', function(e) {
    window[e.type].innerHTML = e.containerPoint.toString() + ', ' + e.latlng.toString();
  });

  var featureGroup = L.featureGroup().addTo(map);

  var drawControl = new L.Control.Draw({
    edit: {
      featureGroup: featureGroup
    },
    draw: {
      polygon: true,
      polyline: false,
      rectangle: false,
      circle: false,
      marker: false
    }
  }).addTo(map);

  map.on('draw:created', showPolygonArea);
  map.on('draw:edited', showPolygonAreaEdited);
  map.on('draw:created', savePolygon);

  var spotLayer = L.mapbox.featureLayer().addTo(map);
  var stationLayer = L.mapbox.featureLayer().addTo(map);

  function savePolygon(e) {
    var type = e.layerType;
    var layer = e.layer;
    var geopolygon = layer.toGeoJSON();
    $("nav").append("<p id='area_notice'>Area saved</p>")
    $.ajax({
      url : "/api/v1/polygons.json",
      type : "post",
      data : { data_value: JSON.stringify(geopolygon) }
    });
  }

  function showPolygonAreaEdited(e) {
    e.layers.eachLayer(function(layer) {
      showPolygonArea({ layer: layer });
    });
  }
  function showPolygonArea(e) {
    featureGroup.clearLayers();
    featureGroup.addLayer(e.layer);
  }

  stationLayer.on('layeradd', function(e) {
    var marker, popupContent, properties;
    marker = e.layer;
    properties = marker.feature.properties;
    popupContent = "<h3 class='gauge-pop'>gauge name: " + properties.name + "</h3>" +
      "<h3 class='gauge-pop'>cfs: " + properties.value + " </h3>"
    return marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 300
    });
  });

  spotLayer.on('layeradd', function(e) {
    var marker, popupContent, properties;
    marker = e.layer;
    properties = marker.feature.properties;
    popupContent = "<h3 class='popup'>user: " + properties.name + "</h3>" + "<h3 class='popup'> date: "
    + properties.date + "</h3>" + "<h3 class='popup'>rating: " + properties.rating + "</h3>" +
      "<img src=" + properties.avatar + "></img>";
    return marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 300
    });
  });

  setTimeout(function() {
    $(".leaflet-clickable").on("click", $(this), function() {
      setTimeout(function(){
        $.ajax({
          dataType: 'json',
          url: "/api/v1/gauges/" + $('.leaflet-popup-content').text(),
          type: "get",
          success: function(data) {
            return stationLayer.setGeoJSON(data);
          }
        })
      }, 500)
    })
  }, 2000);

  $.ajax({
    dataType: 'text',
    url: '/api/v1/spots',
    success: function(data) {
      var geojson = $.parseJSON(data);
      return spotLayer.setGeoJSON(geojson);
    }
  });
});
