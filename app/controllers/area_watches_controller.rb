class AreaWatchesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    @spot    = params[:data_value]
    @polygon = params[:data_poly]
    redirect_to user_path(current_user) #do I have to do this?
    #parse above things
    #UserAreaWatch.send_update_email(@polygon.user).deliver
  end
end
