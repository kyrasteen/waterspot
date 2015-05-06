require "rails_helper"

describe "Gauge", type: :model do
  let(:gauge) {Gauge.create(lat: 32, long: -88.4, name: "Clear Creek", value: "80")}

  it "has valid attributes" do
    expect(gauge.name).to eq("Clear Creek")
    expect(gauge.value).to eq("80")
    expect(gauge.lat).to eq(32)
    expect(gauge.long).to eq(-88.4)
  end

  it "creates gauge objects from api data" do
    Gauge.create_from_api("co")
    expect(Gauge.all.count).to eq(336)
  end

  it "updates gauge values" do
    state = "co"

    Gauge.create_from_api(state)
    old_gauge = Gauge.first
    Gauge.update_values(state)
    new_gauge = Gauge.find(old_gauge.id)

    expect(old_gauge.value).not_to eq(new_gauge.value)
  end

end
