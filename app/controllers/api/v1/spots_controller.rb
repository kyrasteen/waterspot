class Api::V1::SpotsController < ApplicationController
  respond_to :json

  def index
    if current_user
      #cache here
      geojson = GeoSpots.create(Spot.all)
      respond_with geojson
    else
      redirect_to root_path
    end
  end

  def show
    respond_with GeoSpots.create([current_user.spots.last])
  end

end
