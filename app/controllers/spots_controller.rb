class SpotsController < ApplicationController

  def index
    @spots = Spot.all

    if current_user
      geojson = GeoSpots.create(@spots)

      respond_to do |format|
        format.html
        format.json { render json: geojson }
      end
    else
      redirect_to root_path
    end

  end

  private

  def spot_params
    params.require(:spot).permit(:lat, :long)
  end

end
