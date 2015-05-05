require 'rails_helper'

RSpec.describe Api::V1::SpotsController, type: :controller do
  describe "GET #index" do
    xit "responds successfully with 200 ok status" do
      get :index, format: :json
      spots = JSON.parse(response.body)
      spot  = spots.first
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    xit "responds successfully with 200 ok status" do
      user = User.create(username: "lucy", email:"lu@gmail.com", password:"password")
      user.spots.create(lat: 39.0, long:-103.0, rating: 3)
      session[:user_id] = user.id
      get :show, :id => 3
      expect(response).to be_success
    end
  end
end
