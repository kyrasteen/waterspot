class Api::V1::AreaWatchesController < ApplicationController
  def create
    user = JSON.parse(params[:data_poly])["properties"]["user_id"]
    update_polygon_user_of_spot(user)
    head :ok
  end

  private

  def update_polygon_user_of_spot(user)
    spot = current_user.spots.last
    user = User.find(user)
    UserAreaWatch.send_update_email(user, spot).deliver
  end
end

