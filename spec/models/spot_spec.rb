require 'rails_helper'

RSpec.describe Spot, type: :model do
  context "is valid" do
    it "with correct attributes" do
      user = User.create(username:'betty', email:'boo@example')
      spot = Spot.new(lat:'38.94977778', long: '38.94977778', user_id: user.id)
      expect(spot).to be_valid
    end
  end

  context "is not valid" do
    it "with missing attributes" do
      user = User.create(username:'betty', email:'boo@example')
      spot = Spot.new(lat:'', long: '', user_id: user.id)
      expect(spot).not_to be_valid
    end

   xit "with incorrect latitude" do
      user = User.create(username:'betty', email:'boo@example')
      spot = Spot.new(lat:'.4556', long: '38.94977778', user_id: user.id)
      expect(spot).not_to be_valid
    end
  end
end
