class SpotsController < ApplicationController

  def index
    @spots = Spot.all
    @geojson = Array.new

    if current_user
      @spots.each do |spot|
        @geojson << {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [spot.long.to_f, spot.lat.to_f]
          },
          properties: {
            name:   spot.user.username,
            date:   spot.formatted_date,
            rating: spot.rating,
            :'marker-color' => '#00607d',
            :'marker-symbol' => 'circle',
            :'marker-size' => 'small'
          }
        }
      end

      respond_to do |format|
        format.html
        format.json { render json: @geojson }
      end
    else
      redirect_to root_path
      @spots = nil
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:lat, :long)
  end

end
