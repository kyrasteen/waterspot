class Api::V1::AreaWatchesController < ApplicationController
  def create
    update_polygon_user_of_spot(params[:data_poly]["properties"]["user_id"])
    head :ok
  end

  private

  def update_polygon_user_of_spot(params)
    spot    = current_user.spots.last
    user    = User.find(JSON.parse(params))
    UserAreaWatch.send_update_email(user, spot).deliver
  end
end

