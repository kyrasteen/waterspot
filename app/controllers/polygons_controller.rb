class PolygonsController < ApplicationController
  def index
    polygons = Polygon.all
    respond_to do |format|
      format.html
      format.json { render json: polygons }
    end
  end
end
