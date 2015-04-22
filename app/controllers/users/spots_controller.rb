class Users::SpotsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @spot = current_user.spots.new(spot_params)
    if @spot.save
      flash[:notice] = "Spot saved"
      redirect_to user_path(current_user)
    else
      redirect_to :back
      flash[:error] = "Check the format of your lat and long"
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:lat, :long)
  end

end
