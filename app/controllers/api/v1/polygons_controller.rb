class Api::V1::PolygonsController < ApplicationController
  respond_to :json

  def index
    geo_polygons = GeoPoly.create(Polygon.all)
    spot = GeoSpots.create([current_user.spots.last])
    respond_with data: {polygons: geo_polygons, spot: spot}
  end

  def create
    if current_user
      polygon_object = params[:data_value]
      current_user.polygons.create(shape: polygon_object)
      head :ok
    else
      flash[:error] = "Must be logged in to save an area"
      head :ok
    end
  end

end
