require 'rails_helper'

RSpec.describe Polygon, type: :model do
  context "is valid" do
    it "with correct attributes" do
      user = User.create(username:'betty', email:'boo@example', password: "password")
      polygon = user.polygons.create(shape:'hello', user_id: user.id)
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

end
