require 'rails_helper'

RSpec.describe Polygon, type: :model do
  context "is valid" do
    it "with correct attributes" do
      user = User.create(username:'betty', email:'boo@example')
      polygon = user.polygons.create(shape:'hello')
      expect(polygon).to be_valid
    end
  end

end
