require 'rails_helper'

RSpec.describe Spot, type: :model do
  context "is valid" do
    it "with correct attributes" do
      user = User.create(username:'betty', email:'boo@example')
      spot = Spot.create(lat:'38.94977778', long: '38.94977778', user_id: user.id, rating: "5")
      expect(spot).to be_valid
    end
  end

  context "is not valid" do
    it "with missing attributes" do
      user = User.create(username:'betty', email:'boo@example')
      spot = Spot.create(lat:'', long: '', user_id: user.id, rating: "5")
      expect(spot).not_to be_valid
    end

   it "with incorrect latitude" do
      user = User.create(username:'betty', email:'boo@example')
      spot = Spot.create(lat:'.4a56', long: '38.b497k778', user_id: user.id, rating: "5")
      expect(spot).not_to be_valid
    end
  end

  it "has a formatted date" do
    user           = User.create(username: "alex", password: "password", email: "alex@example.com")
    spot           = user.spots.create(lat: 31.330, long: -88.100, rating: "4", created_at:"Fri, 24 Apr 2015 04:17:27 UTC +00:00")

    expect(spot.formatted_date).to eq("Friday, Apr 24")
  end

end
