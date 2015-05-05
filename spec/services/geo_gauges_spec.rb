require "rails_helper"

describe "GeoGauges" do
  it "formats gauge to geoJSON" do
    gauge = Gauge.create(name: "Clear Creek", value: "99", state: "co", lat:39, long:-104.6)
    geo_gauges = GeoGauges.create([gauge])
    expect(geo_gauges.first[:type]).to eq("Feature")
  end
end
