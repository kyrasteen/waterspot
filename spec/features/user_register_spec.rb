require "rails_helper"

describe "User Register", :type => :feature do
  it "can go to register page" do
    visit root_path
    find(".register-link").click
    expect(page).to have_content("waterspot")
    expect(page).to have_content("sign in")
  end
end
