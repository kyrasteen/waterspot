class Api::V1::PolygonsController < ApplicationController
  respond_to :json
  before_action :authorize

  def index
    geo_polygons = GeoPoly.create(Polygon.all)
    spot = GeoSpots.create([current_user.spots.last])
    respond_with data: {polygons: geo_polygons, spot: spot}
  end

  def create
    polygon_object = params[:data_value]
    polygon = current_user.polygons.new(shape: polygon_object)
    if polygon.save
      head :ok
    else
      head :bad_request
    end
  end

end
