require "rails_helper"

describe "User Register", :type => :feature do
  it "can go to register page" do
    visit root_path
    click_link_or_button("register")
    expect(page).to have_content("waterspot")
    expect(page).to have_content("login")
  end
end
