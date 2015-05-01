class Api::V1::PolygonsController < ApplicationController
  respond_to :json

  def index
    geo_polygons = GeoPoly.create(Polygon.all)
    respond_with geo_polygons
  end

  def create
    polygon_object = params[:data_value]
    current_user.polygons.create(shape: polygon_object)
    flash[:notice] = "Area saved"
    head :ok
  end

end
