require 'rails_helper'

RSpec.describe Polygon, type: :model do
  context "is valid" do
    it "with correct attributes" do
      user = User.create(username:'betty', email:'boo@example', password: "password")
      polygon = user.polygons.create(shape:'[34.8, -78.9]', user_id: user.id)
      expect(polygon).to be_valid
    end
  end

  context "is not valid" do
    it "with missing attributes" do
      user = User.create(username:'betty', email:'boo@example', password: "password")
      polygon = user.polygons.create(shape:'', user_id: user.id)
      expect(polygon).not_to be_valid
    end
  end

  it "expires if older than one month" do
    user = User.create(username:'betty', email:'boo@example', password: "password")
    user.polygons.create(shape:'[54.6, -98.1]', user_id: user.id, created_at: Date.today - 40 )
    expect(Polygon.all.first).to eq(user.polygons.first)
    Polygon.expire_outdated
    expect(Polygon.all).to eq([])
  end

end
