class Api::V1::SpotsController < ApplicationController
  respond_to :json

  def index
    if current_user
      geospots = GeoSpots.new(current_user)
      geojson = geospots.create(Spot.all)
      respond_with geojson
    else
      redirect_to root_path
    end
  end

  def show
    respond_with current_user.spots.last
  end

end
