class GeoGauges
  def self.create(gauges)
    gauges.map do |gauge|
      {
        type: "Feature",
        geometry: {
          type: gauge.geometry["type"],
          coordinates: JSON.parse(gauge.geometry["coordinates"])
        },
        properties: {
          name: gauge.properties["name"],
          value: gauge.properties["value"],
          "marker-color"=>  "#ffffff",
          "marker-symbol"=> "warehouse",
          "marker-size"=>   "small"
        }
      }
    end
  end
end
