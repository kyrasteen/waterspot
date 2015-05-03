class Api::V1::PolygonsController < ApplicationController
  respond_to :json

  def index
    geo_polygons = GeoPoly.create(Polygon.all)
    respond_with geo_polygons
  end

  def create
    if current_user.user.is_a?(Guest)
      flash[:error] = "Must be logged in to save an area"
      head :ok
    else
      polygon_object = params[:data_value]
      current_user.polygons.create(shape: polygon_object)
      head :ok
    end
  end

end
