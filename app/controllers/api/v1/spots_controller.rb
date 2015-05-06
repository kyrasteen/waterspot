class Api::V1::SpotsController < ApplicationController
  respond_to :json

  def index
    # is the user being bounced because it's an authentication issue?
    # If so, you might do something like this in the application controller,
    # make it a helper method, then call it in a before filter here:
    # def authorize
    #   redirect_to root_path unless current_user
    # end
    #
    # I should also point out that a redirect_to is meaningless as a json
    # response. You probably want head :unauthorized
    #
    if current_user
      geojson = GeoSpots.create(Spot.all)
      respond_with geojson
    else
      redirect_to root_path
    end
  end

  def show
    # You might have to authorize this as well using the same before filter
    respond_with current_user.spots.last
  end

end
