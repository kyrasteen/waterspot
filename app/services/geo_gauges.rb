class GeoGauges
  def self.create(gauges)
    gauges.map do |gauge|
      {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [gauge.long, gauge.lat]
        },
        properties: {
          name: gauge.name,
          value: gauge.value,
          "marker-color"=>  "#ffffff",
          "marker-symbol"=> "warehouse",
          "marker-size"=>   "small"
        }
      }
    end
  end
end
