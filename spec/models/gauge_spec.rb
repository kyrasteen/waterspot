require "rails_helper"

describe "Gauge", type: :model do
  it "has valid attributes" do
    gauge = Gauge.create(lat: 32, long: -88.4, name:
                         "Clear Creek", value: "80")
    expect(gauge.name).to eq("Clear Creek")
    expect(gauge.value).to eq("80")
    expect(gauge.lat).to eq(32)
    expect(gauge.long).to eq(-88.4)
  end
end
