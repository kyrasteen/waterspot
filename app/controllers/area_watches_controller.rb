class AreaWatchesController < ApplicationController
  def create
        @spot    = params[:data_value]
        @polygon = params[:data_poly]
  #parse above things
  #UserSpaceNotifier.send_alert_email(current_user).deliver
  end
end
