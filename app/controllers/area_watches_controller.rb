class AreaWatchesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    @spot    = params[:data_value]
    @polygon = params[:data_poly]
    head :ok
    #parse above things
    #UserAreaWatch.send_update_email(@polygon.user).deliver
  end
end
