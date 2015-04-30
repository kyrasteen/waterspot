class Api::V1::GaugesController < ApplicationController
  respond_to :json

  def show
    gauges = Gauge.find_all(params[:id])
    respond_with gauges
  end

end
