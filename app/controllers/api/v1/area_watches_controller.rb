class Api::V1::AreaWatchesController < ApplicationController
  def create
    spot    = current_user.spots.last
    user    = User.find(JSON.parse(params[:data_poly])["properties"]["user_id"])
    head :ok
    UserAreaWatch.send_update_email(user, spot).deliver
  end
end

