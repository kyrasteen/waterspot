class Api::V1::PolygonsController < ApplicationController
  respond_to :json

  def index
    polygons = Polygon.all #shape and user
    geo_polygons = GeoPoly.create(polygons)
    respond_with geo_polygons
  end

  def create
    polygon_object = params[:data_value]
    current_user.polygons.create(shape: polygon_object)
    head :ok
  end

end
