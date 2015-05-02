class Api::V1::AreaWatchesController < ApplicationController
  def create
    #take out logic to model
    spot    = params[:data_value]
    user    = User.find(JSON.parse(params[:data_poly])["properties"]["user_id"])
    head :ok
    UserAreaWatch.send_update_email(user, spot).deliver
  end
end

