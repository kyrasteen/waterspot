require "rails_helper"

describe "Gauge", type: :model do
  it "has valid attributes" do
    gauge = Gauge.create(geometry: { coordinates: [32, -88] }, properties:
                     { name: "Clear Creek", value: "80" })
    expect(gauge.properties["name"]).to eq("Clear Creek")
    expect(gauge.properties["value"]).to eq("80")
    expect(gauge.geometry["coordinates"]).to eq("[32, -88]")

  end
end
