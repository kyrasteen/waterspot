require "rails_helper"

describe "User Polygons", :type => :feature do

  before(:each) do
    @user = User.create(username:"betty", email: "boo@example.com", password: "password")
    login_user(@user)
  end

  it "as an authenticated user, I can create a polygon" do
    @user.polygons.create(shape:"hello")
    expect(@user.polygons.first.shape).to eq("hello")
  end
end
