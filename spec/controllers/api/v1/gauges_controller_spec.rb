require "rails_helper"

describe "#show" do
  it "returns gauges for a given state" do
    gauge = Gauge.create_from_api("co")
    get :show, format: :json, id: gauge.state
    gauges = JSON.parse(response.body)
    first_gauge = gauges.first
    expect(first_gauge.state).to eq("co")
  end
end
