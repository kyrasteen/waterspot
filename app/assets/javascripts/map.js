$(document).ready(function() {
  L.mapbox.accessToken = 'pk.eyJ1Ijoia3lyYXdlYmVyIiwiYSI6IkNpTExOQU0ifQ.hIs3Lhi-wDaWM122_ZIvNQ';

  var map = L.mapbox.map('map', 'kyraweber.lp8mldi9')
  .setView([40, -94.50], 4)
  .addControl(L.mapbox.shareControl());
  map.legendControl.addLegend(document.getElementById('legend').innerHTML);

  var spotLayer = L.mapbox.featureLayer().addTo(map);
  var stationLayer = L.mapbox.featureLayer().addTo(map);

  var stationjson = [
    {
      sourceInfo: {
        siteName: "POTOMAC RIVER NEAR WASH, DC LITTLE FALLS PUMP STA",
        geoLocation: {
          geogLocation: {
            srs: "EPSG:4326",
            latitude: 38.94977778,
            longitude: -77.12763889
          }
        }
      },
      values: [{
        value: [{
          value: "25200",
          dateTimeAccuracyCd: null,
          qualifiers: ["P"]
        }]
      }]
    },
    {
      sourceInfo: {
        siteName: "HELL CREEK ABV NF NORTH PLATTE RIVER NR WALDEN, CO",
        geoLocation: {
          geogLocation: {
            srs: "EPSG:4326",
            latitude: 40.7327222,
            longitude: -106.4250444
          }
        }
      },
      values: [{
        value: [{
          value: "8.4",
          dateTimeAccuracyCd: null,
          qualifiers: ["P"]
        }]
      }]
    }
  ]

  var geojson = []

  function parse_station(value) {
    station = {
      type: "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [
          value.sourceInfo.geoLocation.geogLocation.longitude,
          value.sourceInfo.geoLocation.geogLocation.latitude
        ]
      },
      "properties": {
        "name": value.sourceInfo.siteName,
        "value": value.values[0].value[0].value,
        "marker-color": "#ffffff",
        "marker-symbol": "warehouse",
        "marker-size": "medium"
      }
    }
    geojson.push(station);
  };

  stationjson.forEach(parse_station);

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

  stationLayer.setGeoJSON(geojson);

  spotLayer.on('layeradd', function(e) {
    var marker, popupContent, properties;
    marker = e.layer;
    properties = marker.feature.properties;
    popupContent = "<h3 class='popup'>user: " + properties.name + "</h3>" + "<h3 class='popup'> date: "
    + properties.date + "</h3>" + "<h3 class='popup'>rating: " + properties.rating + "</h3>";
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
