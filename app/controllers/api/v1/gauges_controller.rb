class Api::V1::GaugesController < ApplicationController
  respond_to :json

  def create
    Gauge.create_from_api(params[:state_id])
    head :ok
  end

  def show
    gauges = Gauge.where(state: params[:id])
    geo_gauges = GeoGauges.create(gauges)
    respond_with geo_gauges
  end

end
