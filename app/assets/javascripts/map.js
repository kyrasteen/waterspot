$(document).ready(function() {

  $('#new_spot').on('submit', function(event) {
    $.ajax({
      dataType: 'json',
      type: 'get',
      url: '/api/v1/polygons',
      success: function(data) {
        var polygons = data;

        $.ajax({
          dataType: 'json',
          url: '/api/v1/spots/:id', //does not matter what id is????
          type: "get",
          success: function(spot) {
            polygons.forEach(function(polygon) {
              turfInside(polygon, spot[0]);
            });
          },
        });
      }
    })

    //include token in header jquery docs authorization header??????
    function turfInside(polygon, spot) {
      debugger;
      if(turf.inside(spot, polygon)) {
        $.ajax({
          dataType: 'text',
          type: 'post',
          url: '/api/v1/area_watch',
          data : { data_value: JSON.stringify(spot), data_poly: JSON.stringify(polygon) }
        })
      }
    }
  });

  L.mapbox.accessToken = 'pk.eyJ1Ijoia3lyYXdlYmVyIiwiYSI6IkNpTExOQU0ifQ.hIs3Lhi-wDaWM122_ZIvNQ';

  var map = L.mapbox.map('map', 'kyraweber.lp8mldi9')
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

  function savePolygon(e) {
    var type = e.layerType;
    var layer = e.layer;
    var geopolygon = layer.toGeoJSON();
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

  var spotLayer = L.mapbox.featureLayer().addTo(map);
  var stationLayer = L.mapbox.featureLayer().addTo(map);

  $('#map').on("click", "path.leaflet-clickable", function() {
    $.ajax({
      dataType: 'json',
      url: "/api/v1/gauges/" + $('.marker-title').text(),
      type: "get",
      success: function(data) {
        return stationLayer.setGeoJSON(data);
      }
    })
  });

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
      "<img src=assets/" + properties.avatar + "></img>";
    return marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 300
    });
  });

  $.ajax({
    dataType: 'text',
    url: '/api/v1/spots',
    success: function(data) {
      var geojson = $.parseJSON(data);
      return spotLayer.setGeoJSON(geojson);
    }
  });
});
