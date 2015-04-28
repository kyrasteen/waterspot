class Api::V1::AreaWatchesController < ApplicationController
  def create
    @spot    = params[:data_value]
    @user    = User.find(JSON.parse(params[:data_poly])["properties"]["user_id"])
    head :ok
    send_email
  end

  private

  def send_email
    UserAreaWatch.send_update_email(@user).deliver
  end
end

