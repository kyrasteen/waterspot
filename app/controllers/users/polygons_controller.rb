class Users::PolygonsController < ApplicationController
  def create
    polygon_object = params[:data_value]
    current_user.polygons.create(shape: polygon_object)

    respond_to do |format|
      format.html
      format.json
    end

  end
end
