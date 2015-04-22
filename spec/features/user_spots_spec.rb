require "rails_helper"

describe "User Spots", :type => :feature do
  context "When logged in" do
    it "can see all their active spots" do
      current_user = User.create(username:"betty", email: "boo@example.com", password: "password")
      current_user.spots.create(lat: "38.00112", long: "-77.66412")
      visit user_path(current_user)
      expect(page).to have_content(current_user.spots.last.lat)
    end

    it "cannot see another users spots" do
      current_user = User.create(username:"betty", email: "boo@example.com", password: "password")
      current_user.spots.create(lat: "38.00112", long: "-77.66412")
      visit user_path(current_user)
      expect(page).to have_content(current_user.spots.last.lat)
    end

    xit "can make a new spot" do
      current_user = User.create(username:"betty", email: "boo@example.com", password: "password")
      visit user_path(current_user)
      visit new_user_spot_path(current_user)
      save_and_open_page
      fill_in('spot[lat]', with: "38.00112")
      fill_in('spot[long]', with: "-48.00112")
      click_link_or_button("save")
      expect(page).to have_content("successfully saved")
      expect(page).to have_content("-48.00112")
    end
  end
end
