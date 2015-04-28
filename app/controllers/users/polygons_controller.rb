class Users::PolygonsController < ApplicationController
  def create
    polygon_object = params[:data_value]
    current_user.polygons.create(shape: polygon_object)
    head :ok
  end
end
