class Api::V1::SpotsController < ApplicationController
  respond_to :json

  def index
    if current_user.user.is_a?(Guest)
      redirect_to root_path
    else
      geojson = GeoSpots.create(Spot.all)
      respond_with geojson
    end
  end

  def show
    respond_with GeoSpots.create([current_user.spots.last])
  end

end
