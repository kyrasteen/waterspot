class GeoGauges
  def self.create(gauges)
    gauges.map do |gauge|
      {
        type: "Feature",
        geometry: {
          type: "Polygon",
          coordinates: []
        },
        properties: {
          name: value.sourceInfo.siteName,
          value: value.values[0].value[0].value,
          "marker-color":  "#ffffff",
          "marker-symbol": "warehouse",
          "marker-size":   "small"
        }
      }
    end
  end
end
