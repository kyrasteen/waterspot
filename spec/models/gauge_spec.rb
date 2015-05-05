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

  it "creates gauge objects from api data" do
    Gauge.create_from_api("co")
    expect(Gauge.all.count).to eq(336)
  end

  xit "updates value of a gauge" do
    gauge = Gauge.create(lat:39, long:-104.6, name: "OSELIGEE CREEK NEAR LANETT AL", value: "88", state: "al")
    Gauge.update_values
    expect(gauge.value).not_to eq("88")
  end
end
