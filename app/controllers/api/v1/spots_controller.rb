class Api::V1::SpotsController < ApplicationController
  respond_to :json
  before_action :authorize

  def index
    geojson ||= GeoSpots.create(Spot.all)
    respond_with geojson
  end

end
