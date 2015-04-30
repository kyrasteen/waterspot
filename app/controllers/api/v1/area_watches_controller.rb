class Api::V1::AreaWatchesController < ApplicationController
  def create
    spot    = params[:data_value]
    user    = User.find(JSON.parse(params[:data_poly])["properties"]["user_id"])
    head :ok
    User.send_area_watch_email(user, spot)
  end
end

