require 'rails_helper'

RSpec.describe Api::V1::SpotsController, type: :controller do
  describe "GET #index" do

    before(:each) do
    end

    it "responds successfully with 200 ok status" do
      user = User.create(username: "lucy", email: 'lu@example.com', password: "password")
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      get :index, format: :json

      spots = JSON.parse(response.body)
      spot  = spots.first
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with 200 ok status" do
      user = User.create(username: "lucy", email: 'lu@example.com', password: "password")
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      user.spots.create(lat: 39.0, long:-103.0, rating: 3)
      get :show, format: :json, id: 3
      expect(response.status).to eq(200)
    end
  end
end
