class Api::V1::AreaWatchesController < ApplicationController
  def create
    @spot    = params[:data_value]
    # Have you checked to see if this is being parsed by Rails already?
    # At any rate, you can extract it into a private method
    @user    = User.find(JSON.parse(params[:data_poly])["properties"]["user_id"])
    head :ok
    send_email
  end

  private

  def send_email
    UserAreaWatch.send_update_email(@user, @spot).deliver
  end
end

