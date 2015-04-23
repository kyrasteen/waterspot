class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    render json: @spots, status: :ok
  end

  private

  def spot_params
    params.require(:spot).permit(:lat, :long)
  end
end
