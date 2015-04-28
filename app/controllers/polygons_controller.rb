class PolygonsController < ApplicationController
  def index
    polygons = Polygon.all #pluck shape
    respond_to do |format|
      format.html
      format.json { render json: polygons }
    end
  end
end
