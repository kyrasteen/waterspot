class SpotsController < ApplicationController

  def index
    @spots = Spot.all
    @geojson = Array.new

    @spots.each do |spot|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [spot.long.to_f, spot.lat.to_f]
        },
        properties: {
          name: spot.user.username,
          date: spot.created_at,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'small'
        }
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end

  end
#  render json: @spots, status: :ok

private

def spot_params
  params.require(:spot).permit(:lat, :long)
end
end
