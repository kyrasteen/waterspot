require "rails_helper"

describe "Gauge", type: :model do
  it "has valid attributes" do
    gauge = Gauge.create(type_of: "Feature", geometry: {type: "Point", coordinates: [32, -88] }, properties:
                     { name: "Cleer Creek", value: "80" })
    expect(gauge.type_of).to eq("Feature")
  end
end
