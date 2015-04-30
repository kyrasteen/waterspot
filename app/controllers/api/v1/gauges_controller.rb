class Api::V1::GaugesController < ApplicationController
  respond_to :json

  def index
    geo_gauges = GeoGauges.create(Gauge.all)
    respond_with geo_gauges
  end

end
