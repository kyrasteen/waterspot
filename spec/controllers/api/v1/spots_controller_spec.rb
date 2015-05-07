require 'rails_helper'

describe Api::V1::SpotsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with 200 ok status" do
      user = User.create(username: "lucy", email: 'lu@example.com', password: "password")
      user.spots.create(name: "Boulder creek", rating: "4", lat:38.90992, long:-104.499,)
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      get :index, format: :json

      spots = JSON.parse(response.body)
      spot  = spots.first
      expect(response.status).to eq(200)
      expect(spot['properties']['river_name']).to eq("Boulder creek")
    end
  end
end
