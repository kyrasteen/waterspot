class Api::V1::GaugesController < ApplicationController
  respond_to :json

  def create
    # service = UsgsService.new
    # state = service.gauges(params[:state_id])["queryInfo"]["note"].first["value"]
    # service.gauges(params[:state_id])["timeSeries"].each do |gauge|
    #   Gauge.create(
    #     lat: gauge['sourceInfo']['geoLocation']['geogLocation']['latitude'],
    #     long: gauge['sourceInfo']['geoLocation']['geogLocation']['longitude'],
    #     name: gauge['sourceInfo']["siteName"],
    #     value: gauge['values'][0]['value'][0]['value'],
    #     state: state.match(/\w+/)
    #   )
    # end
    Gauge.create_from_api(params[:state_id])
    head :ok
  end

  def show
    gauges = Gauge.where(state: params[:id])
    geo_gauges = GeoGauges.create(gauges)
    respond_with geo_gauges
  end

end
