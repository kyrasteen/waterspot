require "rails_helper"

describe Api::V1::GaugesController do
  describe "#show" do
    it "returns gauges for a given state" do
      Gauge.create_from_api("co")
      get :show, format: :json, id: "co"
      gauges = JSON.parse(response.body)
      first_gauge = gauges.first
      expect(response.status).to eq(200)
      expect(first_gauge["type"]).to eq("Feature")
    end
  end
end
