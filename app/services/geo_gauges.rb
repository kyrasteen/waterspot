class GeoGauges
  def self.create(gauges)
    gauges.map do |gauge|
      {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [gauge.sourceInfo['geoLocation']['geogLocation']['longitude'], gauge.sourceInfo['geoLocation']['geogLocation']['latitude']]
        },
        properties: {
          name: gauge.sourceInfo["siteName"],
          value: gauge.values[0]['value'][0]['value'],
          "marker-color"=>  "#ffffff",
          "marker-symbol"=> "warehouse",
          "marker-size"=>   "small"
        }
      }
    end
  end
end
