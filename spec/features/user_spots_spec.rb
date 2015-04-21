require "rails_helper"

describe "User Spots", :type => :feature do
  context "When logged in" do
    it "can see all their active spots" do
      @current_user = User.create(username:"betty", email: "boo@example.com")
      @current_user.spots.create(lat: "38.00112", long: "-77.66412")
      visit root_path
      find(".spot-link").click
      expect(page).to have_content(@current_user.spots.last.lat)
    end
  end
end
