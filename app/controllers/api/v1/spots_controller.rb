class Api::V1::SpotsController < ApplicationController
  respond_to :json

  def index
    if current_user
      geojson = GeoSpots.create(Spot.all)
      respond_with geojson
    else
      redirect_to root_path
    end
  end

end
