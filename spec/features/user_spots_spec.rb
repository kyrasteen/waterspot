require "rails_helper"

describe "User Spots", :type => :feature do
  context "When logged in" do
    it "can see all their active spots" do
      user = User.create(username:"betty", email: "boo@example.com", password: "password")
      login_user(user)
      user.spots.create(lat: 38.00112, long: -77.66412)
      visit user_path(user)
      expect(page).to have_content(user.spots.last.lat)
    end

    it "cannot see another users spots" do
      current_user = User.create(username: "betty", email: "boo@example.com", password: "password")
      login_user(current_user)
      current_user.spots.create(lat: 38.00112, long: -77.66412)
      other_user = User.create(username: "ethel", email: "ehtel@example.com", password: "password")
      other_user.spots.create(lat: 39.00, long: 55.333)
      visit user_path(current_user)
      expect(page).to have_content(current_user.spots.last.lat)
      expect(page).not_to have_content(other_user.spots.last.lat)
    end

    it "can make a new spot" do
      user = User.create(username:"betty", email: "boo@example.com", password: "password")
      login_user(user)
      visit user_path(user)
      visit new_user_spot_path(user)
      fill_in('spot_lat', with: 38.00112)
      fill_in('spot_long', with: -48.00112)
      click_link_or_button("save")
      expect(page).to have_content("Spot saved")
      expect(page).to have_content(-48.00112)
    end
  end
end
