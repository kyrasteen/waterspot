class Api::V1::SpotsController < ApplicationController
  respond_to :json
#  before_action :authenticate

  def index
    if current_user
      geojson = GeoSpots.create(Spot.all)
      respond_with geojson
    else
      redirect_to root_path
    end
  end

  # private

  # def authenticate
  #   authenticate_or_request_with_http_token do |token,_|
  #     ApiKey.exists?(token: token)
  #   end
  # end

end
